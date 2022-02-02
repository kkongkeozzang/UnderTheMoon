package kh.spring.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.MdInqryDTO;
import kh.spring.service.MdInqryService;
import kh.spring.service.MemberService;

@Controller
@RequestMapping("/md/detail/inqry/")
public class MdInqryController {
	
	private final MemberService memberService;
	private final MdInqryService mdInqryService;
	
	public MdInqryController(MemberService memberService, MdInqryService mdInqryService) {
		this.memberService = memberService;
		this.mdInqryService = mdInqryService;
	}
	
	@PostMapping(value="insert")
	public String insert(MdInqryDTO inqry) {
		System.out.println("실행");
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		int member_id = memberService.selectIdByUsername(username);
		inqry.setMember_id(member_id);
		int result = mdInqryService.insert(inqry);
		System.out.println(result);
		return "redirect:/md/detail/page?md_id="+inqry.getMd_id();
	}
	
}
