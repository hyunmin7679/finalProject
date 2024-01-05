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
import com.fp.pet.domain.SessionInfo;
import com.fp.pet.service.MyPageService;
import com.fp.pet.state.OrderState;

@Controller
@RequestMapping("/myPage/*")
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	
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
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberIdx", info.getMemberIdx());
		
		dataCount = service.countPayment(map);
		total_page = myUtil.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);		
		map.put("size", size);
		
		List<Payment> list = service.listPayment(map);
		List<Payment> cancelList = service.listCancel(map);
		
		String listUrl = cp + "/myPage/paymentList";
		String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
		
		String orderState[] = OrderState.ORDERSTATEINFO;  // 주문상태
		String detailState[] = OrderState.DETAILSTATEINFO;  // 주문상태
		
		model.addAttribute("list", list);
		model.addAttribute("cancelList", cancelList);	
		
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("paging", paging);	
		
		model.addAttribute("orderState", orderState);	 // OrderState
		model.addAttribute("detailState", detailState);	 // OrderState
		
		return ".myPage.paymentList";
	}
	
	// 구매확정
	

}
