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
import com.fp.pet.domain.Icon;
import com.fp.pet.domain.SessionInfo;
import com.fp.pet.service.UserIconService;

@Controller
@RequestMapping("/iconStore/*")
public class IconController {

	@Autowired
	private UserIconService service;
	
	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "list")
	public String icons(Model model ,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");	
		
		int size = 50;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberIdx", info.getMemberIdx());
		
		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		if (total_page < current_page) {
			current_page = total_page;
		}
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		// 아이콘리스트
		List<Icon> list = service.listIcon2(map);
		Icon vo = service.findByIcon(info.getMemberIdx());
				
		int userPoint = service.userPoint(info.getMemberIdx());
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("point",userPoint);
		model.addAttribute("vo", vo);

		return ".myPage.iconStore";
	}
	
	@PostMapping("buy")
	@ResponseBody
	public Map<String, Object> buyIcons(@RequestParam long iconNum,
			@RequestParam int iconPrice,
			HttpSession session) {
		Map<String, Object> model = new HashMap<String, Object>();

		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Icon vo = new Icon();
		vo.setMemberIdx(info.getMemberIdx());
		vo.setIconPrice(iconPrice);
		vo.setIconNum(iconNum);
		
		//보유 포인트 확인
		int userPoint = service.userPoint(info.getMemberIdx());
		
		String state = "true";
		try {
			if(userPoint >= iconPrice) {
				// 포인트 차감
				service.updateUserPoint(vo);
				// 아이콘 보유리스트에 추가
				service.insertIconList(vo);
			} else {
				state = "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
			state = "false";
			
		}
		
		model.put("state", state);		
		return model;
	}
	
	
	
	
}
