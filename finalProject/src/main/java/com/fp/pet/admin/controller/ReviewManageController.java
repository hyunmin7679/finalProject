package com.fp.pet.admin.controller;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.pet.admin.domain.Review;
import com.fp.pet.admin.service.ReviewManageService;
import com.fp.pet.common.MyUtilBootstrap;

@Controller
@RequestMapping("/admin/reviewManage/*")
public class ReviewManageController {
	
	@Autowired
	private MyUtilBootstrap myUtil;
	
	@Autowired
	public ReviewManageService service;
	
	@RequestMapping(value="/")
	public String reviews(Model model) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		int dataCount = 0;
		dataCount = service.dataCount(map);
		int avgscore=service.avgscore(map);
		int reviewweek=service.reviewweek(map);
		System.out.println(reviewweek);
		List<Review> scorelist = service.reviewavg(map);
		List<Review> reviewupdown = service.reviewupdown(map);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("left","reviewManage");
		model.addAttribute("avgscore", avgscore);
		model.addAttribute("scorelist", scorelist);
		model.addAttribute("reviewweek", reviewweek);
		model.addAttribute("reviewupdown",reviewupdown);
		return ".admin.reviewManage.reviewList";
	}
	
	@RequestMapping(value="list")
	public String reviewlist(
			Model model,
			@RequestParam(value = "sort", defaultValue = "10") int sort,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "") String kwd, 
			HttpServletRequest req
			) throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		map.put("sort", sort);
		map.put("kwd", kwd);
		
		dataCount = service.dataCount(map);

		if (dataCount != 0) {
			total_page = dataCount / size + (dataCount % size > 0 ? 1 : 0);
		}

		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;

		map.put("offset", offset);
		map.put("size", size);
		String paging = myUtil.pagingMethod(current_page, total_page, "reviewlist");
		List<Review> list = service.listReview(map);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("kwd", kwd);
		model.addAttribute("paging", paging);
		
		
		return "admin/reviewManage/list";
		
	}
	@ResponseBody
	@RequestMapping(value="{reviewnumber}/hide")
	public String hidereview(
			@PathVariable int reviewnumber) {
		
		try {
			service.hidereview(reviewnumber);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/admin/reviewManage/list";
	}
	
	@ResponseBody
	@RequestMapping(value="{reviewnumber}/show")
	public String showreview(
			@PathVariable int reviewnumber) {
		
		try {
			service.showreview(reviewnumber);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/admin/reviewManage/list";
	}
	
	@ResponseBody
	@RequestMapping(value="{reviewnumber}/reviewanswer")
	public String reviewanswer(
			@PathVariable int reviewnumber,
			@RequestParam String sancMemo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("sancMemo", sancMemo);
		map.put("reviewnumber", reviewnumber);
		
		try {
			service.reviewanswer(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/admin/reviewManage/list";
	}
	

}
