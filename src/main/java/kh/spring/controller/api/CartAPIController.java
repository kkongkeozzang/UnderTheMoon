package kh.spring.controller.api;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kh.spring.service.CartService;

@RestController
@RequestMapping("/cart/rest/")
public class CartAPIController {

	private final CartService cartService;
	
	public CartAPIController(CartService cartService) {
		this.cartService = cartService;
	}
	
	@PostMapping("addToCart")
	public ResponseEntity<Integer> addToCart(String member_username,Integer md_id, Integer cart_item_count){
		
		
		Integer result = cartService.addToCart(member_username,md_id,cart_item_count);
		
		return new ResponseEntity<Integer>(result,HttpStatus.OK);
		
	}
	
	@DeleteMapping("deleteCart/{cart_id}")
	public ResponseEntity<Integer> deleteCart(@PathVariable String cart_id){
		
		Integer result = cartService.deleteCart(Integer.valueOf(cart_id));
	
		return new ResponseEntity<Integer>(result,HttpStatus.OK);
	}
	
	@PatchMapping("addItemCount/{cart_id}")
	public ResponseEntity<Integer> addItemCount(@PathVariable String cart_id){
		
		Integer result = cartService.addItemCount(Integer.valueOf(cart_id));
		
		return new ResponseEntity<Integer>(result,HttpStatus.OK);
	}
	
	@PatchMapping("subtractItemCount/{cart_id}")
	public ResponseEntity<Integer> subtractItemCount(@PathVariable String cart_id){
		
		Integer result = cartService.subtractItemCount(Integer.valueOf(cart_id));
		
		return new ResponseEntity<Integer>(result,HttpStatus.OK);
	}
	
	@DeleteMapping("deleteAll/{member_id}")
	public ResponseEntity<Integer> deleteAll(@PathVariable String member_id){
		
		Integer result = cartService.deleteAll(Integer.valueOf(member_id));
	
		return new ResponseEntity<Integer>(result,HttpStatus.OK);
	}
}
