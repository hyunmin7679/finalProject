package com.fp.pet.admin.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.pet.admin.domain.CsBoard;
import com.fp.pet.admin.service.CsManageService;
import com.fp.pet.common.FileManager;
import com.fp.pet.common.MyUtil;
import com.fp.pet.domain.SessionInfo;

@Controller
@RequestMapping("/admin/csManage/*")
public class CsManageController {
	
	@Autowired
	public CsManageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="/")
	public String csManagelist(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			Model model) throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		int size = 10;
		int total_pagefaq = 0;
		int dataCountfaq = 0;
		
		dataCountfaq = service.dataCountfaq(map);
		if (dataCountfaq != 0) {
			total_pagefaq = dataCountfaq / size + (dataCountfaq % size > 0 ? 1 : 0);
		}
		
		if (total_pagefaq < current_page) {
			current_page = total_pagefaq;
		}
		
		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<CsBoard> listfaq = service.listfaq(map);
		List<CsBoard> listnotice = service.listnotice(map);
		List<CsBoard> listqna = service.listqna(map);
		
		model.addAttribute("listfaq",listfaq);
		model.addAttribute("listnotice",listnotice);
		model.addAttribute("listqna",listqna);
		model.addAttribute("left","csManage");

		return ".admin.csManage.csManageList";
	}
	
	@RequestMapping(value="writenotice")
	@ResponseBody
	public String noticewrite( HttpSession session,
			CsBoard dto) {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		long memberIdx= info.getMemberIdx();
		
		dto.setMemberIdx(memberIdx);
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "notice";
		
		
		try {
			service.insertNotice(dto);
			service.insertNoticeFile(dto,path);
		} catch (Exception e) {
		}
		
		
		return "redirect:/admin/csManage";
	}
	
	@RequestMapping(value="writefaq")
	@ResponseBody
	public String faqwrite( HttpSession session,
			CsBoard dto) {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String userId= info.getUserId();
		
		dto.setUserId(userId);
		
		
		try {
			service.insertFaq(dto);
		} catch (Exception e) {
		}
		
		
		return "redirect:/admin/csManage";
	}
	
	@RequestMapping(value="updateqna")
	@ResponseBody
	public String qnaupdate( HttpSession session,
			CsBoard dto) {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String answerId= info.getUserId();
		
		dto.setAnswerId(answerId);
		
		
		try {
			service.updateQna(dto);
		} catch (Exception e) {
		}
		
		
		return "redirect:/admin/csManage";
	}

}
