package com.fp.pet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/myPage/*")
public class MyPagController {
	
	@RequestMapping("paymentList")
	public String main () throws Exception {
		
		return ".myPage.paymentList";
	}

}
