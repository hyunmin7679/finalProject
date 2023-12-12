package com.fp.pet.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainManageController {
	 
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String method(Model model) {
		model.addAttribute("left","dashboard");
		return ".adminLayout";
	}
}
