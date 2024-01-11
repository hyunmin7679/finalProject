package com.fp.pet.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fp.pet.admin.service.AllProductManageService;

@Controller
@RequestMapping("/admin/allProduct/*")
public class AllProductManage {

	@Autowired
	private AllProductManageService service;
	
	// allproductManage
    @RequestMapping(value = "allproductList")
    public String allproductManage(Model model) throws Exception {
    	  model.addAttribute("left","productdpManage");
          model.addAttribute("sub","allproductManage");
          model.addAttribute("state","allProduct");
        return ".admin.allProductManage.orderManagelist";
    }
}
