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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.pet.admin.domain.OrderDetailManage;
import com.fp.pet.admin.domain.OrderManage;
import com.fp.pet.admin.service.DeliveryService;
import com.fp.pet.common.MyUtil;

@Controller
@RequestMapping("/admin/deliveryManage/*")
public class DeliveryManageController {


	/*
	 * // dpingManage
	 * 
	 * @RequestMapping(value = "dpingManage") public String dpingManage(Model model)
	 * throws Exception { model.addAttribute("left","productdpManage");
	 * model.addAttribute("sub","dpingManage"); return
	 * ".admin.deliveryManage.dpingManage"; }
	 */
	
	@Autowired
	private DeliveryService service;
	
	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "dpManage")
	public String dpManage(Model model) throws Exception {
		model.addAttribute("left", "productdpManage");
		model.addAttribute("sub", "dpManage");
		return ".admin.deliveryManage.dpManage";
	}
	
	@RequestMapping(value = "dpEndManage")
	public String dpEndManage(Model model) throws Exception {
		model.addAttribute("left", "productdpManage");
		model.addAttribute("sub", "dpEndManage");
		return ".admin.deliveryManage.dpManage";
	}

	@RequestMapping(value = "deliverylist")
	public String orderList(Model model, @RequestParam(value = "state") String state,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "couponCode") String schType, @RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req, HttpSession session) throws Exception {

		int size = 10;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			state = URLDecoder.decode(state, "utf-8");
		}

		// state { before : 입금전 / after : 결제완료 }
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", state);
		map.put("schType", schType);
		map.put("kwd", kwd);

		dataCount = service.orderCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if (current_page > total_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		List<OrderManage> list = service.listOrder(map);

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);

		return "/admin/deliveryManage/deliveryList";
	}

	@RequestMapping(value = "detailList")
	public String detailList(@RequestParam String orderNum, Model model) throws Exception {

		OrderManage order = service.findById(orderNum);
		// 주문 상세 정보
		List<OrderDetailManage> listDetail = service.orderDetails(orderNum);

		model.addAttribute("order", order);
		model.addAttribute("listDetail", listDetail);

		return "/admin/deliveryManage/modallist";
	}
	
	// delivery
	@PostMapping("delivery")
	@ResponseBody
	public Map<String, Object> delivery(@RequestParam Map<String, Object> paramMap) {
		// 배송 상태 변경
		String state = "true";
		System.out.println("controller");
		try {
			service.updateOrder("delivery", paramMap);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
}
