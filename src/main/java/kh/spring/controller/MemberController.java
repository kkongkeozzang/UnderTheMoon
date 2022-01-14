package kh.spring.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberController {

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
	
	@RequestMapping("member/resetPassword")
	public String resetPassword(@RequestParam String username,Model model) {
		System.out.println(username+"ㄴ");
		model.addAttribute("member_username",username);
		return "/login/resetPassword";
	}
	
}
