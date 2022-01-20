package kh.spring.controller.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kh.spring.dto.MdReviewDTO;
import kh.spring.service.MdReviewService;
import kh.spring.util.PageNavigator;
import kh.spring.util.PageStatic;

@RestController
@RequestMapping("/md/detail/review/rest/")
public class MdReviewAPIController {
	
	private final MdReviewService mdReviewService;
	
	@Autowired
	public MdReviewAPIController(MdReviewService mdReviewService) {
		this.mdReviewService = mdReviewService;
	}
	
	
	
	@GetMapping(value="board/{md_id}/{sort}/{currentPage}",produces = "application/json")
	public ResponseEntity<Map<String,Object>> board(@PathVariable String md_id, @PathVariable String sort, @PathVariable String currentPage) {
		int cPage = Integer.parseInt(currentPage);
		int start = cPage*PageStatic.MD_REVIEW_COUNT_PER_PAGE-(PageStatic.MD_REVIEW_COUNT_PER_PAGE-1);
		int end = cPage*PageStatic.MD_REVIEW_COUNT_PER_PAGE;
		List<MdReviewDTO> reviews = mdReviewService.selectAllByBoundByMdId(md_id, start, end, sort);
		int allMdReviewCount = mdReviewService.selectCount(md_id);
		List<String> pageNavis = PageNavigator.getPageNavigator(allMdReviewCount, cPage, PageStatic.MD_COUNT_PER_PAGE, PageStatic.MD_NAVI_COUNT_PER_PAGE, "all", sort);
		Map<String,Object> result = new HashMap<>();
		result.put("reviews", reviews);
		result.put("pageNavis", pageNavis);
		return new ResponseEntity<>(result,HttpStatus.OK);
	}
	
	@GetMapping(value="board/{md_review_id}", produces = "application/json")
	public ResponseEntity<String> addViewCount(@PathVariable String md_review_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int result = 0;
		Cookie oldCookie = null;
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals("mdReviewView")) {
	                oldCookie = cookie;
	            }
	        }
	    }

	    if (oldCookie != null) {
	        if (!oldCookie.getValue().contains("[" + md_review_id.toString() + "]")) {
	            result = mdReviewService.mdReviewViewCountUp(md_review_id);
	            oldCookie.setValue(oldCookie.getValue() + "_[" + md_review_id + "]");
	            oldCookie.setPath("/");
	            oldCookie.setMaxAge(60 * 60 * 24);
	            response.addCookie(oldCookie);
	        }
	    } else {
	    	result = mdReviewService.mdReviewViewCountUp(md_review_id);
	        Cookie newCookie = new Cookie("mdReviewView","[" + md_review_id + "]");
	        newCookie.setPath("/");
	        newCookie.setMaxAge(60 * 60 * 24);
	        response.addCookie(newCookie);
	    }
		
		String updateViewCount = String.valueOf(mdReviewService.selectMdReviewViewCount(md_review_id));
		
		return new ResponseEntity<String>(updateViewCount, HttpStatus.OK);
	}
	
	
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/";
	}
	
}















