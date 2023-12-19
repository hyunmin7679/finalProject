package com.fp.pet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fp.pet.common.MyUtil;
import com.fp.pet.domain.Product;
import com.fp.pet.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@Autowired
	@Qualifier("myUtil")
	private MyUtil myUtil;
	
	@RequestMapping("{productUrl}")
	public String main(@PathVariable String productUrl,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req, Model model)throws Exception{
		Product dto = null;
		String cp = req.getContextPath();
		
		int size = 12;
		int total_page;
		int dataCount;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categoryNum", productUrl);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Product> list = service.listProduct(map);
		
		String listUrl = cp + "/product/"+productUrl;
		
		String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		try {
			long procate = Long.parseLong(productUrl);
			dto = service.findByCategoryName(procate);
			model.addAttribute("dto",dto);
			model.addAttribute("productUrl",productUrl);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".product.main";
	}
	
	@GetMapping("/buy/{productNum}")
	public String buyRequest(@PathVariable String productNum, Model model) throws Exception{
		
		model.addAttribute("productNum",productNum);
		return ".product.buy";
	}
	
}
