package com.fp.pet.admin.controller;

import java.net.URLDecoder;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.pet.admin.domain.OrderDetailManage;
import com.fp.pet.admin.domain.OrderManage;
import com.fp.pet.admin.service.OrderManageService;
import com.fp.pet.common.MyUtil;
import com.fp.pet.domain.SessionInfo;

@Controller
@RequestMapping("/admin/orderManage/*")
public class OrderManageController {

	@Autowired
	private OrderManageService service;

	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "orderManagelist")
	public String productdpManage(Model model) throws Exception {
		model.addAttribute("left", "productdpManage");
		model.addAttribute("sub", "productdpManage");
		return ".admin.orderManage.orderManagelist";
	}

	
    
	@RequestMapping(value = "orderlist")
	public String orderList(Model model, @RequestParam(value = "state") String state,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "couponCode") String schType, 
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam(defaultValue = "") String startDate,
			@RequestParam(defaultValue = "") String endDate,
			HttpServletRequest req, HttpSession session) throws Exception {

		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			state = URLDecoder.decode(state, "utf-8");
			
		}
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		
		
		// state { before : 입금전 / after : 결제완료 }
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", state);
		map.put("schType", schType);
		map.put("searchNum", kwd);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		
		System.out.println(startDate+"startDatestartDatestartDatestartDatestartDatestartDatestartDatestartDate");
		System.out.println(endDate+"endDateendDateendDateendDateendDate");
		
		dataCount = service.dataCount(map);
		
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<OrderManage> list = service.listOrder(map);
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("schType",schType);
		model.addAttribute("kwd",kwd);
		
		
		return "/admin/orderManage/orderList";
	}
	
	
	
	
	
	
	@RequestMapping(value = "detailList")
	public String detailList(@RequestParam String orderNum,
			Model model) throws Exception {
		
		OrderManage order = service.findById(orderNum);
		// 주문 상세 정보
		List<OrderDetailManage> listDetail = service.orderDetails(orderNum);
				
		model.addAttribute("order", order);
		model.addAttribute("listDetail", listDetail);
		
		return "/admin/orderManage/modallist";
	}

	@PostMapping("invoiceNumber")
	@ResponseBody
	public Map<String,Object> invoiceNumber(@RequestParam Map<String,Object> paramMap){
		
		String state = "true";
		
		try {
			 service.updateOrder("invoiceNumber", paramMap);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@PostMapping("cancleAllproduct")
	@ResponseBody
	public Map<String,Object> cancleAllproduct(@RequestParam Map<String,Object> paramMap){
		
		String state = "true";
		
		try {
			// asdsad{orderNum=23422, payment=23000, cancelAmount=0, usedSaved=0}
			service.cancleAllProduct(paramMap);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@GetMapping("listDetailState")
	@ResponseBody
	public Map<String, Object> listDetailState(@RequestParam long orderDetailNum) {
		// 상세주문별 상태 리스트
		List<Map<String, Object>> list = null;
		try {
			
			list = service.listDetailStateInfo(orderDetailNum);
		} catch (Exception e) {
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		return model;
	}
	
	
	@PostMapping("updateDetailState")
	@ResponseBody
	public Map<String, Object> updateDetailState(@RequestParam Map<String, Object> paramMap,
			HttpSession session) {
		System.out.println("일로오긴함 ??????????????????????????? ");
		// 상세주문별 상태 변경
		Map<String, Object> model = new HashMap<String, Object>();
		
		String state = "true";
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			int detailState = Integer.parseInt((String)paramMap.get("detailState"));
			
			paramMap.put("memberIdx1", info.getMemberIdx());
			
			service.updateOrderDetailState(paramMap);
			
			
			model.put("detailState", detailState);
			
		} catch (Exception e) {
			state = "false";
		}
		
		model.put("state", state);
		return model;
	}
}
