package com.fp.pet.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fp.pet.domain.SessionInfo;
import com.fp.pet.service.UserReportService;

@Controller
@RequestMapping("/userReport/*")
public class UserReportController {
	
	@Autowired
	private UserReportService service;
	
	@PostMapping("report")
	public String reportForm(@RequestParam Map<String, Object> map, 
							 @RequestParam String page,
							 HttpSession session) throws Exception {
	
	 SessionInfo info = (SessionInfo)session.getAttribute("member");
	 
	 try {
		map.put("memberIdx", info.getMemberIdx());
		service.insertReport(map);
		
	} catch (Exception e) {
		e.printStackTrace();
	}
		
	//	return "redirect:/bbs/list?page="+page;
		return "bbs/article";
	}
	
	//@PostMapping

}
