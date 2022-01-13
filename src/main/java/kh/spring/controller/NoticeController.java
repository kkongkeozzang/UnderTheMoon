package kh.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dao.NoticeDAO;
import kh.spring.dto.NoticeDTO;

@RequestMapping("/notice/")
@Controller
public class NoticeController {
	
	@Autowired
    public NoticeDAO dao;
	
	@RequestMapping("toNotice")
	public String notice(Model model) throws Exception {
		List<NoticeDTO> notices = dao.selectAll();
		model.addAttribute("notices", notices);
	    return "/notice/noticeList";
	}
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/";
	}

}
