package kh.spring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dao.VisitCountDAO;
import kh.spring.dto.FaqDTO;
import kh.spring.dto.GradeDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.NoticeDTO;
import kh.spring.dto.VisitCountDTO;
import kh.spring.service.FaqService;
import kh.spring.service.GradeService;
import kh.spring.service.MemberService;
import kh.spring.service.NoticeService;

@RequestMapping("/admin/")
@Controller
public class AdminController {
	
	private final GradeService gradeService;
	private final MemberService memberService;
	private final NoticeService noticeService;
	private final FaqService faqService;
	private final VisitCountDAO visitCountDAO;
	
	public AdminController(GradeService gradeService, MemberService memberService, NoticeService noticeService, FaqService faqService, VisitCountDAO visitCountDAO) {
		this.gradeService = gradeService;
		this.memberService = memberService;
		this.noticeService = noticeService;
		this.faqService = faqService;
		this.visitCountDAO = visitCountDAO;
	}
	
	@RequestMapping("adminOffice")
	public String adminOffice(Model model) throws Exception {
		int totalMember = memberService.selectTotalMember();
		int todayMember = memberService.selectTodayMember();
		List<MemberDTO> memberByGrade = memberService.selectByGrade();
		int totalVisitor = visitCountDAO.selectTotalVisitor();
		int todayVisitor = visitCountDAO.selectTodayVisitor();
		List<VisitCountDTO> monthVisitor = visitCountDAO.selectMonthlyVisitor();
		
		model.addAttribute("totalMember", totalMember);
		model.addAttribute("todayMember", todayMember);
		model.addAttribute("memberByGrade", memberByGrade);
		model.addAttribute("totalVisitor", totalVisitor);
		model.addAttribute("todayVisitor", todayVisitor);
		model.addAttribute("monthVisitor", monthVisitor);
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
		List<MemberDTO> members = memberService.selectAll();
		model.addAttribute("members", members);
		return "/admin/adminMember";
	}
	
	@RequestMapping("notice")
	public String adminNotice(Model model) throws Exception {
		List<NoticeDTO> notices = noticeService.selectAll();
		model.addAttribute("notices", notices);
		return "/admin/adminNotice";
	}
	
	@RequestMapping("deleteNotice")
	public String deleteNotice(Model model, int notice_id) throws Exception {
		int result = noticeService.delete(notice_id);
		return "redirect:/admin/notice";
	}
	
	@RequestMapping("faq")
	public String adminFaq(Model model) throws Exception {
		List<FaqDTO> faqs = faqService.selectAll();
		model.addAttribute("faqs", faqs);
		return "/admin/adminFaq";
	}
	
	@RequestMapping("deleteFaq")
	public String deleteFaq(Model model, int faq_id) throws Exception {
		int result = faqService.delete(faq_id);
		return "redirect:/admin/faq";
	}
}
