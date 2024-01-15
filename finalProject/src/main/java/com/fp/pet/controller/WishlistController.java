package com.fp.pet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.pet.domain.SessionInfo;
import com.fp.pet.domain.Wishlist;
import com.fp.pet.service.WishlistService;

@Controller
@RequestMapping("/wishlist/*")
public class WishlistController {

	@Autowired
	private WishlistService service;

	@RequestMapping(value = "/")
	public String main() {

		return ".wishlist.wishlist";
	}

	@RequestMapping(value = "wishlist")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page, HttpServletRequest req,
			HttpSession session, Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Wishlist dto = null;
		String cp = req.getContextPath();

		int size = 9;
		int total_page;
		int dataCount;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		dataCount = service.dataCount(map);

		List<Wishlist> wishlist = service.listwishlist(map);

		model.addAttribute("dto", dto);
		model.addAttribute("wishlist", wishlist);

		return "/wishlist/list";
	}

	@ResponseBody
	@RequestMapping(value="changeit")
	public String addorremove(@RequestParam int pnum,
			HttpSession session) {

	SessionInfo info = (SessionInfo) session.getAttribute("member");
	
	Map<String, Object> map = new HashMap<String, Object>();
	
	map.put("pnum", pnum);
	map.put("userId", info.getUserId());
	
	try {
		service.addorremove(map);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
			
	return "redirect:/wishlist/";
	
	}
	
}
	
	
	
	
	
	
	
