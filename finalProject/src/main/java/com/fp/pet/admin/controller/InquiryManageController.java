package com.fp.pet.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

// 인콰이어리(1:1 문의)
@Controller
@RequestMapping("/admin/inquiryManage/*")
public class InquiryManageController {

	@RequestMapping(value = "list")
	public String list(Model model) throws Exception {
		model.addAttribute("left","AccountSettings");
		model.addAttribute("sub","Account");
		return ".admin.inquiryManage.list";
	}
	@RequestMapping(value = "list2")
	public String list2(Model model) throws Exception {
		model.addAttribute("left","AccountSettings");
		model.addAttribute("sub","Notifications");
		return ".admin.inquiryManage.list2";
	}

}
