package com.fp.pet.admin.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.pet.admin.domain.Icon;
import com.fp.pet.admin.service.IconService;
import com.fp.pet.common.MyUtil;

@Controller
@RequestMapping("/admin/iconManage/*")
public class IconManageController {

	@Autowired
	private IconService service;

	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "list")
	public String list(Model model) throws Exception {
		model.addAttribute("left", "iconControl");
		model.addAttribute("sub", "icons");
		return ".admin.iconManage.list";
	}

	@RequestMapping(value = "icons")
	public String icons(Model model, @RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType, @RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req, HttpSession session) throws Exception {

		int size = 50;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);

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

		List<Icon> list = service.listIcon(map);

		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);

		return "admin/iconManage/iconlist";
	}

	// 아이콘 등록
	@PostMapping("iconRegi")
	@ResponseBody
	public Map<String, Object> writeSubmit(Icon dto, HttpSession session) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();

		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "photo";

		try {

			service.insertIcon(dto, path);

			model.put("state", "true");
		} catch (Exception e) {
			model.put("state", "false");
		}

		return model;
	}

	// 아이콘 삭제
	// AJAX-JSON
	@PostMapping("deleteIcon")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam long iconNum, @RequestParam String iconImage, HttpSession session)
			throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "photo" + File.separator + iconImage;

		String state = "false";
		try {
			System.out.println(iconNum + "asdasddnkjsnaskjdnfkjsdnakjfnasdkjfnkjsadnfkjsdnfkjasndkjfnsdkjnk");
			service.deleteIcon(iconNum, pathname);
			state = "true";
		} catch (Exception e) {
		}

		model.put("state", state);

		return model;
	}

	// 아이콘 수정
	@PostMapping("iconUpdate")
	@ResponseBody
	public Map<String, Object> iconUpdate(Icon dto, HttpSession session) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();

		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "photo";

		try {

			service.updateIcon(dto, path);

			model.put("state", "true");
		} catch (Exception e) {
			model.put("state", "false");
		}

		return model;
	}

}
