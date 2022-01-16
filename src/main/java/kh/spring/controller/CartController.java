package kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/cart/")
public class CartController {

	
	@RequestMapping(value=("cart"),method = RequestMethod.GET)
	public String cart() {
		System.out.println("cart");
		return "/cart/cart";
	}
		
}
