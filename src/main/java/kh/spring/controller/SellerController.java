package kh.spring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.MdDTO;
import kh.spring.service.MdService;

@RequestMapping("/seller/")
@Controller
public class SellerController {
	
	private final MdService mdService;
	
	public SellerController(MdService mdService) {
		this.mdService = mdService;
	}
	
	@RequestMapping("sellerOffice")
	public String sellerOffice() throws Exception {
	    return "/seller/sellerDashboard";
	}
	
	@RequestMapping("md")
	public String sellerMd(Model model) throws Exception {
		List<MdDTO> mds = mdService.selectAll();
		model.addAttribute("mds", mds);
	    return "/seller/sellerMd";
	}
	
	@ResponseBody
	@RequestMapping("checkMd")
	public String checkMd(String md_name) throws Exception {
		String result = Integer.toString(mdService.checkMd(md_name));
	    return result;
	}
	
	@RequestMapping("insertMd")
	public String insertMd(MdDTO mds) throws Exception {
		int result = mdService.insertMd(mds);
	    return "redirect:/seller/md";
	}
	
//	@RequestMapping("grade")
//	public String sellerGrade(Model model) throws Exception {
//		List<GradeDTO> grades = mdService.selectAllGrade();
//		model.addAttribute("grades", grades);
//	    return "/seller/sellerGrade";
//	}
//	
//	@RequestMapping("insertGrade")
//	public String insertGrade(GradeDTO grades) throws Exception {
//		int result = mdService.insertGrade(grades);
//	    return "redirect:/seller/grade";
//	}
//	
//	@RequestMapping("deleteGrade")
//	public String deleteGrade(String grade_name) throws Exception {
//		int result = mdService.deleteGrade(grade_name);
//	    return "redirect:/seller/grade";
//	}
//	
//	@RequestMapping("updateGrade")
//	public String updateGrade(GradeDTO grades) throws Exception {
//		int result = mdService.updateGrade(grades);
//	    return "redirect:/seller/grade";
//	}
//	
//	@ResponseBody
//	@RequestMapping("checkGrade")
//	public String checkGrade(String grade_name, Model model) throws Exception {
//		String result = Integer.toString(mdService.checkGrade(grade_name));
//	    return result;
//	}

}
