package kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.service.MemberService;
import kh.spring.service.PointService;

@Controller
@RequestMapping("/point/")
public class PointController {
	
	private final MemberService memberService;
	private final PointService pointService;
	
	public PointController(PointService pointService, MemberService memberService) {
		this.pointService = pointService;
		this.memberService = memberService;
	}
	
}
