package com.fp.pet.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.pet.admin.domain.Chart;
import com.fp.pet.admin.domain.CommunityManage;
import com.fp.pet.admin.service.CommunityManageService;
import com.fp.pet.common.MyUtil;

@Controller
@RequestMapping("/admin/community/*")
public class CommunityManageController {

	@Autowired
	private CommunityManageService service;

	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "communityManage")
	public String communityManage(Model model) throws Exception {

		List<CommunityManage> list = null;

		list = service.communityList();

		model.addAttribute("list", list);

		model.addAttribute("left", "communityManage");
		model.addAttribute("sub", "communityManage");
		return ".admin.communityManage.communityManage";
	}

	@RequestMapping(value = "bestCategoryList")
	public String bestCategoryList(Model model) throws Exception {

		try {

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/admin/communityManage/bestCategory";
	}

	// bestChart
	@GetMapping("bestChart")
	@ResponseBody
	public Map<String, Object> bestChart() throws Exception {
		Map<String, Object> model = new HashMap<>();

		List<Chart> list = service.bestChart();

		model.put("list", list);
		return model;
	}

	// communityList
	@RequestMapping(value = "communityList")
	public String communityList(Model model, @RequestParam(value = "page", defaultValue = "1") int current_page)
			throws Exception {

		try {

			int size = 10;
			int total_page = 0;
			int dataCount = 0;
			Map<String, Object> map = new HashMap<String, Object>();
			dataCount = service.dataCount(map);

			if (dataCount != 0) {
				total_page = myUtil.pageCount(dataCount, size);
			}
			if (total_page < current_page) {
				current_page = total_page;
			}
			int offset = (current_page - 1) * size;
			if (offset < 0)
				offset = 0;

			map.put("offset", offset);
			map.put("size", size);

			List<CommunityManage> list2 = null;
			list2 = service.communityList2(map);

			String paging = myUtil.pagingMethod(current_page, total_page, "communityList");

			

			model.addAttribute("list2", list2);
			model.addAttribute("page", current_page);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/admin/communityManage/communityList";
	}

	// showState
	// AJAX-JSON

	@PostMapping("showState")
	@ResponseBody
	public Map<String, Object> showState(@RequestParam Map<String,Object> paramap) throws Exception {
		
		
		Map<String, Object> model = new HashMap<String, Object>();

		String state = "false";
		
		try {
			System.out.println("일로넘어오나 ???@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			System.out.println(paramap+"paramapparamapparamapparamapparamapparamap");
			
			service.updateShow(paramap);
			
			state = "true";
		} catch (Exception e) {
		}

		model.put("state", state);

		return model;
	}

}
