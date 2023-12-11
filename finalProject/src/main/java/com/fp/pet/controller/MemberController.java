package com.fp.pet.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fp.pet.service.MemberService;
import com.fp.pet.domain.Member;

@Controller
@RequestMapping(value="/member/*")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// login 폼은 GET으로 처리하고, 로그인 실패시 POST로 이 주소로 넘어오므로
	// GET, POST 모두 요청 받도록 수정
	@RequestMapping("login")
	public String loginForm() {
		return ".member.login";
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

}
