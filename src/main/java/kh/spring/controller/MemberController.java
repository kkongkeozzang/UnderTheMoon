package kh.spring.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		return "/login/findUsername";
	}
	
	@RequestMapping("member/findPassword")
	public String findPassword() {
		
		return "/login/findPassword";
	}
	
	@RequestMapping(value="member/resetPassword", method = RequestMethod.GET)
	public String resetPassword(@RequestParam String username,Model model) {
		System.out.println(username+"ㄴ");
		model.addAttribute("member_username",username);
		return "/login/resetPassword";
	}
	
	@RequestMapping("/signup")
	public String signup() {
		
		return "/signup/signup";
	}
	
	@RequestMapping("member/signup")
	public String signup(MemberDTO dto) throws Exception{
		
		memberService.insertMember(dto);
		return "redirect:/";
	}
}
