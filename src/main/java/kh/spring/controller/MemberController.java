package kh.spring.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.MemberDTO;
import kh.spring.dto.PointDTO;
import kh.spring.service.MemberService;
import kh.spring.service.PointService;

@Controller
public class MemberController {
	
	private final MemberService memberService;
	private final PointService pointService;
	
	public MemberController(MemberService memberService, PointService pointService) {
		this.memberService = memberService;
		this.pointService = pointService;
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
	public String signup(MemberDTO dto, @RequestParam(value = "recommend_id", required=false, defaultValue="") String recommend_id
			,@RequestParam(value = "event", required=false, defaultValue="") String event) throws Exception{
		memberService.insertMember(dto); // 멤버
		System.out.println(dto.getMember_id());
		int result = memberService.idDuplCheck(recommend_id);
		if(result == 1) {
			pointService.insertRecommendMemberPoint(dto.getMember_id());
		}
		
		if(event.equals("월하합작")) {
			pointService.insertEventMemberPoint(dto.getMember_id());
		}
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value="member/idDuplCheck", produces="text/html;charset=utf8")
	public String idDuplCheck(String id) throws Exception{
		int result = memberService.idDuplCheck(id);		
		return String.valueOf(result);		
	}
}
