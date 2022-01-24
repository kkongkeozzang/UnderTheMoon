package kh.spring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.GradeDTO;
import kh.spring.dto.MdDTO;
import kh.spring.service.SellerService;

@RequestMapping("/seller/")
@Controller
public class SellerController {
	
	private final SellerService sellerService;
	
	public SellerController(SellerService sellerService) {
		this.sellerService = sellerService;
	}
	
	@RequestMapping("sellerOffice")
	public String sellerOffice() throws Exception {
//		service.insertDummy(); // 더미자료생성용도
//		int start = cPage * PageStatic.NOTICE_COUNT_PER_PAGE-(PageStatic.NOTICE_COUNT_PER_PAGE - 1);
//		int end = cPage * PageStatic.NOTICE_COUNT_PER_PAGE;
//		List<NoticeDTO> notices = noticeService.selectByBound(start, end);
//		int allNoticeCount = noticeService.selectRecordCount();
//		String pageNavi = PageNavigator.getPageNavigator(allNoticeCount, cPage, PageStatic.NOTICE_COUNT_PER_PAGE, PageStatic.NOTICE_NAVI_COUNT_PER_PAGE, "notice", "all" ,"","");
//		model.addAttribute("notices", notices);
//		model.addAttribute("pageNavi", pageNavi);
//		model.addAttribute("cPage", cPage);
	    return "/seller/sellerDashboard";
	}
	
	@RequestMapping("grade")
	public String sellerGrade(Model model) throws Exception {
		List<GradeDTO> grades = sellerService.selectAllGrade();
		model.addAttribute("grades", grades);
	    return "/seller/sellerGrade";
	}
	
	@RequestMapping("insertGrade")
	public String insertGrade(GradeDTO grades) throws Exception {
		int result = sellerService.insertGrade(grades);
	    return "redirect:/seller/grade";
	}
	
	@RequestMapping("deleteGrade")
	public String deleteGrade(String grade_name) throws Exception {
		int result = sellerService.deleteGrade(grade_name);
	    return "redirect:/seller/grade";
	}
	
	@RequestMapping("updateGrade")
	public String updateGrade(GradeDTO grades) throws Exception {
		int result = sellerService.updateGrade(grades);
	    return "redirect:/seller/grade";
	}
	
	@ResponseBody
	@RequestMapping("checkGrade")
	public String checkGrade(String grade_name, Model model) throws Exception {
		String result = Integer.toString(sellerService.checkGrade(grade_name));
	    return result;
	}
	
	@RequestMapping("md")
	public String sellerMd(Model model) throws Exception {
		List<MdDTO> mds = sellerService.selectAllMd();
		model.addAttribute("mds", mds);
	    return "/seller/sellerMd";
	}
}
