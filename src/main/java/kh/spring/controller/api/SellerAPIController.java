package kh.spring.controller.api;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kh.spring.service.MdReviewService;

@RestController
@RequestMapping("/seller/rest/")
public class SellerAPIController {

	private final MdReviewService mdReviewService;
	
	public SellerAPIController(MdReviewService mdReviewService) {
		this.mdReviewService = mdReviewService;
	}
	
	@DeleteMapping("{md_review_id}")
	public ResponseEntity<Integer> deleteCart(@PathVariable String md_review_id){
		Integer result = mdReviewService.deleteByMdReviewId(String.valueOf(md_review_id));
		return new ResponseEntity<Integer>(result,HttpStatus.OK);
	}
	

}
