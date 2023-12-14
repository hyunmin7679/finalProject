package com.fp.pet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	@RequestMapping("{productUrl}")
	public String main(@PathVariable String productUrl, Model model)throws Exception{
		
		model.addAttribute("productUrl",productUrl);
		
		return ".product.main";
	}
	
	@GetMapping("/{productUrl}/{productNum}")
	public String buyRequest(@PathVariable String productUrl, @PathVariable String productNum, Model model) throws Exception{
		
		
		return ".product.buy";
	}
	
}
