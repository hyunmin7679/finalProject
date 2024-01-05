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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fp.pet.admin.domain.Admin;
import com.fp.pet.admin.service.AdminManageService;
import com.fp.pet.domain.SessionInfo;

@Controller
@RequestMapping("/admin/adminManage/*")
public class AdminManageController {
	
	@Autowired
	private AdminManageService service;
	
	@RequestMapping(value="/")
	public String list(
			Model model,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "") String kwd, 
			@RequestParam(defaultValue = "all") String schType,
			HttpServletRequest req) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}

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
		
		List<Admin> list = service.listAdmin(map);
		
		model.addAttribute("list", list);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("left","adminAuthentication");
        model.addAttribute("sub","adminList");
		
		return ".admin.adminManage.adminList";
	}
	
	@RequestMapping(value="adminMypage")
	public String adminMyPage(
			@RequestParam long memberIdx,
			HttpServletRequest req,
			Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberIdx", memberIdx);
		
		List<Admin> list = service.adminInfo(map);
		
		model.addAttribute("list",list);
		model.addAttribute("left","adminAuthentication");
        model.addAttribute("sub","adminAccount");
		return ".admin.adminManage.adminMypage";
	}
	
	@RequestMapping(value="adminMypage2")
	public String adminMyPage2(
			HttpSession session,
			Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		long memberIdx= info.getMemberIdx();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberIdx", memberIdx);
		List<Admin> list = service.adminInfo(map);
		
		model.addAttribute("list",list);
		model.addAttribute("left","adminAuthentication");
        model.addAttribute("sub","adminAccount");
		return ".admin.adminManage.adminMypage";
	}

}
