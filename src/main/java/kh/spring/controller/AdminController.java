package kh.spring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.GradeDTO;
import kh.spring.service.AdminService;

@RequestMapping("/admin/")
@Controller
public class AdminController {
	
	private final AdminService adminService;
	
	public AdminController(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@RequestMapping("adminOffice")
	public String adminOffice() throws Exception {
	    return "/admin/adminDashboard";
	}
	
	@RequestMapping("grade")
	public String sellerGrade(Model model) throws Exception {
		List<GradeDTO> grades = adminService.selectAllGrade();
		model.addAttribute("grades", grades);
	    return "/admin/adminGrade";
	}
	
	@RequestMapping("insertGrade")
	public String insertGrade(GradeDTO grades) throws Exception {
		int result = adminService.insertGrade(grades);
	    return "redirect:/admin/grade";
	}
	
	@RequestMapping("deleteGrade")
	public String deleteGrade(String grade_name) throws Exception {
		int result = adminService.deleteGrade(grade_name);
	    return "redirect:/admin/grade";
	}
	
	@RequestMapping("updateGrade")
	public String updateGrade(GradeDTO grades) throws Exception {
		int result = adminService.updateGrade(grades);
	    return "redirect:/admin/grade";
	}
	
	@ResponseBody
	@RequestMapping("checkGrade")
	public String checkGrade(String grade_name, Model model) throws Exception {
		String result = Integer.toString(adminService.checkGrade(grade_name));
	    return result;
	}
	
}
