package com.fp.pet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	@RequestMapping("{productUrl}/main")
	public String main(@PathVariable String productUrl, Model model)throws Exception{
		
		model.addAttribute("productUrl",productUrl);
		
		return ".product.main";
	}
}
