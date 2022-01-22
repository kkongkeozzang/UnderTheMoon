package kh.spring.controller;


import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.CouponDTO;
import kh.spring.dto.GradeDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.PointDTO;
import kh.spring.service.CouponService;
import kh.spring.service.GradeService;
import kh.spring.service.MemberService;
import kh.spring.service.PointService;
import kh.spring.service.PurchaseService;


@Controller
@RequestMapping("/mypage/")
public class MyPageController {

	private final GradeService gradeService;
	private final MemberService memberService;
	private final PurchaseService purchaseService;
	private final CouponService couponService;
	private final PointService pointService;
	
	public MyPageController(GradeService gradeService, MemberService memberService, PurchaseService purchaseService, 
			CouponService couponService, PointService pointService) {
		this.gradeService = gradeService;
		this.memberService = memberService;
		this.purchaseService = purchaseService;
		this.couponService = couponService;
		this.pointService = pointService;
	}
	
	@RequestMapping("myPageList")
	public String myPage(Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		int pointSum = pointService.selectPointById(username).get();
		int couponSum = couponService.selectCouponPossibleById(memberDTO.getMember_id());
		
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("pointSum",pointSum);
		model.addAttribute("couponSum", couponSum);
        
		return "/mypage/myPageList";
	}
	
	@RequestMapping("myPageGrade")
	public String myPageGrade(Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		List<GradeDTO> gradeList = gradeService.selectAll();
		Integer purchasePayment = purchaseService.selectByIdSumPurchasePayment(memberDTO.getMember_id());
		int pointSum = pointService.selectPointById(username).get();
		int couponSum = couponService.selectCouponPossibleById(memberDTO.getMember_id());
		
		if(purchasePayment == null) {
			purchasePayment = 0;
		}
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
		model.addAttribute("pointSum",pointSum);
		model.addAttribute("couponSum", couponSum);
		
		return "/mypage/myPageGrade";	
	}
	
	@RequestMapping("myPagePoint")
	public String myPagePoint(Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		int pointSum = pointService.selectPointById(username).get();
		List<PointDTO> pointList = pointService.selectPointListById(memberDTO.getMember_id());
		int couponSum = couponService.selectCouponPossibleById(memberDTO.getMember_id());
		
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("pointSum",pointSum);
		model.addAttribute("pointList",pointList);
		model.addAttribute("couponSum", couponSum);
		
		return "/mypage/myPagePoint";
	}
	
	@RequestMapping("myPageCoupon")
	public String myPageCoupon(Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		int pointSum = pointService.selectPointById(username).get();
		List<CouponDTO> couponList = couponService.selectCouponListById(memberDTO.getMember_id());
		int couponSum = couponService.selectCouponPossibleById(memberDTO.getMember_id());
		
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("pointSum",pointSum);
		model.addAttribute("couponList",couponList);
		model.addAttribute("couponSum", couponSum);
		
		return "/mypage/myPageCoupon";
	}
}
