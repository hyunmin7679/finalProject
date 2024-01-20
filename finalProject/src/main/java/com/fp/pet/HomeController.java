package com.fp.pet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fp.pet.domain.Community;
import com.fp.pet.domain.Product;
import com.fp.pet.service.CommunityService;
import com.fp.pet.service.ProductService;

@Controller
public class HomeController {
	
	@Autowired
	private CommunityService service;
	
	@Autowired
	private ProductService service2;
		
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int size= 10;
		map.put("size", size);
		
		List<Community> list = service.listHomeCommunity();
		List<Product> productList = service2.listProduct2(map);
		List<Product> bestList = service2.listProduct3(map);
		model.addAttribute("productList", productList);
		model.addAttribute("list", list);
		model.addAttribute("bestList",bestList);
		
		return ".home";
	}
	
	
}
