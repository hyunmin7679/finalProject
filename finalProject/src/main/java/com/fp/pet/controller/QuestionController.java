package com.fp.pet.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fp.pet.common.MyUtil;
import com.fp.pet.domain.Qna;
import com.fp.pet.domain.SessionInfo;
import com.fp.pet.service.QnaService;

@RestController // @Controller + @ResponseBody
@RequestMapping("/proqna/*")
public class QuestionController {
	@Autowired
	private QnaService qnaservice;
	
	@Autowired
	private MyUtil myUtil;
	
	@GetMapping("list")
	public Map<String, Object> list(
			@RequestParam long productNum,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int size = 5;
			int dataCount = 0;
			
			map.put("productNum", productNum);
			
			dataCount = qnaservice.dataCount(map);
			int total_page = myUtil.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}

			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;

			map.put("offset", offset);
			map.put("size", size);

			
			List<Qna> list = qnaservice.listQna(map);
			for(Qna dto : list) {
				if(dto.getSecret() == 1 && (info == null || (info.getMembership() < 50 && dto.getMemberIdx() != info.getMemberIdx()))) {
					dto.setQuestion("비밀글 입니다. <i class='bi bi-file-lock2'></i>");
					dto.setAnswer("");
					dto.setListFilename(null);
					
				}
			}
			
			String paging = myUtil.pagingFunc(current_page, total_page, "listQuestion");
			//List<Qna> listFile = qnaservice.listQnaFile(num);
			
			model.put("list", list);
			model.put("dataCount", dataCount);
			model.put("size", size);
			model.put("pageNo", current_page);
			model.put("paging", paging);
			model.put("total_page", total_page);
			//model.put("listFile", listFile);

			
		} catch (Exception e) {
		}
		
		return model;
	}
	
	@PostMapping("write")
	public Map<String, Object> writeSubmit(HttpSession session,			
										   Qna dto) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "qna";
		
		Map<String, Object> map = new HashMap<String, Object>();
		String state = "true";
		
		try {
			dto.setMemberIdx(info.getMemberIdx());
			qnaservice.insertQna(dto, pathname);
			
		} catch (Exception e) {
			state = "false";
		}
		
		map.put("state", state);

		return map;
	}

	
// ------------------------------------------------------------	
	@GetMapping("list2")
	public Map<String, Object> list2(
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int size = 10;
			int dataCount = 0;
			
			map.put("memberIdx", info.getMemberIdx());
			
			dataCount = qnaservice.dataCount3(map);
			int total_page = myUtil.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}

			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;

			map.put("offset", offset);
			map.put("size", size);

			List<Qna> list = qnaservice.listQna2(map);
			
			String paging = myUtil.pagingFunc(current_page, total_page, "listQna");
			
			model.put("list", list);
			model.put("dataCount", dataCount);
			model.put("size", size);
			model.put("pageNo", current_page);
			model.put("paging", paging);
			model.put("total_page", total_page);
			
		} catch (Exception e) {
		}
		
		return model;
	}

	@PostMapping("delete")
	public Map<String, Object> delete(@RequestParam long num,
			@RequestParam String pageNo,
			HttpSession session) throws Exception {

		String state ="false";
		
		try {
				String root = session.getServletContext().getRealPath("/");
				String pathname = root + "uploads" + File.separator + "qna";
				
				qnaservice.deleteQna(num, pathname);
				state = "true";			
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
}
