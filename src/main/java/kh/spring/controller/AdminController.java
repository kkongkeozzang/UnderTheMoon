package kh.spring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.GradeDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.service.GradeService;
import kh.spring.service.MemberService;

@RequestMapping("/admin/")
@Controller
public class AdminController {
	
	private final GradeService gradeService;
	private final MemberService memberService;
	
	public AdminController(GradeService gradeService, MemberService memberService) {
		this.gradeService = gradeService;
		this.memberService = memberService;
	}
	
	@RequestMapping("adminOffice")
	public String adminOffice() throws Exception {
	    return "/admin/adminDashboard";
	}
	
	@RequestMapping("grade")
	public String adminGrade(Model model) throws Exception {
		List<GradeDTO> grades = gradeService.selectAll();
		model.addAttribute("grades", grades);
	    return "/admin/adminGrade";
	}
	
	@RequestMapping("insertGrade")
	public String insertGrade(GradeDTO grades) throws Exception {
		int result = gradeService.insertGrade(grades);
	    return "redirect:/admin/grade";
	}
	
	@RequestMapping("deleteGrade")
	public String deleteGrade(String grade_name) throws Exception {
		int result = gradeService.deleteGrade(grade_name);
	    return "redirect:/admin/grade";
	}
	
	@RequestMapping("updateGrade")
	public String updateGrade(GradeDTO grades) throws Exception {
		int result = gradeService.updateGrade(grades);
	    return "redirect:/admin/grade";
	}
	
	@ResponseBody
	@RequestMapping("checkGrade")
	public String checkGrade(String grade_name, Model model) throws Exception {
		String result = Integer.toString(gradeService.checkGrade(grade_name));
	    return result;
	}
	
	@RequestMapping("member")
	public String adminMember(Model model) throws Exception {
		//List<MemberDTO> members = memberService.sele
		return "";
	}
	
}
