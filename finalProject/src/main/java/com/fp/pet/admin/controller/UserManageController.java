package com.fp.pet.admin.controller;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.pet.admin.service.UserManageService;
import com.fp.pet.common.MyUtil;
import com.fp.pet.domain.Member;
import com.fp.pet.domain.Purchase;

@Controller
@RequestMapping("/admin/userManage/*")
public class UserManageController {

	@Autowired
	public UserManageService service;

	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "/")
	public String users(Model model, @RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "") String kwd, @RequestParam(defaultValue = "all") String schType,
			HttpServletRequest req) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int size = 10;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}

		map.put("schType", schType);
		map.put("kwd", kwd);

		dataCount = service.dataCount(map);

		if (dataCount != 0) {
			total_page = dataCount / size + (dataCount % size > 0 ? 1 : 0);
		}

		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		List<Member> list = service.listUser(map);

		int result = service.userCount(map);
		int todayreg = service.todayregcount(map);
		int yesterreg = service.yesterdayregcount(map);
		String dailyresult;
		int dailydiff = (todayreg - yesterreg);

		if (dailydiff >= 0) {
			dailyresult = "+" + dailydiff;
		} else {
			dailyresult = Integer.toString(dailydiff);
		}

		int activeuser = service.activeuserCount(map);
		int activeuserlastweek=service.activeuserCountlastweek(map);
		int deactiveuser = service.deactiveuserCount(map);
		int purchaseUserCount = service.purchaseUserCount(map);
		int purchaseuserCountweekbefore = service.purchaseuserCountweekbefore(map);
		
		String activeuserdiff;
		int activediffresult= (activeuser - activeuserlastweek);
		if (activediffresult >= 0) {
			activeuserdiff = "+" + activediffresult;
		} else {
			activeuserdiff = Integer.toString(activediffresult);
		}
		
		String purchasediff;
		int purchaseUserCountdiff = (purchaseUserCount - purchaseuserCountweekbefore);
		if (purchaseUserCountdiff >= 0) {
			purchasediff = "+" + purchaseUserCountdiff;
		} else {
			purchasediff = Integer.toString(purchaseUserCountdiff);
		}
		model.addAttribute("left","UserControl");
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("result", result);
		model.addAttribute("dailyresult", dailyresult);
		model.addAttribute("activeuser", activeuser);
		model.addAttribute("deactiveuser", deactiveuser);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		model.addAttribute("purchaseUserCount", purchaseUserCount);
		model.addAttribute("activeuserdiff", activeuserdiff);
		model.addAttribute("purchasediff", purchasediff);

		return ".admin.userManage.userList";
	}

	@RequestMapping(value = "userinfo")
	public String userinfo(@RequestParam long memberIdx, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("memberIdx", memberIdx);
		List<Member> list = service.listUserinfo(map);
		
		List<Purchase> catanaly = service.catanaly(map);
		List<Purchase> purchaselist = service.purchaselist(map);
				
		model.addAttribute("list", list);
		model.addAttribute("catanaly", catanaly);
		model.addAttribute("purchaselist", purchaselist);
		
		return ".admin.userManage.userInfo";
	}
	

	@RequestMapping(value = "{orders}/list")
	public String userlist(Model model,
			@PathVariable int orders,
			@RequestParam(value = "page", defaultValue = "1")int current_page,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam(defaultValue = "all") String schType,
			HttpServletRequest req
			) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		System.out.println(orders);
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		map.put("orders", orders);
		map.put("schType", schType);
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
		
		
		List<Member> list = service.listUser(map);
	
		
		int result=service.userCount(map);		
		int todayreg = service.todayregcount(map);
		int yesterreg = service.yesterdayregcount(map);
		String dailyresult;
		int dailydiff=(todayreg-yesterreg);
		
		if(dailydiff>=0) {
			dailyresult="+"+dailydiff;			
		}else {
			dailyresult= Integer.toString(dailydiff);	
		}
		
		int activeuser=service.activeuserCount(map);
		int deactiveuser=service.deactiveuserCount(map);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("result",result);
		model.addAttribute("dailyresult",dailyresult);
		model.addAttribute("activeuser",activeuser);
		model.addAttribute("deactiveuser",deactiveuser);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		
		return "admin/userManage/list";	
	}

	
	@RequestMapping(value="{memberIdx}/sanction")
	@ResponseBody
	public String enablesanction(
		@PathVariable int memberIdx,
		@RequestParam int sancNum,
		@RequestParam String sancMemo,
		Model model
			)  throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("memberIdx", memberIdx);
		map.put("sancNum", sancNum);
		map.put("sancMemo", sancMemo);
		service.sancuser(map);
		
		
		
		return "redirect:/admin/userManage/list";
	}
	
	
	@RequestMapping(value="{memberIdx}/unsanction")
	@ResponseBody
	public String enableunsanction(
		@PathVariable int memberIdx,
		Model model
			)  throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("memberIdx", memberIdx);
		service.unsancuser(map);
		
		
		
		return "redirect:/admin/userManage/list";
	}

	

}
