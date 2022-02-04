package kh.spring.controller;

import java.util.List;


import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import kh.spring.dto.CartDTO;
import kh.spring.dto.CouponDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.service.CartService;
import kh.spring.service.CouponService;
import kh.spring.service.GradeService;
import kh.spring.service.MemberService;
import kh.spring.service.PointService;
import kh.spring.service.PurchaseService;

@Controller
@RequestMapping("/purchase/")
public class PurchaseController {

	private final PurchaseService purchaseService;
	private final CartService cartService;
	private final MemberService memberService;
	private final PointService pointService;
	private final CouponService couponService;
	private final GradeService gradeService;
	
	public PurchaseController(PurchaseService purchaseService
								,CartService cartService
								,MemberService memberService
								,CouponService couponService
								,PointService pointService
								,GradeService gradeService) {
		this.purchaseService = purchaseService;
		this.cartService = cartService;
		this.memberService = memberService;
		this.couponService = couponService;
		this.pointService = pointService;
		this.gradeService = gradeService;
	}
	
	@RequestMapping(value=("purchase"),method = RequestMethod.GET)
	public String mypage(Model model) throws Exception {
		
		//로그인된 아이디.
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		String username = ((UserDetails)principal).getUsername();
		//회원정보.
		MemberDTO member = memberService.selectByUsername(username);
		//장바구니 아이템 정보.
		List<CartDTO> carts = cartService.selectByMemberId(username);
		//쿠폰정보.
		List<CouponDTO> coupons = couponService.selectAllByMemberId(username).get();
		//적립금정보.
		int pointSum = pointService.selectPointById(username).get();
		//회원적립률
		int grade_point = gradeService.selectGrade_point(username);
		
		
		//구매 총금액
		int totalPrice = 0;
		int deliveryFee= 0;
		
		for(CartDTO cart :carts) {
			totalPrice += cart.getCart_price();
		}
		
		if(totalPrice>=30000) {
			deliveryFee= 0;
			for(int i = 0; i < coupons.size(); i++) {
				if(coupons.get(i).getCoupon_name().contains("배송")) {
					coupons.remove(i);
				}
			}
		}else {
			deliveryFee =2500;
		}
		
		System.out.println(member+" "+carts+" "+coupons+" "+pointSum+" "+totalPrice+" "+grade_point);
		
		System.out.println(totalPrice);
		model.addAttribute("carts", carts);
		model.addAttribute("totalPrice",totalPrice);
		model.addAttribute("coupons", coupons);
		model.addAttribute("pointSum", pointSum);
		model.addAttribute("member", member);
		model.addAttribute("grade_point", grade_point);
		model.addAttribute("deliveryFee", deliveryFee);
		
			
		return "/purchase/purchase";
		
	}
	
	@RequestMapping("fail")
	public String fail() {
		return "/purchase/purchaseFail";
	}
	
}
