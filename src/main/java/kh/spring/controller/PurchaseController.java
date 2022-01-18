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
	
	public PurchaseController(PurchaseService purchaseService
								,CartService cartService
								,MemberService memberService
								,CouponService couponService
								,PointService pointService) {
		this.purchaseService = purchaseService;
		this.cartService = cartService;
		this.memberService = memberService;
		this.couponService = couponService;
		this.pointService = pointService;
	}
	
	@RequestMapping(value=("purchase"),method = RequestMethod.GET)
	public String mypage(Model model) throws Exception {
		
		//로그인된 아이디.
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		String username = ((UserDetails)principal).getUsername();
		//회원정보.
		MemberDTO memberDTO = memberService.selectByUsername(username);
		//장바구니 아이템 정보.
		List<CartDTO> cartDTO = cartService.selectByMemberId(username);
		//쿠폰정보.
		List<CouponDTO> couponDTO = couponService.selectAllByMemberId(username).get();
		//적립금정보.
		int pointSum = pointService.selectPointById(username).get();
		
		//구매 총금액
		int totalPrice = 0;
		
		for(CartDTO cart :cartDTO) {
			totalPrice += cart.getCart_price();
		}
		
		System.out.println(memberDTO+" "+cartDTO+" "+couponDTO+" "+pointSum+" "+totalPrice);
		
		System.out.println(totalPrice);
		model.addAttribute("cartList", cartDTO);
		model.addAttribute("totalPrice",totalPrice);
		model.addAttribute("couponList", couponDTO);
		model.addAttribute("pointSum", pointSum);
		model.addAttribute("memberDTO", memberDTO);
		
			
		return "/purchase/purchase";
		
	}
}