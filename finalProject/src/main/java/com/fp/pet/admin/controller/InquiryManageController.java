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
	
	@RequestMapping(value = "adminMypage")
	public String adminAccount(Model model) throws Exception {
		model.addAttribute("left","adminAuthentication");
		model.addAttribute("sub","adminAccount");
		return ".admin.inquiryManage.adminMypage";
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
    
    @RequestMapping(value = "communityManage")
    public String communityManage(Model model) throws Exception {
    	model.addAttribute("left","communityManage");
		model.addAttribute("sub","communityManage");
        return ".admin.inquiryManage.communityManage";
    }
    
    @RequestMapping(value = "scheduleManage")
    public String scheduleManage(Model model) throws Exception {
    	model.addAttribute("left","scheduleManage");
		model.addAttribute("sub","scheduleManage");
        return ".admin.inquiryManage.scheduleManage";
    }
    
 

    @RequestMapping(value = "dpManage")
    public String dpManage(Model model) throws Exception {
    	  model.addAttribute("left","productdpManage");
          model.addAttribute("sub","dpManage");
        return ".admin.inquiryManage.dpManage";
    }
    
    @RequestMapping(value = "productdpManage")
    public String productdpManage(Model model) throws Exception {
    	  model.addAttribute("left","productdpManage");
          model.addAttribute("sub","productdpManage");
        return ".admin.inquiryManage.productdpManage";
    }
    
    // dpingManage
    @RequestMapping(value = "dpingManage")
    public String dpingManage(Model model) throws Exception {
    	  model.addAttribute("left","productdpManage");
          model.addAttribute("sub","dpingManage");
        return ".admin.inquiryManage.dpingManage";
    }
    
    // dpEndManage
    @RequestMapping(value = "dpEndManage")
    public String dpEndManage(Model model) throws Exception {
    	  model.addAttribute("left","productdpManage");
          model.addAttribute("sub","dpEndManage");
        return ".admin.inquiryManage.dpEndManage";
    }
    
    // allproductManage
    @RequestMapping(value = "allproductManage")
    public String allproductManage(Model model) throws Exception {
    	  model.addAttribute("left","productdpManage");
          model.addAttribute("sub","allproductManage");
        return ".admin.inquiryManage.allproductManage";
    }
    
    //cancleProduct
    @RequestMapping(value = "cancleProduct")
    public String cancleProduct(Model model) throws Exception {
    	  model.addAttribute("left","creProductManage");
          model.addAttribute("sub","cancleProduct");
        return ".admin.inquiryManage.cancleProduct";
    }
    
    //returnProduct
    @RequestMapping(value = "returnProduct")
    public String returnProduct(Model model) throws Exception {
    	  model.addAttribute("left","creProductManage");
          model.addAttribute("sub","returnProduct");
        return ".admin.inquiryManage.returnProduct";
    }
    
    //exchangeProduct
    @RequestMapping(value = "exchangeProduct")
    public String exchangeProduct(Model model) throws Exception {
    	  model.addAttribute("left","creProductManage");
          model.addAttribute("sub","exchangeProduct");
        return ".admin.inquiryManage.exchangeProduct";
    }
    
    // reportManage
    @RequestMapping(value = "reportManage")
    public String reportManage(Model model) throws Exception {
    	  model.addAttribute("left","reportManage");
          model.addAttribute("sub","reportManage");
        return ".admin.inquiryManage.reportManage";
    }
    
    
    
    
}
