package com.fp.pet.admin.controller;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.pet.admin.domain.OrderDetailManage;
import com.fp.pet.admin.service.CancleService;
import com.fp.pet.common.MyUtil;
import com.fp.pet.domain.SessionInfo;


@Controller
@RequestMapping("/admin/cancleManage/*")
public class CancleManageController {
	
	@Autowired
	private CancleService service;
	
	@Autowired
	private MyUtil myUtil;
	
	//cancleProduct
    @RequestMapping(value = "{cancleStatus}")
    public String cancleProduct(@PathVariable String cancleStatus, Model model) throws Exception {
    	
    	  model.addAttribute("left","creProductManage");
          model.addAttribute("sub","cancleProduct");
          model.addAttribute("cancleStatus",cancleStatus);
        return ".admin.cancleManage.cancleProduct";
    }
    
    @RequestMapping(value = "{cancleStatus}/orderlist")
	public String orderList(
			@PathVariable String cancleStatus,
			Model model, @RequestParam(value = "state") String state,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "couponCode") String schType, @RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req, HttpSession session) throws Exception {

		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			state = URLDecoder.decode(state, "utf-8");
		}
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		// cancleStatus /  order - 주문취소 , sale - 판매취소 
		// state { ordercancle : 주문취소신청 / ordercanclecom : 주문취소신청완료 / salecancle : 판매취소완료}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", state);
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		dataCount = service.orderCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<OrderDetailManage> list = service.listOrder(map);
		
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

		
		model.addAttribute("state",state);
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("schType",schType);
		model.addAttribute("kwd",kwd);
		
		return "/admin/cancleManage/orderList";
	}
    
    @PostMapping("{cancleStatus}/cancleComplete")
	@ResponseBody
	public Map<String, Object> updateDetailState(
			@PathVariable String cancleStatus,
			@RequestParam Map<String, Object> paramMap) {
		// 상세주문별 상태 변경
		Map<String, Object> model = new HashMap<String, Object>();
		
		String state = "true";
		
		try {
			service.updateCancleComplete(paramMap);
			
			// model.put("detailState", detailState);
			
		} catch (Exception e) {
			state = "false";
		}
		
		model.put("state", state);
		return model;
	}
    
    

}
