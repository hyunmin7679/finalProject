package com.fp.pet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/event/*")
public class EventController {
	
	@RequestMapping("main")
	public String main() throws Exception{
		
		return ".event.main";
	}
	
	@GetMapping("article")
	public String article() throws Exception {
		
		return ".event.article";
	}

}
