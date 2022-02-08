package kh.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
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
	public String list(Model model, HttpServletRequest request, HttpServletResponse response) {
		int cPage = 1;
		int start = cPage*PageStatic.MD_COUNT_PER_PAGE-(PageStatic.MD_COUNT_PER_PAGE);
		int end = cPage*PageStatic.MD_COUNT_PER_PAGE;
		List<MdDTO> mds = mdService.selectByBound(start, end, "all", "none");
		int allMdCount = mdService.selectCount("all");
		List<String> pageNavis = PageNavigator.getPageNavigator(allMdCount, 1, PageStatic.MD_COUNT_PER_PAGE, PageStatic.MD_NAVI_COUNT_PER_PAGE, "all", "none");
		// 최근 본 상품 html 리스트 전송
		Cookie[] cookies = request.getCookies();
		List<String> mdImgs = new ArrayList<>();
		if(cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("mdView")) {
					String[] temp = cookie.getValue().split("/");
					for(String md_id : temp) {
						String str = "";
						str += "<div class=\'img-box\' style='display:flex'>";
						str += "<a href='";
						str += "/md/detail/page?md_id=";
						str += md_id;
						str += "'>";
						str += "<img src=\'";
						str += "/mdImage/"; // 외부 경로 설정
						str += mdService.selectMdDetailById(md_id).getMd_image();
						str += "\'>";
						str += "</a>";
						str += "</div>";
						mdImgs.add(str);
					}
				}
			}
		}
		model.addAttribute("mds", mds);
		model.addAttribute("allMdCount", allMdCount);
		model.addAttribute("pageNavis", pageNavis);
		model.addAttribute("cPage",cPage);
		model.addAttribute("mdImgs",mdImgs);
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
	
	@RequestMapping("search")
	public String search(Model model, String search, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int cPage = 1;
		int start = cPage*PageStatic.MD_COUNT_PER_PAGE-(PageStatic.MD_COUNT_PER_PAGE);
		int end = cPage*PageStatic.MD_COUNT_PER_PAGE;
		List<MdDTO> mds = mdService.selectByBoundForSearch(start, end, search, "all");
		int searchMdCount = mdService.selectSerchResultCount(search);
		List<String> pageNavis = PageNavigator.getPageNavigator(searchMdCount, 1, PageStatic.MD_COUNT_PER_PAGE, PageStatic.MD_NAVI_COUNT_PER_PAGE, search, "search");
		// 최근 본 상품 html 리스트 전송
		Cookie[] cookies = request.getCookies();
		List<String> mdImgs = new ArrayList<>();
		if(cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("mdView")) {
					String[] temp = cookie.getValue().split("/");
					for(String md_id : temp) {
						String str = "";
						str += "<div class=\'img-box\' style='display:flex'>";
						str += "<a href='";
						str += "/md/detail/page?md_id=";
						str += md_id;
						str += "'>";
						str += "<img src=\'";
						str += "/mdImage/"; // 외부 경로 설정
						str += mdService.selectMdDetailById(md_id).getMd_image();
						str += "\'>";
						str += "</a>";
						str += "</div>";
						mdImgs.add(str);
					}
				}
			}
		}
		model.addAttribute("mds", mds);
		model.addAttribute("allMdCount", searchMdCount);
		model.addAttribute("pageNavis", pageNavis);
		model.addAttribute("cPage",cPage);
		model.addAttribute("mdImgs",mdImgs);
		model.addAttribute("search",search);
		return "/md/mdSearchList";


	}
	
	@ResponseBody
	@RequestMapping(value = "listSearchPage", produces = "application/json")
	public HashMap<String, Object> listSearchPage(String currentPage, String select, String sort) {
		int cPage = Integer.parseInt(currentPage);
		int start = cPage*PageStatic.MD_COUNT_PER_PAGE-(PageStatic.MD_COUNT_PER_PAGE-1);
		int end = cPage*PageStatic.MD_COUNT_PER_PAGE;
		List<MdDTO> mds = mdService.selectByBoundForSearch(start, end, select, sort);
		int searchMdCount = mdService.selectSerchResultCount(select);
			
		List<String> pageNavis = PageNavigator.getPageNavigator(searchMdCount, cPage, PageStatic.MD_COUNT_PER_PAGE, PageStatic.MD_NAVI_COUNT_PER_PAGE, select, sort);
		HashMap<String, Object> result = new HashMap<>();
		result.put("mds", mds);
		result.put("allMdCount",searchMdCount);
		result.put("pageNavis", pageNavis);
		result.put("cPage", cPage);
		return result;
	}
	
	
	
}
