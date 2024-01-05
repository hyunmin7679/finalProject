package com.fp.pet.controller;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fp.pet.domain.Friend;
import com.fp.pet.domain.SessionInfo;
import com.fp.pet.service.FriendService;

@Controller
@RequestMapping("/friend/*")
public class FriendController {
	@Autowired
	private FriendService service;
	
	@RequestMapping("list")
	public String listfriend(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session,
			HttpServletRequest req, Model model) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> map = new HashMap<String, Object>();
		
		int size = 5; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
		
		map.put("userId", info.getUserName());
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		map.put("kwd", kwd);

		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = dataCount / size + (dataCount % size > 0 ? 1 : 0);
		}
		
		if (total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);
		
		List<Friend> list = service.listFriend(map);
		List<Friend> receivedlist = service.receivedlist(map);
		model.addAttribute("receivedlist", receivedlist);
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("kwd", kwd);
		
		return ".friend.list";
	}
	
	@RequestMapping("addfriendlist")
	public String addfriend(@RequestParam(defaultValue = "") String kwd,
			HttpSession session,
			HttpServletRequest req, Model model) throws Exception{

		Map<String, Object> map = new HashMap<String, Object>();
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		map.put("kwd", kwd);
		
		List<Friend> list = service.searchMember(map);

		model.addAttribute("kwd", kwd);
		model.addAttribute("list", list);

		return ".friend.list2";
	}
	
	@PostMapping("addfriend")
	public String addFriend(Friend dto,
			HttpSession session) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		try {
			dto.setUserId(info.getUserName());
			service.addFriend(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/friend/list";
	}
	
	@PostMapping("accept")
	public String acceptfriend(Friend dto,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserName());
			service.acceptFriend(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/friend/list";
	}
	
	@PostMapping("delete")
	public String deletefriend(Friend dto,
			HttpSession session) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserName());
			service.deleteFriend(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/friend/list";
	}

}
