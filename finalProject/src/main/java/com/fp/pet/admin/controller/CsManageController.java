package com.fp.pet.admin.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.pet.admin.domain.CsBoard;
import com.fp.pet.admin.service.CsManageService;
import com.fp.pet.common.FileManager;
import com.fp.pet.common.MyUtil;
import com.fp.pet.domain.SessionInfo;

@Controller
@RequestMapping("/admin/csManage/*")
public class CsManageController {
	
	@Autowired
	public CsManageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="/")
	public String csManagelist(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			Model model) throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		int size = 10;
		int total_pagefaq = 0;
		int dataCountfaq = 0;
		
		dataCountfaq = service.dataCountfaq(map);
		if (dataCountfaq != 0) {
			total_pagefaq = dataCountfaq / size + (dataCountfaq % size > 0 ? 1 : 0);
		}
		
		if (total_pagefaq < current_page) {
			current_page = total_pagefaq;
		}
		
		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<CsBoard> listfaq = service.listfaq(map);
		List<CsBoard> listnotice = service.listnotice(map);
		List<CsBoard> listqna = service.listqna(map);
		
		model.addAttribute("listfaq",listfaq);
		model.addAttribute("listnotice",listnotice);
		model.addAttribute("listqna",listqna);
		model.addAttribute("left","csManage");

		return ".admin.csManage.csManageList";
	}
	
	@RequestMapping(value="writenotice")
	@ResponseBody
	public String noticewrite( HttpSession session,
			CsBoard dto) {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		long memberIdx= info.getMemberIdx();
		
		dto.setMemberIdx(memberIdx);
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "notice";
		
		
		try {
			service.insertNotice(dto);
			service.insertNoticeFile(dto,path);
		} catch (Exception e) {
		}
		
		
		return "redirect:/admin/csManage";
	}
	
	@ResponseBody
	@RequestMapping(value="updatenotice")
	public String noticeupdateForm(@RequestParam(value="nnum")int nnum,
			Model model) {
		
		CsBoard upno = service.findnoticebynum(nnum);
		
		
		
		model.addAttribute("upno",upno);
		return "/admin/csManage";
	}
	
	@RequestMapping(value="writefaq")
	@ResponseBody
	public String faqwrite( HttpSession session,
			CsBoard dto) {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String userId= info.getUserId();
		
		dto.setUserId(userId);
		
		
		try {
			service.insertFaq(dto);
		} catch (Exception e) {
		}
		
		
		return "redirect:/admin/csManage";
	}
	@RequestMapping(value="updatefaq")
	@ResponseBody
	public String updatefaq( HttpSession session,@RequestParam int fnum,
			CsBoard dto) {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String userId= info.getUserId();
		
		dto.setUserId(userId);
		dto.setFnum(fnum);
		
		
		try {
			service.updateFaq(dto);
		} catch (Exception e) {
		}
		
		
		return "redirect:/admin/csManage";
	}
	
	@RequestMapping(value="updateqna")
	@ResponseBody
	public String qnaupdate( HttpSession session,
			CsBoard dto) {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String answerId= info.getUserId();
		
		dto.setAnswerId(answerId);
		
		
		try {
			service.updateQna(dto);
		} catch (Exception e) {
		}
		
		
		return "redirect:/admin/csManage";
	}
	
	@RequestMapping(value="updateqnaupdate")
	@ResponseBody
	public String updateqnaupdate(
			CsBoard dto) {
		
		
		try {
			
			service.updateQnaupdate(dto);
		} catch (Exception e) {
		}
		
		
		return "redirect:/admin/csManage";
	}

	
	@RequestMapping(value="deletenotice")
	@ResponseBody
	public String noticedelete( HttpSession session, @RequestParam int nnum,
			CsBoard dto) {
		
		
		try {
			service.deletenotice(nnum);
		} catch (Exception e) {
		}
		
		
		return "redirect:/admin/csManage";
	}
	
	@RequestMapping(value="deletefaq")
	@ResponseBody
	public String faqdelete( HttpSession session, @RequestParam int fnum,
			CsBoard dto) {
		
		
		try {
			service.deletefaq(fnum);
		} catch (Exception e) {
		}
		
		
		return "redirect:/admin/csManage";
	}
	
	@RequestMapping(value="findfaq")
	@ResponseBody
	public ResponseEntity<CsBoard> findfaq(@RequestParam int fnum) {
        CsBoard dto = new CsBoard();  // Assuming CsBoard is the class for your FAQ data

        try {
            // Assuming your service method returns a CsBoard object
            dto = service.findfaq(fnum);
        } catch (Exception e) {
            // Handle exceptions if necessary
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

        // Return the CsBoard object as JSON
        return new ResponseEntity<>(dto, HttpStatus.OK);
    }
	
	@RequestMapping(value="findqna")
	@ResponseBody
	public ResponseEntity<CsBoard> findqna(@RequestParam int qnum) {
        CsBoard dto = new CsBoard();  // Assuming CsBoard is the class for your FAQ data

        try {
            // Assuming your service method returns a CsBoard object
            dto = service.findqna(qnum);
        } catch (Exception e) {
            // Handle exceptions if necessary
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

        // Return the CsBoard object as JSON
        return new ResponseEntity<>(dto, HttpStatus.OK);
    }

}
