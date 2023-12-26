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
import com.fp.pet.domain.Reply;
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
	
	@GetMapping(value = "main")
	public String main(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
						Model model) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("mode", "use");
		List<Community> listCategory = service.listCategory(map);

		model.addAttribute("listCategory", listCategory);
		model.addAttribute("categoryNum", "0");
		model.addAttribute("pageNo", current_page);
		
		return ".bbs.list";
	}
	
	// 리스트
	@RequestMapping("list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
					   @RequestParam(defaultValue = "all") String schType,
					   @RequestParam(defaultValue = "") String kwd,
					   @RequestParam(defaultValue = "0") int categoryNum, 
					   HttpServletRequest req,
					   HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");	
		Map<String, Object> map = new HashMap<String, Object>();
		
		int size = 5; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
		List<Community> listCategory = service.listCategory(map);

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}

		// 전체 페이지 수
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		map.put("mode", "use");
		
		map.put("categoryNum", categoryNum);
		

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
		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("listCategory", listCategory);

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
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
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

		List<Community> listFile = service.listCommunityFile(communityNum);

		
		// 게시글 좋아요 여부
		map.put("userId", info.getUserId());
		boolean userCommunityLiked = service.userCommunityLiked(map); 
		
		model.addAttribute("dto", dto);
		model.addAttribute("prevDto", prevDto);
		model.addAttribute("nextDto", nextDto);
		model.addAttribute("listFile", listFile);

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
	public Map<String, Object> deleteFile(@RequestParam long fileNum,
						     @RequestParam String page,
							 HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "bbs";

		Community dto = service.findByFileId(fileNum);
		if (dto != null) {
			fileManager.doFileDelete(dto.getFilename(), pathname);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fileNum", fileNum);
		service.deleteCommunityFile(map);
		
			Map<String, Object> model = new HashMap<>();
			model.put("state", "true");
			
			return model;
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
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "bbs";

		Community dto = service.findById(communityNum);
		if(dto == null) {
			return "redirect:/album/list?page=" + page;
		}
		
		if (!dto.getUserId().equals(info.getUserId())) {
			return "redirect:/";
		}
		
		try {
			service.deleteCommunity(communityNum, pathname);
			
		} catch (Exception e) {
		}
		
		return "redirect:/bbs/list?" + query;
		
	}

	// 게시글 좋아요 추가/삭제 (AJAX-JSON)
	@PostMapping("insertBoardLike")
	@ResponseBody
	public Map<String, Object> insertBoardLike(@RequestParam long communityNum, 
			@RequestParam boolean userLiked,
			HttpSession session) {
		String state = "true";
		int communityLikeCount = 0;
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("communityNum", communityNum);
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
	
	// 댓글 리스트 AJAX-TEXT
	@GetMapping("listReply")
	public String listReply(@RequestParam long communityNum, 
							@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
							HttpSession session,
							Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		int size = 5;
		int total_page = 0;
		int dataCount = 0;

		Map<String, Object> map = new HashMap<>();
		map.put("communityNum", communityNum);
		
		map.put("membership", info.getMembership());
		map.put("userId", info.getUserId());
		
		dataCount = service.replyCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if (current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);
		
		List<Reply> listReply = service.listReply(map);
		
		for (Reply dto : listReply) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			
			// AJAX 용 페이징
			String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

			// 포워딩할 jsp로 넘길 데이터
			model.addAttribute("listReply", listReply);
			model.addAttribute("pageNo", current_page);
			model.addAttribute("replyCount", dataCount);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);

		}

		return "bbs/listReply";
	}
	
	// 댓글 및 댓글의 답글 등록 JSON
		@PostMapping("insertReply")
		@ResponseBody
		public Map<String, Object> insertReply(Reply dto, HttpSession session) {
			
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			String state = "true";

			try {
				dto.setUserId(info.getUserId());
				service.insertReply(dto);
				
			} catch (Exception e) {
				state = "false";
			}

			Map<String, Object> model = new HashMap<>();
			model.put("state", state);
			return model;
		}
	
	 // 댓글 및 답글 삭제 
	@PostMapping("deleteReply")
	@ResponseBody
	public Map<String, Object> deleteReply(@RequestParam Map<String, Object> paramMap) {
		String state = "true";
		
		try {
			service.deleteReply(paramMap);
			
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> map = new HashMap<>();
		map.put("state", state);
		return map;
	}	
	
	    // 댓글의 답글 리스트 : AJAX-TEXT
		@GetMapping("listReplyAnswer")
		public String listReplyAnswer(@RequestParam Map<String, Object> paramMap, 
								      HttpSession session, Model model) throws Exception {
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			paramMap.put("membership", info.getMembership());
			paramMap.put("userId", info.getUserId());
			
			List<Reply> listReplyAnswer = service.listReplyAnswer(paramMap);
			
			for (Reply dto : listReplyAnswer) {
				dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			}

			model.addAttribute("listReplyAnswer", listReplyAnswer);
			
			return "bbs/listReplyAnswer";
		}
		
		// 댓글의 답글 개수 JSON
		@PostMapping(value = "countReplyAnswer")
		@ResponseBody
		public Map<String, Object> countReplyAnswer(@RequestParam Map<String, Object> paramMap,
												    HttpSession session) {
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			paramMap.put("membership", info.getMembership());
			paramMap.put("userId", info.getUserId());
			
			int count = service.replyAnswerCount(paramMap);

			Map<String, Object> model = new HashMap<>();
			model.put("count", count);
			
			return model;
		}
		
		// 댓글 숨김/표시 추가 JSON
		@PostMapping("replyShowHide")
		@ResponseBody
		public Map<String, Object> replyShowHide(@RequestParam Map<String, Object> paramMap,
											     HttpSession session) {
			String state = "true";

			SessionInfo info = (SessionInfo) session.getAttribute("member");

			try {
				paramMap.put("userId", info.getUserId());
				service.updateReplyShowHide(paramMap);
				
			} catch (Exception e) {
				state = "false";
			}

			Map<String, Object> model = new HashMap<>();
			model.put("state", state);
			
			return model;
		}	

}
