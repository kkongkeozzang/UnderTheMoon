package kh.spring.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.MdReviewDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.service.MdReviewService;
import kh.spring.service.MemberService;

@Controller
@RequestMapping("/md/detail/review/")
public class MdReviewController {
	
//	private final MemberService memberService;
//	private final MdReviewService mdReviewService;
//	
//	public MdReviewController(MemberService memberService, MdReviewService mdReviewService) {
//		this.memberService = memberService;
//		this.mdReviewService = mdReviewService;
//	}
//	
//	@RequestMapping("write")
//	public String insert(MdReviewDTO mdReview, String md_id) {
//		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
//        String username = ((UserDetails)principal).getUsername();
//		int member_id = memberService.selectIdByUsername(username);
//		mdReview.setMember_id(String.valueOf(member_id));
//		System.out.println(mdReview.getMd_id());
//		System.out.println(mdReview.getMd_review_title());
//		System.out.println(mdReview.getMember_id());
//		System.out.println(mdReview.getMd_review_content());
//		int result = mdReviewService.insertMdReview(mdReview);
//		return "redirect:/mypage/myPageAfterMdReview?cPage=1";
//	}
}
