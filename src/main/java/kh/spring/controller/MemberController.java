package kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.MemberDTO;
import kh.spring.service.MemberService;

@Controller
public class MemberController {
	
	private final MemberService memberService;
	
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}

	@RequestMapping("/login")
	public String login() {
		
		return "/login/login";
	}
	
	@RequestMapping("member/findUsername")
	public String findUsername() {
		
		return "login/findUsername";
	}
	
	@RequestMapping("member/findPassword")
	public String findPassword() {
		
		return "login/findPassword";
	}
	
	@RequestMapping("member/signup")
	public String signup(MemberDTO dto) throws Exception{
		
		memberService.insertMember(dto);
		return "redirect:/";
	}
}
