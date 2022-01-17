package kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TempMdDetailController {

	
	@RequestMapping("/mdDetailTemp")
	public String home() {
		
		return "/md/tempMdDetail";
	}
}
