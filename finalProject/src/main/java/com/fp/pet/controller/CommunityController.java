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
import com.fp.pet.domain.Friend;
import com.fp.pet.domain.Reply;
import com.fp.pet.domain.SessionInfo;
import com.fp.pet.service.CommunityService;
import com.fp.pet.service.FriendService;

@Controller
@RequestMapping("/bbs/*")
public class CommunityController {
	
	@Autowired
	private CommunityService service;
	
	@Autowired
	private FriendService friendservice;
	
	@Autowired
	private MyUtil myUtil;
	
	
	@Autowired
	private FileManager fileManager;
	
	@GetMapping("main")
	public String main(
			@RequestParam(defaultValue = "0") long communityNum,
			@RequestParam(defaultValue = "0") long categoryNum,
			Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Community> listCategory = service.listCategory(map);
		
		model.addAttribute("listCategory", listCategory);		
		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("communityNum", communityNum);
		
		return ".bbs.main";
	}
	
	@GetMapping("list")
	public String list(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
					   @RequestParam(defaultValue = "all") String schType,
					   @RequestParam(defaultValue = "") String kwd,
					   @RequestParam int categoryNum, 
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
		
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
				
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("paging", paging);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);

		return "bbs/list";
	}
	
	// 등록 폼
	@GetMapping("write")
	public String writetForm(Model model) throws Exception {

		model.addAttribute("mode", "write");

		return "bbs/write";
	}
	
	// 등록 완료
	@PostMapping("write")
	@ResponseBody
	public Map<String, Object> writeSubmit(Community dto, HttpSession session) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "bbs";

		String state = "true";
		try {
			dto.setUserId(info.getUserId());
			service.insertCommunity(dto, pathname);
			
			System.out.println(dto.getMas()+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			
		} catch (Exception e) {
			e.printStackTrace();
			state = "false";
		}

		model.put("state", state);

		return model;
	}
	
	
	// 글보기
	@GetMapping("article")
	public String article(@RequestParam long communityNum, 
			@RequestParam String pageNo,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		kwd = URLDecoder.decode(kwd, "utf-8");

		String query = "page=" + pageNo;
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
		
		List<Community> list = service.finByMap(communityNum);

		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("communityNum", communityNum);
		
		map.put("userId", info.getUserId());
		
		Community prevDto = service.findByPrev(map);
		Community nextDto = service.findByNext(map);

		List<Community> listFile = service.listCommunityFile(communityNum);
		
		// 게시글 좋아요 여부
		boolean userBoardLiked = service.userBoardLiked(map);
		
		model.addAttribute("mapList",list);
		
		model.addAttribute("dto", dto);
		model.addAttribute("prevDto", prevDto);
		model.addAttribute("nextDto", nextDto);
		model.addAttribute("listFile", listFile);

		model.addAttribute("pageNo", pageNo);
		model.addAttribute("query", query);

		model.addAttribute("userBoardLiked", userBoardLiked);
		
		return "bbs/article";
	}  

	// 수정 폼
	@GetMapping("update")
	public String updateForm(@RequestParam long communityNum,
						     @RequestParam String pageNo,
						     HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Community dto = service.findById(communityNum);
		if(dto == null || ! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/bbs/list?page=" + pageNo;
		}
		
		List<Community> listFile = service.listCommunityFile(communityNum);

		
		model.addAttribute("mode", "update"); 
		model.addAttribute("pageNo", pageNo); 

		model.addAttribute("dto", dto); 
		model.addAttribute("listFile", listFile);
		
		return "bbs/write";
	}
	
	// 수정완료
	@PostMapping("update")
	@ResponseBody
	public Map<String, Object> updateSubmit(Community dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "false";
		
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "bbs";
			
			dto.setUserId(info.getUserId());
			service.updateCommunity(dto, pathname);
			
			state = "true";
	
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	// 커뮤니티 삭제 (파일있으면 파일도 삭제)
	@PostMapping("delete")
	@ResponseBody
	public Map<String, Object> delete (@RequestParam long communityNum,
						  			   @RequestParam String pageNo,
						  			   @RequestParam(defaultValue = "all") String schType,
						  			   @RequestParam(defaultValue = "") String kwd,
						  			   HttpSession session) throws Exception {
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		String query = "pageNo=" + pageNo;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state ="false";
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "bbs";
			
			
			service.deleteCommunity(communityNum, pathname, info.getUserId());
			state = "true";
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("query", query);
		
		return model;
		
	}
	
	// 수정폼에서 파일삭제
	@PostMapping("deleteFile")
	@ResponseBody
	public Map<String, Object> deleteFile(@RequestParam long fileNum,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "bbs";
		
		Community dto = service.findByFileId(fileNum);
		if (dto != null) {
			fileManager.doFileDelete(dto.getFilename(), pathname);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("field", "fileNum");
		map.put("communityNum", fileNum);
		
		service.deleteCommunityFile(map);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", "true");
		
		return model;	
	}	

	// 게시글 좋아요 추가/삭제 (AJAX-JSON)
	@PostMapping("insertBoardLike")
	@ResponseBody
	public Map<String, Object> insertBoardLike(@RequestParam long communityNum, 
												@RequestParam boolean userLiked,
												HttpSession session) {
		
		int boardLikeCount = 0;
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Map<String, Object> paramMap = new HashMap<>();
		String state = "true";
		
		paramMap.put("communityNum", communityNum);
		paramMap.put("userId", info.getUserId());

		try {
			if(userLiked) {
				service.deleteBoardLike(paramMap);
			} else {
				service.insertBoardLike(paramMap);
			}
		} catch (DuplicateKeyException e) {
			state = "liked";
			
		} catch (Exception e) {
			e.printStackTrace();
			state = "false";
		}

		boardLikeCount = service.boardLikeCount(communityNum);

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		model.put("boardLikeCount", boardLikeCount);

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
			String paging = myUtil.pagingMethod(current_page, total_page, "replyListPage");

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
	
	
	
	// 친구추가 모달
	@GetMapping("friend")
	public String friend(@RequestParam String userName, Model model, 
					     HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", userName);
		map.put("userId", info.getUserName());
		
		Community dto = service.findName(map);

		model.addAttribute("dto", dto);
		
		return "bbs/friendModal";
	}
	
	
	@PostMapping("addfriend")
	@ResponseBody
	public Map<String, Object> addFriend(Friend dto,
										 HttpSession session) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> map = new HashMap<String, Object>();
		
		String state = "true";
		
		try {
			dto.setUserId(info.getUserName());
			friendservice.addFriend(dto);
			
		} catch (Exception e) {
			state = "false";
			e.printStackTrace();
		}
		
		map.put("state", state);
		
		return map;
	}
	
	
	/*// 작성자 클릭 시 친구추가
	@PostMapping("addfriend")
	public Map<String, Object> addFriend (Friend dto, HttpSession session) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String state = "true";
		
		try {
			dto.setUserId(info.getUserName());
			service.addFriend(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			state = "false";
		}
		
		model.put("state", state);
		
		return model;
	}
	*/
	
	// -----------------------------------------------------------
	@GetMapping("list2")
	@ResponseBody
	public Map<String, Object> list2(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
									 HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> model = new HashMap<String, Object>();
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int size = 5;
			int dataCount = 0;
			
			map.put("userId", info.getUserId());
			dataCount = service.dataCount2(map);
			
			int total_page = myUtil.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}

			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;

			map.put("offset", offset);
			map.put("size", size);

			List<Community> list = service.listCommunity2(map);
			
			String paging = myUtil.pagingFunc(current_page, total_page, "listCommunity");
			
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
	
	// 좋아요
	@GetMapping("likeList2")
	@ResponseBody
	public Map<String, Object> Likelist2(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
									 	 HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> model = new HashMap<String, Object>();
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int size = 5;
			int dataCount = 0;
			
			map.put("userId", info.getUserId());
			dataCount = service.likeCount2(map);
			
			int total_page = myUtil.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}

			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;

			map.put("offset", offset);
			map.put("size", size);

			List<Community> list = service.listLike2(map);
			
			String paging = myUtil.pagingFunc(current_page, total_page, "listLike");
			
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
}
