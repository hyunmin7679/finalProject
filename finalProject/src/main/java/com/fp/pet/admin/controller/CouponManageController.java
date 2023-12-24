package com.fp.pet.admin.controller;

import java.io.File;
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

import com.fp.pet.admin.domain.Coupon;
import com.fp.pet.admin.service.CouponService;
import com.fp.pet.common.MyUtil;

@Controller
@RequestMapping("/admin/couponManage/*")
public class CouponManageController {
	
	@Autowired
	private CouponService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	   public String couponManage(Model model) throws Exception {
	        model.addAttribute("left","couponManage");
	        model.addAttribute("sub","couponManage");
	        return ".admin.couponManage.list";
	}
	   
	@RequestMapping(value = "couponlist")
	public String icons(Model model ,
			@RequestParam(value="category") String category,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "couponCode") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			HttpSession session) throws Exception {
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			category = URLDecoder.decode(category, "utf-8");
		}
		
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
		kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		// category  all : 전체쿠폰, 1: 발급중 쿠폰, 2: 발급끝난쿠폰
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		dataCount = service.dataCount(map);
		
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		if (total_page < current_page) {
			current_page = total_page;
		}
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		List<Coupon> list = service.listCoupon(map);
		
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("schType",schType);
		model.addAttribute("kwd",kwd);
		model.addAttribute("category",category);
		
		return "admin/couponManage/couponlist";
	}   
	
	// 쿠폰 등록
	@PostMapping("couponRegi")
	@ResponseBody
	public Map <String,Object> writeSubmit(Coupon dto) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
			
		try {
			service.insertCoupon(dto);
				
			model.put("state", "true");
		} catch (Exception e) {
			model.put("state", "false");
		}
			
			return model;
	}
	
	// couponDetail
	@GetMapping("couponDetail")
	@ResponseBody
	public List<Coupon> couponDetail(@RequestParam long sort) {
		List<Coupon> list = service.couponDetail(sort);
		return list;
	}
	
	// deleteCoupon
	// AJAX-JSON
	@PostMapping("deleteCoupon")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam long couponNum,
			HttpSession session) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
			

		String state = "false";
		try {
			service.deleteCoupon(couponNum);
			state = "true";
		} catch (Exception e) {
		}
				
		model.put("state", state);

		return model;
	}   
	   
}
