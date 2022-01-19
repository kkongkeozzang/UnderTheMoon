package kh.spring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.GradeDTO;
import kh.spring.service.GradeService;


@Controller
@RequestMapping("/mypage/")
public class MyPageController {

	private final GradeService gradeService;
	
	public MyPageController(GradeService gradeService) {
		this.gradeService = gradeService;
	}
	
	@RequestMapping("myPageList")
	public String myPage() {		
		return "/mypage/myPageList";
	}
	
	@RequestMapping("myPageGrade")
	public String myPageGrade(Model model) {
		List<GradeDTO> gradeList = gradeService.selectAll();
		model.addAttribute("gradeList",gradeList);
		return "/mypage/myPageGrade";	
	}
}
