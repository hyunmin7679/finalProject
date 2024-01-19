package com.fp.pet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.pet.common.MyUtil;
import com.fp.pet.domain.Product;
import com.fp.pet.domain.SessionInfo;
import com.fp.pet.domain.Wishlist;
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
	
	@GetMapping("listOptionDetail2")
	@ResponseBody
	public List<Product> listOptionDetail2(@RequestParam long optionNum,
			@RequestParam long optionNum2, @RequestParam long detailNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("optionNum2", optionNum2);
		map.put("detailNum", detailNum);
		List<Product> list = service.listOptionDetailStock(map);
		return list;
	}
	
	@GetMapping("/buy/{productNum}")
	public String buyRequest(@PathVariable String productNum, String friendname
			, Model model,HttpSession session) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			long longNum = Long.parseLong(productNum);
			Product dto = service.findByProduct(longNum);
			
			// 추가 이미지
			List<Product> listFile = service.listProductFile(longNum);
			// 옵션명
			List<Product> listOption = service.listProductOption(longNum);
			// 상위 옵션값
			List<Product> listOptionDetail = null;
			
			map.put("productNum", longNum);
			if(listOption.size() > 0) {
				listOptionDetail = service.listOptionDetail(listOption.get(0).getOptionNum());
			}
			dto.setFilename(dto.getThumbnail());
			listFile.add(0, dto);
			
			model.addAttribute("dto", dto);
			model.addAttribute("productNum",productNum);
			model.addAttribute("listOption", listOption);
			model.addAttribute("listOptionDetail", listOptionDetail);
			model.addAttribute("listFile", listFile);
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			String userId = info.getUserId();
			map.put("userId", userId);
			List<Wishlist> wishlist = service.findwishlist(map);
			
			model.addAttribute("friendname",friendname);
			model.addAttribute("wishlist",wishlist);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ".product.buy";
	}
	
}
