package kh.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.NoticeDTO;
import kh.spring.service.NoticeService;

@RequestMapping("/notice/")
@Controller
public class NoticeController {
	
	@Autowired
	public NoticeService service;
	
	@RequestMapping("toNotice")
	public String notice(Model model) throws Exception {
		List<NoticeDTO> notices = service.selectAll();
		model.addAttribute("notices", notices);
		
	    return "/notice/noticeList";
	}
	
	@RequestMapping("detail")
	public String selectById(int notice_id, Model model) {
		NoticeDTO dto = service.selectById(notice_id);
		String username = service.selectUsername(notice_id);
		model.addAttribute("dto", dto);
		model.addAttribute("username", username);
		return "/notice/noticeDetail";
	}
	
	
	
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/";
	}

}
