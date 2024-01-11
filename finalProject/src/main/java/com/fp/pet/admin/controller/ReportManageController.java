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

import com.fp.pet.admin.domain.Report;
import com.fp.pet.admin.service.ReportService;
import com.fp.pet.common.MyUtil;
import com.fp.pet.domain.SessionInfo;

@Controller
@RequestMapping("/admin/reportManage/*")
public class ReportManageController {
	
	@Autowired
	private ReportService service;
	
	@Autowired
	private MyUtil myUtil;
	
	
	@RequestMapping(value = "list")
	public String list(Model model) throws Exception{
		 model.addAttribute("left","reportManage");
         model.addAttribute("sub","reportManage");
		return ".admin.reportManage.list";
	}
	
	@RequestMapping(value = "reportList")
	public String reportList(Model model ,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			HttpSession session) throws Exception {
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
		kwd = URLDecoder.decode(kwd, "utf-8");
		}

		
		Map<String, Object> map = new HashMap<String, Object>();
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

		List<Report> list = service.listReport(map);
		
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("schType",schType);
		model.addAttribute("kwd",kwd);
		
		return "admin/reportManage/reportlist";
	}
	
	//findReporyList
	@PostMapping("findReporyList")
	@ResponseBody
	public Map<String, Object> findReporyList(@RequestParam Map<String, Object> paramMap,
			HttpSession session) {
		// 상세주문별 상태 변경
		Map<String, Object> model = new HashMap<String, Object>();
		
		String state = "true";
		
		
		try {
		
			 List<Report> list = service.findReporyList(paramMap);
			
			model.put("list", list);
		} catch (Exception e) {
			state = "false";
		}
		
		model.put("state", state);
		return model;
	}
	
	// changeShow
	@PostMapping("changeShow")
	@ResponseBody
	public Map<String, Object> changeShow(@RequestParam Map<String, Object> paramMap,
			HttpSession session) {
		// 상세주문별 상태 변경
		Map<String, Object> model = new HashMap<String, Object>();
		
		String state = "true";
		
		
		try {
		
			 service.changeShow(paramMap);
			
		} catch (Exception e) {
			state = "false";
		}
		
		model.put("state", state);
		return model;
	}
	
}
