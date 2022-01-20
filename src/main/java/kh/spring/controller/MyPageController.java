package kh.spring.controller;

import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.GradeDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.service.CouponService;
import kh.spring.service.GradeService;
import kh.spring.service.MemberService;
import kh.spring.service.PurchaseService;


@Controller
@RequestMapping("/mypage/")
public class MyPageController {

	private final GradeService gradeService;
	private final MemberService memberService;
	private final PurchaseService purchaseService;
	private final CouponService couponService;
	
	public MyPageController(GradeService gradeService, MemberService memberService, PurchaseService purchaseService, CouponService couponService) {
		this.gradeService = gradeService;
		this.memberService = memberService;
		this.purchaseService = purchaseService;
		this.couponService = couponService;
	}
	
	@RequestMapping("myPageList")
	public String myPage(Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		model.addAttribute("memberDTO",memberDTO);
        
		return "/mypage/myPageList";
	}
	
	@RequestMapping("myPageGrade")
	public String myPageGrade(Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		List<GradeDTO> gradeList = gradeService.selectAll();
		Integer purchasePayment = purchaseService.selectByIdSumPurchasePayment(memberDTO.getMember_id());
		if(purchasePayment == null) {
			purchasePayment = 0;
		}
		System.out.println(purchasePayment);
		System.out.println(memberDTO.getGrade_name());
		System.out.println(username);
		if(purchasePayment >= 500000 && purchasePayment < 1000000 && memberDTO.getGrade_name().equals("별")) {
			memberService.updateGradeMoon(username);
			for(int i=0; i<3; i++) {
				couponService.insertMoonGradeDelivery(memberDTO.getMember_id());
			}
			couponService.insertMoonGradeDiscount(memberDTO.getMember_id());
		}else if(purchasePayment >= 1000000 && memberDTO.getGrade_name().equals("달")){
			memberService.updateGradeSun(username);
			for(int i=0; i<5; i++) {
				couponService.insertSunGradeDelivery(memberDTO.getMember_id());
			}
			couponService.insertSunGradeDiscount(memberDTO.getMember_id());
		}
		model.addAttribute("gradeList",gradeList);
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("purchasePayment",purchasePayment);
		return "/mypage/myPageGrade";	
	}
}
