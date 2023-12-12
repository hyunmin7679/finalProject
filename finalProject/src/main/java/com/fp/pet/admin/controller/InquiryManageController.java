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
	
	@RequestMapping(value = "users")
	public String users(Model model) throws Exception {
		model.addAttribute("left","UserControl");
		model.addAttribute("sub","userlist");
		return ".admin.inquiryManage.users";
	}
	
	@RequestMapping(value = "usersinfo")
	public String usersinfo(Model model) throws Exception {
		model.addAttribute("left","UserControl");
		model.addAttribute("sub","usersinfo");
		return ".admin.inquiryManage.usersinfo";
	}
	
	@RequestMapping(value = "adminList")
	public String adminList(Model model) throws Exception {
		model.addAttribute("left","adminAuthentication");
		model.addAttribute("sub","adminList");
		return ".admin.inquiryManage.adminList";
	}
	
	@RequestMapping(value = "adminAccount")
	public String adminAccount(Model model) throws Exception {
		model.addAttribute("left","adminAuthentication");
		model.addAttribute("sub","adminAccount");
		return ".admin.inquiryManage.adminAccount";
	}
	
	
	@RequestMapping(value = "icons")
	public String icons(Model model) throws Exception {
		model.addAttribute("left","iconControl");
		model.addAttribute("sub","icons");
		return ".admin.inquiryManage.icons";
	}
	
	@RequestMapping(value = "reviewManage")
    public String reviewManage(Model model) throws Exception {
		model.addAttribute("left","reviewManage");
		model.addAttribute("sub","reviewManage");
        return ".admin.inquiryManage.reviewManage";
    }

    @RequestMapping(value = "productManage")
    public String productManage(Model model) throws Exception {
    	model.addAttribute("left","productManage");
		model.addAttribute("sub","productManage");
        return ".admin.inquiryManage.productManage";
    }

    @RequestMapping(value = "csManage")
    public String csManage(Model model) throws Exception {
    	model.addAttribute("left","csManage");
		model.addAttribute("sub","csManage");
        return ".admin.inquiryManage.csManage";
    }
	

}
