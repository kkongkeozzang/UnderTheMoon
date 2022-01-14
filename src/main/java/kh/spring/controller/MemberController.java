package kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

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
	
}
