package com.fp.pet.controller;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.pet.common.FileManager;
import com.fp.pet.common.MyUtil;
import com.fp.pet.domain.Qna;
import com.fp.pet.domain.SessionInfo;
import com.fp.pet.service.QnaService;


// 문의사항
@Controller
@RequestMapping("/qna/*")
public class QnaController {
	@Autowired
	private QnaService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;

	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			Model model) throws Exception {

		String cp = req.getContextPath();

		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}

		// 전체 페이지 수
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
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		// 글 리스트
		List<Qna> list = service.listQna(map);

		String query = "";
		String listUrl = cp + "/qna/list";
		String articleUrl = cp + "/qna/article?page=" + current_page;
		if (kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}

		if (query.length() != 0) {
			listUrl += "/qna/list?" + query;
			articleUrl += "/qna/article?page=" + current_page + "&" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);

		return ".qna.list";
	}

	
	@GetMapping("write")
	public String writeForm(HttpSession session, Model model) throws Exception {
		
		model.addAttribute("mode", "write");
		return ".qna.write";
	}

	@PostMapping("write")
	public String writeSubmit(HttpSession session,			
			Qna dto) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "qna";
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
			dto.setMemberIdx(info.getMemberIdx());
			
			service.insertQna(dto, pathname);
		} catch (Exception e) {
		}

		return "redirect:/qna/list";
	}

	@GetMapping("article")
	public String article(@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session,
			Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		kwd = URLDecoder.decode(kwd, "utf-8");

		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		Qna dto = service.findById(num);
		if (dto == null) {
			return "redirect:/qna/list?" + query;
		}

		if (dto.getSecret() == 1 && (info.getMemberIdx() != dto.getMemberIdx()) 
				&& info.getMembership() < 31 ) {
			return "redirect:/qna/list?" + query;
		}
		
		dto.setQuestion(dto.getQuestion().replaceAll("\n", "<br>"));
		
		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", dto.getNum());
		map.put("schType", schType);
		map.put("kwd", kwd);

		Qna prevDto = service.findByPrev(map);
		Qna nextDto = service.findByNext(map);
		
		List<Qna> listFile = service.listQnaFile(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("prevDto", prevDto);
		model.addAttribute("nextDto", nextDto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("page", page);
		model.addAttribute("query", query);

		return ".qna.article";
	}
	
	@GetMapping("update")
	public String updateForm(@RequestParam long num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Qna dto = service.findById(num);
		if (dto == null) {
			return "redirect:/qna/list?page=" + page;
		}

		if (info.getMemberIdx() != dto.getMemberIdx()) {
			return "redirect:/qna/list?page=" + page;
		}
		
		List<Qna> listFile = service.listQnaFile(num);

		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);


		return ".qna.write";
	}

	@PostMapping("update")
	public String updateSubmit(Qna dto,
			@RequestParam String page,
			HttpSession session) throws Exception {
		try {
			System.out.println("시바바바ㅏ"+ dto.getNum()+","+dto.getProductNum() + dto.getQ_subject()+dto.getQuestion()+dto.getSecret());
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "qna";
			
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			dto.setMemberIdx(info.getMemberIdx());
			service.updateQna(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		return "redirect:/qna/list?page=" + page;
	}


	@GetMapping("delete")
	public String delete(@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}

		Qna dto = service.findById(num);
		
		if (dto != null && info.getMemberIdx()==dto.getMemberIdx()||info.getMembership()>30) {
			try {
				service.deleteQna(num);
			} catch (Exception e) {
			}
		}

		return "redirect:/qna/list?" + query;
	}
	
	// 수정폼에서 파일삭제
	@PostMapping("deleteFile")
	@ResponseBody
	public Map<String, Object> deleteFile(@RequestParam long fileNum,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "qna";
		
		Qna dto = service.findByFileId(fileNum);
		if (dto != null) {
			fileManager.doFileDelete(dto.getFilename(), pathname);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("field", "fileNum");
		map.put("num", fileNum);
		
		service.deleteQnaFile(map);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", "true");
		
		return model;	
	}	

	// 문의사항에 등록할 상품 검색
	// AJAX - JSON
	@GetMapping("productSearch")
	@ResponseBody
	public Map<String, Object> productSearch(@RequestParam String schType,
			@RequestParam String kwd) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		List<Qna> list = service.listProduct(map);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		return model;
	}

	
}
