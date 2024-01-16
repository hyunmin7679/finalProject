package com.fp.pet.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.pet.domain.SessionInfo;
import com.fp.pet.service.UserReportService;

@Controller
@RequestMapping("/userReport/*")
public class UserReportController {

	@Autowired
	private UserReportService service;

	// 커뮤니티
	@PostMapping("report")
	@ResponseBody
	public Map<String, Object> reportForm(@RequestParam Map<String, Object> paramMap, HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";

		try {
			paramMap.put("memberIdx", info.getMemberIdx());

			service.insertReport(paramMap);

		} catch (Exception e) {
			state = "false";
			e.printStackTrace();
		}

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);

		return model;
	}
	
	// 리뷰
	@PostMapping("report2")
	@ResponseBody
	public Map<String, Object> reportForm2(@RequestParam Map<String, Object> paramMap, HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";

		try {

			paramMap.put("memberIdx", info.getMemberIdx());

			service.insertReport(paramMap);

		} catch (Exception e) {
			state = "false";
			e.printStackTrace();
		}

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);

		return model;
	}

}
