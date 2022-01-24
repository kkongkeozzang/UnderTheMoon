package kh.spring.controller;

import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.spring.dto.CartDTO;
import kh.spring.service.CartService;



@Controller
@RequestMapping("/cart/")
public class CartController {

	private final CartService cartService;
	
	public CartController(CartService cartService) {
		this.cartService = cartService;
	}
	
	@RequestMapping(value=("cart"),method = RequestMethod.GET)
	public String mypage(Model model) throws Exception {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		String username = ((UserDetails)principal).getUsername();
		
		List<CartDTO> cartDTO = cartService.selectByMemberId(username);
		int totalPrice = 0;
		
		for(CartDTO cart :cartDTO) {
			totalPrice += cart.getCart_price();
		}
		
		System.out.println(totalPrice);
		model.addAttribute("cartDTO", cartDTO);
		model.addAttribute("totalPrice",totalPrice);
			
		return "/cart/cart";
		
	}
		
}
