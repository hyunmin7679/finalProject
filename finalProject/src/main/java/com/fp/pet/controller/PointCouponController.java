package com.fp.pet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fp.pet.common.MyUtil;
import com.fp.pet.domain.PointCoupon;
import com.fp.pet.domain.SessionInfo;
import com.fp.pet.service.PointCouponService;

@RestController
@RequestMapping("/coupon/*")
public class PointCouponController {
	
	@Autowired
	private PointCouponService service;
	
	@Autowired
	private MyUtil myUtil;
	
	// 쿠폰
	@GetMapping("myCoupon")
	public Map<String, Object> list(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
									 HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> model = new HashMap<String, Object>();
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int size = 10;
			int dataCount = 0;
			
			map.put("memberIdx", info.getMemberIdx());
			dataCount = service.dataCount(map);
			
			int total_page = myUtil.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}

			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;

			map.put("offset", offset);
			map.put("size", size);

			List<PointCoupon> list = service.listCoupon(map);
			
			String paging = myUtil.pagingFunc(current_page, total_page, "listCoupon");
			
			model.put("list", list);
			
			model.put("dataCount", dataCount);
			model.put("size", size);
			model.put("pageNo", current_page);
			model.put("paging", paging);
			model.put("total_page", total_page);
			
		} catch (Exception e) {
		}
		
		return model;
	}
	
	
	// 포인트
	@GetMapping("point")
	public Map<String, Object> list2(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
									 HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> model = new HashMap<String, Object>();
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int size = 20;
			int dataCount = 0;
			
			map.put("memberIdx", info.getMemberIdx());
			dataCount = service.dataCount2(map);
			
			int total_page = myUtil.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}

			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;

			map.put("offset", offset);
			map.put("size", size);

			List<PointCoupon> list = service.listPoint(map);
			
			int userPoint = 0;
			userPoint = service.userPoint(map);
			
			String paging = myUtil.pagingFunc(current_page, total_page, "listPoint");
			
			model.put("list", list);
			
			model.put("dataCount", dataCount);
			model.put("size", size);
			model.put("pageNo", current_page);
			model.put("paging", paging);
			model.put("total_page", total_page);
			
			model.put("userPoint", userPoint);
			
			model.put("mode", "point");
			
		} catch (Exception e) {
		}
		
		return model;
	}

}
