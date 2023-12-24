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
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.pet.common.FileManager;
import com.fp.pet.common.MyUtil;
import com.fp.pet.domain.Community;
import com.fp.pet.domain.SessionInfo;
import com.fp.pet.service.CommunityService;

@Controller
@RequestMapping("/bbs/*")
public class CommunityController {
	
	@Autowired
	private CommunityService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	// 리스트
	@RequestMapping("list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
					   @RequestParam(defaultValue = "all") String schType,
					   @RequestParam(defaultValue = "") String kwd,
					   HttpServletRequest req,
					   HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");	
		Map<String, Object> map = new HashMap<String, Object>();
		
		int size = 5; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}

		// 전체 페이지 수
		map.put("schType", schType);
		map.put("kwd", kwd);

		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = dataCount / size + (dataCount % size > 0 ? 1 : 0);
		}

		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if (total_page < current_page) {
			current_page = total_page;
		}

		// 리스트에 출력할 데이터를 가져오기
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		// 글 리스트
		List<Community> list = service.listCommunity(map);

		if(info != null) {
			for(Community dto : list) {
				if(info.getMemberIdx() == info.getMemberIdx()) {
					dto.setDeletePermit(true);
				}
			}
		}  
				
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);

		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);

		return ".bbs.list";
	}
	
	// 등록 폼
	@GetMapping("write")
	public String writetForm(Model model) throws Exception {

		model.addAttribute("mode", "write");

		return ".bbs.write";
	}
	
	// 등록 완료
	@PostMapping("write")
	public String writeSubmit(Community dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "bbs";

		try {
			dto.setUserId(info.getUserId());
			service.insertCommunity(dto, pathname);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/bbs/list";
	}
	
	// 글보기
	@GetMapping("article")
	public String article(@RequestParam long communityNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session,
			Model model) throws Exception {
		
		kwd = URLDecoder.decode(kwd, "utf-8");

		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + 
					"&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}

		service.updateHitCount(communityNum);

		// 해당 레코드 가져 오기
		Community dto = service.findById(communityNum);
		if (dto == null) {
			return "redirect:/bbs/list?" + query;
		}

		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("communityNum", communityNum);

		Community prevDto = service.findByPrev(map);
		Community nextDto = service.findByNext(map);
		
		System.out.println("으아아아아아아아" + prevDto + nextDto);

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		// 게시글 좋아요 여부
		map.put("userId", info.getUserId());
		boolean userCommunityLiked = service.userCommunityLiked(map); 
		
		model.addAttribute("dto", dto);
		model.addAttribute("prevDto", prevDto);
		model.addAttribute("nextDto", nextDto);

		model.addAttribute("page", page);
		model.addAttribute("query", query);

		model.addAttribute("userCommunityLiked", userCommunityLiked);
		
		return ".bbs.article";
	}  

	// 수정 폼
	@GetMapping("update")
	public String updateForm(@RequestParam long communityNum,
						     @RequestParam String page,
						     HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Community dto = service.findById(communityNum);
		if(dto == null || ! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/bbs/list?page=" + page;
		}
		
		model.addAttribute("dto", dto); 
		model.addAttribute("mode", "update"); 
		model.addAttribute("page", page); 
		
		return ".bbs.write";
	}
	
	// **수정완료
	@PostMapping("update")
	public String updateSubmit(Community dto, 
							   @RequestParam String page,
							   HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "bbs";
		
		try {
			service.updateCommunity(dto, pathname);
	
		} catch (Exception e) {
		}
		
		return "redirect:/bbs/list?page=" + page;
	}
	
	// **수정폼에서 파일삭제
	@GetMapping("deleteFile")
	public String deleteFile(@RequestParam long fileNum,
						     @RequestParam String page,
						     Community dto,
							 HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "bbs";

		List<Community> list = service.listCommunityFile(fileNum);
		
		
		
		if (dto == null) {
			return "redirect:/bbs/list?page=" + page;
		}

		if(! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/bbs/article?page=" + page;
		}
		
		try {
			if (dto.getSelectFile() != null) {
				fileManager.doFileDelete(pathname); // 실제파일삭제
				
				dto.setFilename("");
				service.updateCommunity(dto, pathname);
			}
			model.addAttribute("list",list);
			
		} catch (Exception e) {
		}

		
		return "redirect:/bbs/list?page=" + page;
	}
	
	
	// 커뮤니티 삭제 (파일있으면 파일도 삭제)
	@GetMapping("delete")
	public String delete (@RequestParam long communityNum,
						  @RequestParam String page,
						  @RequestParam(defaultValue = "all") String schType,
						  @RequestParam(defaultValue = "") String kwd,
						  HttpSession session) throws Exception {
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "bbs";

		service.deleteCommunity(communityNum, pathname);
		
		return "redirect:/bbs/list?" + query;
		
	}

	// 게시글 좋아요 추가/삭제 (AJAX-JSON)
	@PostMapping("insertLike")
	@ResponseBody // JSON
	public Map<String, Object> insertLike(@RequestParam long communityNum,
									      @RequestParam boolean userLiked, 
									      HttpSession session) throws Exception {
		
		String state = "true";
		int communityLikeCount = 0;
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("num", communityNum);
		paramMap.put("userId", info.getUserId());
		
		try {
			if(userLiked) {
				service.deleteCommunityLike(paramMap);
			} else {
				service.insertCommunityLike(paramMap);
			}
		} catch (DuplicateKeyException e) {
			state = "liked";
		} catch (Exception e) {
			state = "false";
		}
		
		communityLikeCount = service.communityLikeCount(communityNum);

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		model.put("communityLikeCount", communityLikeCount);

		return model;
	}
}
