package kh.spring.controller.api;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kh.spring.service.MemberService;

@RestController
@RequestMapping("/admin/rest/")
public class AdminAPIController {

	private final MemberService memberService;
	
	public AdminAPIController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@DeleteMapping("{member_id}")
	public ResponseEntity<Integer> deleteCart(@PathVariable String member_id){
		Integer result = memberService.deleteByMemberId(String.valueOf(member_id));
		return new ResponseEntity<Integer>(result,HttpStatus.OK);
	}
	

}
