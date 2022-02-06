package kh.spring.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.MdReviewDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.service.MdReviewService;
import kh.spring.service.MemberService;

@Controller
@RequestMapping("/md/detail/review/")
public class MdReviewController {
	
}
