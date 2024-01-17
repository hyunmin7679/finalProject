package com.fp.pet.controller;

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

import com.fp.pet.common.MyUtil;
import com.fp.pet.domain.Coupon;
import com.fp.pet.domain.SessionInfo;
import com.fp.pet.service.CouponReceiveService;

@Controller
@RequestMapping("/couponreceive/*")
public class CouponReceiveController {

	@Autowired
	private CouponReceiveService service;
	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "main")
	public String list(Model model, HttpSession session, HttpServletRequest req,
			@RequestParam(value = "page", defaultValue = "1") int current_page) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		long memberIdx = info.getMemberIdx();

		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("memberIdx", memberIdx);
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

		List<Coupon> list = service.list(map);

		String cp = req.getContextPath();
		String listUrl = cp + "/main/list";

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		return ".couponReceive.couponReceive";
	}

	// couponCom
	@PostMapping("couponCom")
	@ResponseBody
	public Map<String, Object> couponReceive(@RequestParam long couponNum, HttpSession session) {

		Map<String, Object> model = new HashMap<String, Object>();
		String state = "true";

		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			long memberIdx = info.getMemberIdx();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("memberIdx", memberIdx);
			map.put("couponNum", couponNum);

			service.ReceiveCoupon(map);

		} catch (Exception e) {
			e.printStackTrace();
			state = "false";
		}

		model.put("state", state);
		return model;

	}

}
