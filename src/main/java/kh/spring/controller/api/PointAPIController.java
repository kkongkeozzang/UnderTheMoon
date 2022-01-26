package kh.spring.controller.api;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kh.spring.service.PointService;

@RestController
@RequestMapping("/point/rest/")
public class PointAPIController {

	private final PointService pointService;
	
	PointAPIController( PointService pointService){
		this.pointService = pointService;
	}
	
	@PostMapping("{member_id}/{pointSum}")
	public ResponseEntity<Integer> insertUsedPoint(@PathVariable Integer member_id,@PathVariable  Integer pointSum){
		
		Integer result = pointService.insertUsedPoint(member_id,pointSum);
		
		return new ResponseEntity<Integer>(result,HttpStatus.OK);
		
	}
	
	@PostMapping("/savePoints/{member_id}/{productTotal}")
	public ResponseEntity<Integer> savePoints(@PathVariable Integer member_id,@PathVariable Integer productTotal){
		System.out.println("포인트"+member_id+productTotal);
		
		Integer result = pointService.savePoints(member_id,productTotal);
		
		return new ResponseEntity<Integer>(result,HttpStatus.OK);
		
	}
}
