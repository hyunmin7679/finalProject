package com.fp.pet;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fp.pet.domain.Community;
import com.fp.pet.service.CommunityService;

@Controller
public class HomeController {
	
	@Autowired
	private CommunityService service;
		
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		List<Community> list = service.listHomeCommunity();
		
		model.addAttribute("list", list);
		
		return ".home";
	}
	
}
