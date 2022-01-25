package kh.spring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.NoticeDTO;
import kh.spring.util.PageNavigator;
import kh.spring.util.PageStatic;

@RequestMapping("/event/")
@Controller
public class EventController {
	
	@RequestMapping("toEvent")
	public String toEvent() throws Exception {
	    return "/event/eventList";
	}
	
	@RequestMapping("/eventTiger")
	public String eventTiger() throws Exception {
	    return "/event/eventTiger";
	}
	
	@RequestMapping("/eventWelcome")
	public String eventWelcome() throws Exception {
	    return "/event/eventWelcome";
	}
	
	@RequestMapping("/eventKH")
	public String eventKH() throws Exception {
	    return "/event/eventKH";
	}
	
	@RequestMapping("/eventRecommend")
	public String eventRecommend() throws Exception {
	    return "/event/eventRecommend";
	}
}
