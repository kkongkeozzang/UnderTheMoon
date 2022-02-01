package kh.spring.controller.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kh.spring.dto.MdReviewDTO;
import kh.spring.dto.MdReviewImageDTO;
import kh.spring.service.MdReviewImageService;
import kh.spring.service.MdReviewService;
import kh.spring.service.MemberService;
import kh.spring.util.PageNavigator;
import kh.spring.util.PageStatic;

@RestController
@RequestMapping("/md/detail/review/rest/")
public class MdReviewAPIController {
	
	private final MdReviewService mdReviewService;
	private final MemberService memberService;
	private final MdReviewImageService mdReviewImageService;
	
	public MdReviewAPIController(MdReviewService mdReviewService, MemberService memberService, MdReviewImageService mdReviewImageService) {
		this.mdReviewService = mdReviewService;
		this.memberService = memberService;
		this.mdReviewImageService = mdReviewImageService;
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
	
	@GetMapping(value="board/like/{md_review_id}", produces = "application/json")
	public ResponseEntity<String> addLikeCount(@PathVariable String md_review_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int result = 0;
		Cookie oldCookie = null;
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals("mdReviewLike")) {
	                oldCookie = cookie;
	            }
	        }
	    }

	    if (oldCookie != null) {
	        if (!oldCookie.getValue().contains("[" + md_review_id.toString() + "]")) {
	            result = mdReviewService.mdReviewLikeCountUp(md_review_id);
	            oldCookie.setValue(oldCookie.getValue() + "_[" + md_review_id + "]");
	            oldCookie.setPath("/");
	            oldCookie.setMaxAge(60 * 60 * 24);
	            response.addCookie(oldCookie);
	        }
	    } else {
	    	result = mdReviewService.mdReviewLikeCountUp(md_review_id);
	        Cookie newCookie = new Cookie("mdReviewLike","[" + md_review_id + "]");
	        newCookie.setPath("/");
	        newCookie.setMaxAge(60 * 60 * 24);
	        response.addCookie(newCookie);
	    }
		
		String updateLikeCount = String.valueOf(mdReviewService.selectMdReviewLikeCount(md_review_id));
		
		return new ResponseEntity<String>(updateLikeCount, HttpStatus.OK);
	}
	
	@PostMapping(value="write",produces = "application/json")
	public ResponseEntity<Integer> write(MdReviewDTO mdReview) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		int member_id = memberService.selectIdByUsername(username);
		mdReview.setMember_id(String.valueOf(member_id));
		int md_review_id = mdReviewService.insertMdReview(mdReview);
		return new ResponseEntity<>(md_review_id,HttpStatus.OK);
	}
	
	@GetMapping(value="board/image/{md_review_id}", produces = "application/json")
	public ResponseEntity<Map<String,Object>> getImages(@PathVariable String md_review_id) throws Exception {
		List<MdReviewImageDTO> images = mdReviewImageService.selectAllByMdReviewId(md_review_id);
		Map<String,Object> result = new HashMap<>();
		result.put("images", images);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@GetMapping(value="read/{md_review_id}",produces = "application/json")
	public ResponseEntity<Map<String,Object>> board(@PathVariable String md_review_id) {
		List<MdReviewDTO> review = mdReviewService.selectMdReviewByMdReviewId(md_review_id);
		List<MdReviewImageDTO> images = mdReviewImageService.selectAllByMdReviewId(md_review_id);
		Map<String,Object> result = new HashMap<>();
		result.put("review", review);
		result.put("images", images);
		return new ResponseEntity<>(result,HttpStatus.OK);
	}
	
	@DeleteMapping(value="delete/{md_review_id}",produces = "application/json")
	public ResponseEntity<String> delete(@PathVariable String md_review_id) {
		int result = mdReviewService.deleteByMdReviewId(md_review_id);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	
}















