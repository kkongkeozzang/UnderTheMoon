package kh.spring.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

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
		List<MdDTO> mds = mdService.selectByBound(start, end);
		int allMdCount = mdService.selectAllCount();
		List<String> pageNavis = PageNavigator.getPageNavigator(allMdCount, 1, PageStatic.MD_COUNT_PER_PAGE, PageStatic.MD_NAVI_COUNT_PER_PAGE);
		model.addAttribute("mds", mds);
		model.addAttribute("allMdCount", allMdCount);
		model.addAttribute("pageNavis", pageNavis);
		model.addAttribute("cPage",cPage);
		return "/md/mdList";
	}
	
	@ResponseBody
	@RequestMapping(value="listPage", produces = "application/json")
	public HashMap<String, Object> list(String currentPage) {
		int cPage = Integer.parseInt(currentPage);
		int start = cPage*PageStatic.MD_COUNT_PER_PAGE-(PageStatic.MD_COUNT_PER_PAGE-1);
		int end = cPage*PageStatic.MD_COUNT_PER_PAGE;
		List<MdDTO> mds = mdService.selectByBound(start, end);
		int allMdCount = mdService.selectAllCount();
		List<String> pageNavis = PageNavigator.getPageNavigator(allMdCount, cPage, PageStatic.MD_COUNT_PER_PAGE, PageStatic.MD_NAVI_COUNT_PER_PAGE);
		HashMap<String, Object> result = new HashMap<>();
		result.put("mds", mds);
		result.put("allMdCount",allMdCount);
		result.put("pageNavis", pageNavis);
		result.put("cPage", cPage);
		return result;
	}
	
//	@RequestMapping("reviewSort")
//	public String reviewSort(Model model) {
//		List<MdDTO> mds = mdService.selectAllReviewSort();
//		// 상품 갯수는 동일하므로 메소드 그대로 사용
//		int allMdCount = mdService.selectAllCount();
//		model.addAttribute("mds", mds);
//		model.addAttribute("allMdCount", allMdCount);
//		return "/md/mdList";
//	}
	
	@ResponseBody
	@RequestMapping(value="reviewSort", produces = "application/json")
	public HashMap<String, Object> reviewSort(String currentPage) {
		int cPage = Integer.parseInt(currentPage);
		int start = cPage*PageStatic.MD_COUNT_PER_PAGE-(PageStatic.MD_COUNT_PER_PAGE-1);
		int end = cPage*PageStatic.MD_COUNT_PER_PAGE;
		
		List<MdDTO> mds = mdService.selectByBoundReviewSort(start, end);
		// 상품 갯수는 동일하므로 메소드 그대로 사용
		int allMdCount = mdService.selectAllCount();
		List<String> pageNavis = PageNavigator.getPageNavigatorReviewSort(allMdCount, cPage, PageStatic.MD_COUNT_PER_PAGE, PageStatic.MD_NAVI_COUNT_PER_PAGE);
		HashMap<String, Object> result = new HashMap<>();
		result.put("mds", mds);
		result.put("allMdCount", allMdCount);
		result.put("pageNavis", pageNavis);
		result.put("cPage", cPage);
		return result;
	}

	
//	@RequestMapping("newSort")
//	public String newSort(Model model) {
//		List<MdDTO> mds = mdService.selectAllNewSort();
//		// 상품갯수는 동일하므로 메소드 그대로 사용
//		int allMdCount = mdService.selectAllCount();
//		model.addAttribute("allMdCount", allMdCount);
//		model.addAttribute("mds", mds);
//		return "/md/mdList";
//	}
	
	@ResponseBody
	@RequestMapping(value="newSort", produces = "application/json")
	public HashMap<String, Object> newSort(String currentPage) {
		int cPage = Integer.parseInt(currentPage);
		int start = cPage*PageStatic.MD_COUNT_PER_PAGE-(PageStatic.MD_COUNT_PER_PAGE-1);
		int end = cPage*PageStatic.MD_COUNT_PER_PAGE;
		
		List<MdDTO> mds = mdService.selectByBoundNewSort(start, end);
		// 상품 갯수는 동일하므로 메소드 그대로 사용
		int allMdCount = mdService.selectAllCount();
		List<String> pageNavis = PageNavigator.getPageNavigatorNewSort(allMdCount, cPage, PageStatic.MD_COUNT_PER_PAGE, PageStatic.MD_NAVI_COUNT_PER_PAGE);
		HashMap<String, Object> result = new HashMap<>();
		result.put("mds", mds);
		result.put("allMdCount", allMdCount);
		result.put("pageNavis", pageNavis);
		result.put("cPage", cPage);
		return result;
	}
	
}
