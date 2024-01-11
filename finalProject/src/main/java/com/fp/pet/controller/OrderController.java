package com.fp.pet.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fp.pet.domain.Member;
import com.fp.pet.domain.Order;
import com.fp.pet.domain.SessionInfo;
import com.fp.pet.service.MemberService;
import com.fp.pet.service.OrderService;

@Controller
@RequestMapping("/order/*")
public class OrderController {
	@Autowired
	private OrderService orderService;

	@Autowired
	private MemberService memberService;
	
	@RequestMapping("payment")
	public String paymentForm(
			@RequestParam List<Long> productNums, 
			@RequestParam List<Long> detailNums,
			@RequestParam List<Long> detailNums2,
			@RequestParam List<Integer> buyQtys,
			@RequestParam(defaultValue = "buy") String mode,
			HttpSession session,
			Model model) throws Exception {
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			Member orderUser = memberService.findById(info.getMemberIdx());
			Order point = orderService.findPoint(info.getMemberIdx());
			
			String productOrderNumber = null; // 주문번호
			String productOrderName = ""; // 주문상품번호
			int totalMoney = 0; // 상품합
			int deliveryCharge = 0; // 배송비
			int payment = 0;  // 결제할 금액(상품합 + 배송비)
			int totalSavedMoney = 0; // 적립금 총합
			int totalDiscountPrice = 0; // 총 할인액
			
			productOrderNumber = orderService.productOrderNumber();
			
			/*
			List<Payment> listProduct = new ArrayList<Payment>();
			for(int i = 0; i < productNums.size(); i++) {
				Payment dto = orderService.readProduct(productNums.get(i));
				listProduct.add(dto);
				
				Payment detail = orderService.readOptionDetail(detailNums.get(i));
				Payment detail2 = orderService.readOptionDetail(detailNums2.get(i));
				
				dto.setQty(buyQtys.get(i));
				dto.setProductMoney(buyQtys.get(i) * dto.getSalePrice());

				dto.setDetailNum(detail.getDetailNum());
				dto.setOptionName(detail.getOptionName());
				dto.setOptionValue(detail.getOptionValue());
				
				dto.setDetailNum2(detail2.getDetailNum());
				dto.setOptionName2(detail2.getOptionName());
				dto.setOptionValue2(detail2.getOptionValue());
				
				totalSavedMoney += (dto.getSavedMoney() * buyQtys.get(i));
				totalMoney += buyQtys.get(i) * dto.getSalePrice();
				totalDiscountPrice += buyQtys.get(i) * dto.getDiscountPrice();
				if(i == 0 || deliveryCharge > dto.getDelivery()) {
					deliveryCharge = dto.getDelivery();
				}
			}
			*/
			
			List<Map<String, Long>> list = new ArrayList<Map<String,Long>>();
			for(int i = 0; i < detailNums.size(); i++) {
				Map<String, Long> map = new HashMap<String, Long>();
				map.put("detailNum", detailNums.get(i));
				map.put("detailNum2", detailNums2.get(i));
				list.add(map);
			}
			
			List<Order> listProduct = orderService.listProduct(list,info.getMemberIdx());
			for(int i = 0; i < listProduct.size(); i++) {
				Order dto = listProduct.get(i);
				
				dto.setQty(buyQtys.get(i));
				dto.setProductMoney(buyQtys.get(i) * dto.getSalePrice());
				
				totalSavedMoney += (buyQtys.get(i) * dto.getSavedMoney());
				dto.setSavedMoney(buyQtys.get(i) * dto.getSavedMoney());
				
				totalMoney += buyQtys.get(i) * dto.getSalePrice();
				totalDiscountPrice += buyQtys.get(i) * dto.getDiscountPrice();
				if(i == 0 || deliveryCharge > dto.getDelivery()) {
					deliveryCharge = dto.getDelivery();
				}
			}
			
			productOrderName = listProduct.get(0).getProductName();
			if(listProduct.size() > 1) {
				productOrderName += " 외 " + (listProduct.size() - 1) + "건";
			}
			
			deliveryCharge = totalMoney >= 200000 ? 0 : deliveryCharge;
			payment = totalMoney + deliveryCharge;
			
			model.addAttribute("productOrderNumber", productOrderNumber); // 주문 번호
			model.addAttribute("orderUser", orderUser); // 주문 유저
			model.addAttribute("productOrderName", productOrderName); // 주문 상품명
			
			model.addAttribute("point",point); // 보유 포인트
			model.addAttribute("listProduct", listProduct);
			model.addAttribute("totalMoney", totalMoney); // 총금액 (수량*할인가격 의 합)
			model.addAttribute("payment", payment); // 결제할 금액
			model.addAttribute("totalSavedMoney", totalSavedMoney); // 총 적림예정액
			model.addAttribute("totalDiscountPrice", totalDiscountPrice); // 할인 총액
			model.addAttribute("deliveryCharge", deliveryCharge); // 배송비
			
			model.addAttribute("mode", mode); // 바로구매인지 장바구니 구매인지를 가지고 있음
			
			return ".order.payment";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
	}

	@PostMapping("paymentOk")
	public String paymentSubmit(Order dto, 
			@RequestParam(defaultValue = "buy") String mode,
			RedirectAttributes reAttr,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setMemberIdx(info.getMemberIdx());
			orderService.insertOrder(dto);
			
			if(mode.equals("cart")) {
				// 구매 상품에 대한 장바구니 비우기
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("gubun", "list");
				map.put("userId", info.getUserId());
				map.put("list", dto.getDetailNums2());
				
				orderService.deleteCart(map);
			}
			
			String p = String.format("%,d", dto.getPayment());
			
			StringBuilder sb = new StringBuilder();
			sb.append(info.getUserName() + "님 상품을 구매해 주셔서 감사 합니다.<br>");
			sb.append("구매 하신 상품의 결제가 정상적으로 처리되었습니다.<br>");
			sb.append("결제 금액 : <label class='fs-5 fw-bold text-primary'>" +  p + "</label>원");

			reAttr.addFlashAttribute("title", "상품 결제 완료");
			reAttr.addFlashAttribute("message", sb.toString());
			
			return "redirect:/order/complete";
		} catch (Exception e) {
		}
		
		return "redirect:/";
	}
	
	@GetMapping("complete")
	public String complete(@ModelAttribute("title") String title, 
			@ModelAttribute("message") String message
			) throws Exception {
		// F5를 누른 경우
		if (message == null || message.length() == 0) { 
			return "redirect:/";
		}
		
		return ".order.complete";
	}
	
	@GetMapping("coupon")
	public String coupon(@RequestParam long productNum) {
		
		return "";
	}


}
