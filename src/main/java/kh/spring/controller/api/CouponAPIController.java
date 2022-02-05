package kh.spring.controller.api;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kh.spring.service.CouponService;

@RestController
@RequestMapping("/coupon/rest/")
public class CouponAPIController {
	
	private final CouponService couponService;
	
	public CouponAPIController (CouponService couponService) {
		this.couponService = couponService;
	}

	@Transactional(rollbackFor = Exception.class) 
	@PostMapping("update/{coupon_id}")
	public ResponseEntity<Integer> updateCouponUsed(@PathVariable Integer coupon_id) {
		System.out.println(coupon_id);
		int result = 0;
		if(coupon_id != 0) {
			result = couponService.updateCouponUsed(coupon_id);
		}
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
}
