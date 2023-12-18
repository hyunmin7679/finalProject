package com.fp.pet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/bbs/*")
public class BoardController {
	
	@RequestMapping(value = "list")
	public String list() throws Exception{
		
		return ".bbs.list";
	}
}
