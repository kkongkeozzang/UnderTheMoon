package kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/md/")
@Controller
public class MdController {
	
	@RequestMapping("list")
	public String list() {
		
		return "/md/mdList";
	}
}
