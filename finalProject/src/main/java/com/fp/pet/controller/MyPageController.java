package com.fp.pet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fp.pet.common.MyUtil;
import com.fp.pet.domain.Order;
import com.fp.pet.domain.Payment;
import com.fp.pet.domain.Product;
import com.fp.pet.domain.SessionInfo;
import com.fp.pet.service.MyPageService;
import com.fp.pet.service.ProductService;
import com.fp.pet.state.OrderState;

@Controller
@RequestMapping("/myPage/*")
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	
	@Autowired
	private ProductService productservice;
	
	@Autowired 
	private MyUtil myUtil;
	
	// 장바구니 리스트
	@GetMapping("cart")
	public String listCart(HttpSession seesion,
						   Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)seesion.getAttribute("member");
		
		List<Order> list = service.listCart(info.getUserId());
		
		model.addAttribute("list", list);
		
		return ".myPage.cart";
	}
	
	// 장바구니 저장
	@PostMapping("saveCart")
	public String saveCart(Order dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			
			service.insertCart(dto);
			
		} catch (Exception e) {
		}
		
		return "redirect:/myPage/cart";
	}
	
	
	// 하나 상품 장바구니 삭제
	@GetMapping("deleteCart")
	public String deleteCart(@RequestParam long detailNum2, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("gubun", "item");
			map.put("userId", info.getUserId());
			map.put("detailNum2", detailNum2);
			
			service.deleteCart(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/myPage/cart"; 
	}
	
	// 선택한 상품(들) 장바구니 삭제
	@PostMapping("deleteListCart")
	public String deleteListCart (@RequestParam List<Long> nums, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("gubun", "list");
			map.put("userId", info.getUserId());
			map.put("list", nums);
			
			service.deleteCart(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/myPage/cart"; 
	}
	
	
	// 장바구니 전체 삭제
	@GetMapping("deleteCartAll")
	public String deleteCartAll(HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("gubun", "all");
			map.put("userId", info.getUserId());
			
			service.deleteCart(map);
			
		} catch (Exception e) {
		}
		
		return "redirect:/myPage/cart";
	}
	
 // ---------------------------------------------------------------------	
	
	// 주문내역 리스트
	@RequestMapping("paymentList")
	public String paymentList(@RequestParam(value = "page", defaultValue = "1") int current_page,
							  HttpServletRequest req, HttpSession session, 
							  Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String cp = req.getContextPath();
		
		int size = 10;
		int total_page, dataCount;
		int total_page2, cancelCount;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberIdx", info.getMemberIdx());
		
		dataCount = service.countPayment(map);
		total_page = myUtil.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		// *******
		cancelCount = service.cancelCount(map);
		
		total_page2 = myUtil.pageCount(cancelCount, size);
		if(current_page > total_page2) {
			current_page = total_page2;
		}
		// ********
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);		
		map.put("size", size);
		
		List<Payment> list = service.listPayment(map);
		List<Payment> cancelList = service.listCancel(map);
		int userPoint = service.userPoint(map);
		
		String listUrl = cp + "/myPage/paymentList";
		String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
		
		String paging2 = myUtil.paging(current_page, total_page2, listUrl); 
		
		String orderState[] = OrderState.ORDERSTATEINFO;  // 주문상태
		String detailState[] = OrderState.DETAILSTATEINFO;  // 주문상태
		String changeSate[] = OrderState.GHANGESORTINFO;  // 주문상태
		
		model.addAttribute("list", list);
		model.addAttribute("cancelList", cancelList);	
		
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("paging", paging);	
		
		model.addAttribute("cancelCount", cancelCount);
		model.addAttribute("total_page2", total_page2);
		model.addAttribute("paging2", paging2);	
		
		model.addAttribute("orderState", orderState);	 // OrderState
		model.addAttribute("detailState", detailState);	 // OrderState
		model.addAttribute("changeSate", changeSate);	 // OrderState
		
		model.addAttribute("userPoint", userPoint);	 
		
		return ".myPage.paymentList";
	}
	
	
	@GetMapping("qna2")
	public String qna2(@RequestParam long productNum, Model model) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productNum", productNum);
		
		Product dto = productservice.findByProduct(productNum);
		
		model.addAttribute("qna", dto);

		return "myPage/productModal";
	}  

	
// **********************************************************************************	
	@GetMapping("orderDetail")
	public String orderDetail(@RequestParam long orderDetailNum, Model model) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orderDetailNum", orderDetailNum);
	
		Payment dto = service.findByDetail(map);
		
		model.addAttribute("vo", dto);

		return "myPage/orderDetail";
	}  
	
// **********************************************************************************	
	
	
	// 구매확정
	@RequestMapping("confirmation")
	public String confirmation(@RequestParam Map<String, Object> paramMap,
							   @RequestParam String page,
							   HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			paramMap.put("detailState", 1); 			// 구매확정
			paramMap.put("stateMemo", "구매확정완료");
			paramMap.put("memberIdx", info.getMemberIdx());
			
			service.updateOrderDetailState(paramMap);
			
		} catch (Exception e) {
	}
		
		return "redirect:/myPage/paymentList?page="+page; 
	}	
	
	/*
	@Scheduled(cron = "0 0/2 * * * ?")
	public String test(Map<String, Object> map, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			map.put("detailState", 2);
			map.put("stateMemo", "자동구매확정완료");
			map.put("memberIdx", info.getMemberIdx());
			
			service.updateOrderDetailState2(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		return "";
		
	}*/
	
	
	// 주문취소/반품/교환요청
	@PostMapping("orderDetailUpdate")
	public String orderDetailUpdate(@RequestParam Map<String, Object> map,
									@RequestParam String page,
									HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			map.put("memberIdx", info.getMemberIdx());
			
			service.updateorderChange(map);
			
		} catch (Exception e) {
		}
		
		return "redirect:/myPage/paymentList?page="+page;
	}
	
	// 회원탈퇴여부
	@GetMapping("updateOrderHistory")
	public String updateOrderHistory(@RequestParam long orderDetailNum,
									 @RequestParam String page,
									 HttpSession session) throws Exception {
		
		try {
			service.updateOrderHistory(orderDetailNum);
		} catch (Exception e) {
		}
		
		return "redirect:/myPage/paymentList?page="+page;
	}		
	
	// -----------------------------------------------------------------------
	// 리뷰
	@GetMapping("review")
	public String review(
			@RequestParam(defaultValue = "review") String mode,
			Model model) throws Exception {
		
		model.addAttribute("mode", mode);
		return ".myPage.review";
	}
	
	// 쿠폰 + 포인트
	@GetMapping("couponPoint")
	public String coupon(@RequestParam(defaultValue = "coupon") String mode,
						 Model model) throws Exception {
		
		model.addAttribute("mode", mode);
		return ".myPage.pointCoupon";
	}

}
