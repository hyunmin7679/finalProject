package com.fp.pet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	@GetMapping(value = "main")
	public String main() throws Exception {
		
		return ".notice.main";
	}
}
