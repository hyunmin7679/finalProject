package com.fp.pet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fp.pet.domain.Icon;
import com.fp.pet.domain.Member;
import com.fp.pet.domain.SessionInfo;
import com.fp.pet.service.MemberService;
import com.fp.pet.service.UserIconService;

@Controller
@RequestMapping(value="/member/*")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private UserIconService iconService;
	
	// login 폼은 GET으로 처리하고, 로그인 실패시 POST로 이 주소로 넘어오므로
	// GET, POST 모두 요청 받도록 수정
	@GetMapping("login")
	public String loginForm() {
		return ".member.login";
	}
	
	@PostMapping("login")
	public String loginSubmit(@RequestParam String userId,
			@RequestParam String userPwd,
			HttpSession session,
			Model model) {

		Member dto = service.loginMember(userId);
		if (dto == null || !userPwd.equals(dto.getUserPwd())) {
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			return ".member.login";
		}

		// 세션에 로그인 정보 저장
		SessionInfo info = new SessionInfo();
		info.setMemberIdx(dto.getMemberIdx());
		info.setUserId(dto.getUserId());
		info.setUserName(dto.getUserName());
		info.setMembership(dto.getMembership());

		session.setMaxInactiveInterval(30 * 60); // 세션유지시간 30분, 기본:30분

		session.setAttribute("member", info);
		// 로그인 이전 URI로 이동
		String uri = (String) session.getAttribute("preLoginURI");
		session.removeAttribute("preLoginURI");
		if (uri == null) {
			uri = "redirect:/";
		} else {
			uri = "redirect:" + uri;
		}

		return uri;
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		// 세션에 저장된 로그인 정보 지우기
		session.removeAttribute("member");
		
		// 세션에 저장된 모든 속성을 지우고 세션을 초기화
		session.invalidate();
		
		return "redirect:/";
	}
	
	// GET 매핑으로 회원가입창 넘어가기
	@GetMapping("member")
    public String memberForm(Model model) {
        model.addAttribute("mode", "member");
        return ".member.member";
    }
	
	// POST 매핑으로 회원가입 완료
	@PostMapping("member")
	public String memberSubmit(Member dto,
			final RedirectAttributes reAttr,
			Model model) {
		
		try {
			service.insertMember(dto);
			// 회원가입시 기본이미지 설정
			iconService.insertIcon(dto.getMemberIdx());
			
		} catch (DuplicateKeyException e) {
			// 기본키 중복에 의한 제약 조건 위반
			model.addAttribute("mode", "member");
			model.addAttribute("message", "아이디 중복으로 회원가입이 실패했습니다.");
			return ".member.member";
		} catch (DataIntegrityViolationException e) {
			// 데이터형식 오류, 참조키, NOT NULL 등의 제약조건 위반
			model.addAttribute("mode", "member");
			model.addAttribute("message", "제약 조건 위반으로 회원가입이 실패했습니다.");
			return ".member.member";
		} catch (Exception e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "회원가입이 실패했습니다.");
			return ".member.member";
		}

		StringBuilder sb = new StringBuilder();
		sb.append(dto.getUserName() + "님의 회원 가입이 정상적으로 처리되었습니다.<br>");
		sb.append("메인화면으로 이동하여 로그인 하시기 바랍니다.<br>");

		// 리다이렉트된 페이지에 값 넘기기
		reAttr.addFlashAttribute("message", sb.toString());
		reAttr.addFlashAttribute("title", "회원 가입");

		return "redirect:/member/complete";
	}
	
	// 회원가입 완료시 complete.jsp로 이동
	@GetMapping("complete")
	public String complete(@ModelAttribute("message") String message) throws Exception {

		// 컴플릿 페이지(complete.jsp)의 출력되는 message와 title는 RedirectAttributes 값이다.
		// F5를 눌러 새로 고침을 하면 null이 된다.

		if (message == null || message.length() == 0) // F5를 누른 경우
			return "redirect:/";

		return ".member.complete";
	}
	
	// AJAX 아이디 중복 체크
	@PostMapping("userIdCheck")
	@ResponseBody
	public Map<String, Object> idCheck(@RequestParam String userId) throws Exception {
		// ID 중복 검사
		String p = "true";
		Member dto = service.findById(userId);
		
		if (dto != null) {
			p = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("passed", p);
		return model;
	}
	
	// 패스워드 수정 폼
	@GetMapping("updatePwd")
	public String updatePwdForm() throws Exception{
		
		return ".member.updatePwd";
	}
	@PostMapping("updatePwd")
	public String updateSubmit(
			@RequestParam String userPwd,
			HttpSession session,
			Model model
			) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Member dto = new Member();
		dto.setUserId(info.getUserId());
		dto.setUserPwd(userPwd);
		
		try {
			service.updatePwd(dto);
		} catch (Exception e) {
			model.addAttribute("message","변경할 패스워드가 기존 패스워드와 일치합니다");
			return ".member.updatePwd";
		}
		
		return "redirect:/";
	}
	
	// 비회원 주문조회
	@GetMapping("nonmember")
	public String nonmemberForm () {
		
		return ".member.nonmember";
	}
	

	@GetMapping("pwd")
	public String pwdForm(String dropout, Model model) {
		
		if(dropout == null) {
			model.addAttribute("mode", "update");
		} else {
			model.addAttribute("mode", "droupout");
		}
		
		return ".member.pwd";
	}
	
	@GetMapping("noAuthorized")
	public String noAuthorized() {
		// 권한이 없는 유저가 접근 한 경우
		return ".member.noAuthorized";
	}
	
	
	@PostMapping("pwd")
	public String pwdSubmit(@RequestParam String userPwd,
			@RequestParam String mode,
			final RedirectAttributes rAttr,
			HttpSession session,
			Model model) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Member dto = service.findById(info.getUserId());
		Icon vo = iconService.findByIcon(info.getMemberIdx());
		
		long memberIdx = info.getMemberIdx();
		List<Icon> list = iconService.listIcon(memberIdx);
		
		if(dto == null) {
			session.invalidate();
			return "redirect:/";
		}
		
		
		// 패스워드 검사 ------------------------------------
		boolean bPwd = service.isPasswordCheck(info.getUserId(), userPwd);

		if (! bPwd) {
			model.addAttribute("mode", mode);
			model.addAttribute("message", "패스워드가 일치하지 않습니다.");
			return ".member.pwd";
		}
		
		if(mode.equals("dropout")) {
			// 회원 탈퇴
			// 게시판 테이블등 데이터 삭제
			
			session.removeAttribute("member");
			session.invalidate();

			StringBuilder sb = new StringBuilder();
			sb.append(dto.getUserName() + "님의 회원 탈퇴 처리가 정상적으로 처리되었습니다.<br>");
			sb.append("메인화면으로 이동 하시기 바랍니다.<br>");

			rAttr.addFlashAttribute("title", "회원 탈퇴");
			rAttr.addFlashAttribute("message", sb.toString());			
			
			return "redirect:/";
		}
		
		// 회원 수정 폼
		model.addAttribute("vo", vo);
		model.addAttribute("dto", dto);
		model.addAttribute("list",list);
		model.addAttribute("mode", "update");
		
		return ".member.member";
	}
	
	@PostMapping("/checkPassword")
    public ResponseEntity<Map<String, Boolean>> checkPassword(@RequestParam String userPwd, @RequestParam String userPwd2) {
        // 실제 서비스에서는 회원 아이디 등을 사용하여 비밀번호를 확인해야 합니다.
        // 여기서는 예시로 간단히 비밀번호만 확인하겠습니다.
        boolean result = userPwd.equals(userPwd2);

        Map<String, Boolean> response = new HashMap<>();
        response.put("result", result);

        return ResponseEntity.ok(response);
    }
	
	
	@PostMapping("update")
	public String updateSubmit(Member dto,
			long iconNum,
			//String iconImage,
			final RedirectAttributes reAttr,
			HttpSession session,
			Model model) {
		
		Icon vo = new Icon();
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		vo.setMemberIdx(info.getMemberIdx());
		vo.setIconNum(iconNum);
		
		
		try {
			service.updateMember(dto);
			iconService.updateIcon1(info.getMemberIdx()); // iconUse=0 으로 리셋
			iconService.updateIcon2(vo); // 선택한 아이콘만 iconUse=1
		} catch (Exception e) {
		}

		StringBuilder sb = new StringBuilder();
		sb.append(dto.getUserName() + "님의 회원정보가 정상적으로 변경되었습니다.<br>");
		sb.append("메인화면으로 이동 하시기 바랍니다.<br>");

		reAttr.addFlashAttribute("title", "회원 정보 수정");
		reAttr.addFlashAttribute("message", sb.toString());

		return "redirect:/member/complete";
	}
	
	
	// 아이콘 리스트
	@RequestMapping(value = "iconlist")
	@ResponseBody
	public Map<String, Object> list(HttpSession session) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		long memberIdx = info.getMemberIdx();
		List<Icon> list = iconService.listIcon(memberIdx);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		return model;
	}
}
