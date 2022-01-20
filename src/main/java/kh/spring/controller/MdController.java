package kh.spring.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.MdDTO;
import kh.spring.service.MdService;
import kh.spring.util.PageNavigator;
import kh.spring.util.PageStatic;

@Controller
@RequestMapping("/md/")
public class MdController {
	
	private final MdService mdService;
	
	public MdController(MdService mdService) {
		this.mdService = mdService;
	}
	
	@RequestMapping("list")
	public String list(Model model) {
		int cPage = 1;
		int start = cPage*PageStatic.MD_COUNT_PER_PAGE-(PageStatic.MD_COUNT_PER_PAGE);
		int end = cPage*PageStatic.MD_COUNT_PER_PAGE;
		List<MdDTO> mds = mdService.selectByBound(start, end, "all", "none");
		int allMdCount = mdService.selectCount("all");
		List<String> pageNavis = PageNavigator.getPageNavigator(allMdCount, 1, PageStatic.MD_COUNT_PER_PAGE, PageStatic.MD_NAVI_COUNT_PER_PAGE, "all", "none");
		model.addAttribute("mds", mds);
		model.addAttribute("allMdCount", allMdCount);
		model.addAttribute("pageNavis", pageNavis);
		model.addAttribute("cPage",cPage);
		return "/md/mdList";
	}
	
	@ResponseBody
	@RequestMapping(value = "listPage", produces = "application/json")
	public HashMap<String, Object> listPage(String currentPage, String select, String sort) {
		int cPage = Integer.parseInt(currentPage);
		int start = cPage*PageStatic.MD_COUNT_PER_PAGE-(PageStatic.MD_COUNT_PER_PAGE-1);
		int end = cPage*PageStatic.MD_COUNT_PER_PAGE;
		List<MdDTO> mds = mdService.selectByBound(start, end, select, sort);
		int allMdCount = mdService.selectCount(select);
			
		List<String> pageNavis = PageNavigator.getPageNavigator(allMdCount, cPage, PageStatic.MD_COUNT_PER_PAGE, PageStatic.MD_NAVI_COUNT_PER_PAGE, select, sort);
		HashMap<String, Object> result = new HashMap<>();
		result.put("mds", mds);
		result.put("allMdCount",allMdCount);
		result.put("pageNavis", pageNavis);
		result.put("cPage", cPage);
		return result;
	}
	
	
	
	
}
