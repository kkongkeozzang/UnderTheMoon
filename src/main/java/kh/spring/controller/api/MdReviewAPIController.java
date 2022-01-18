package kh.spring.controller.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	
	public MdReviewAPIController(MdReviewService mdReviewService) {
		this.mdReviewService = mdReviewService;
	}
	
	
	
	@GetMapping(value="board/{md_id}/{sort}/{currentPage}",produces = "application/json")
	public ResponseEntity<Map<String,Object>> board(@PathVariable String md_id, @PathVariable String sort, @PathVariable String currentPage) {
		int cPage = Integer.parseInt(currentPage);
		int start = cPage*PageStatic.MD_REVIEW_COUNT_PER_PAGE-(PageStatic.MD_REVIEW_COUNT_PER_PAGE-1);
		int end = cPage*PageStatic.MD_REVIEW_COUNT_PER_PAGE;
		List<MdReviewDTO> reviews = mdReviewService.selectAllByBoundByMdId(md_id, start, end, "none");
		int allMdReviewCount = mdReviewService.selectCount(md_id);
		List<String> pageNavis = PageNavigator.getPageNavigator(allMdReviewCount, cPage, PageStatic.MD_COUNT_PER_PAGE, PageStatic.MD_NAVI_COUNT_PER_PAGE, "all", sort);
		Map<String,Object> result = new HashMap<>();
		result.put("reviews", reviews);
		result.put("pageNavis", pageNavis);
		return new ResponseEntity<>(result,HttpStatus.OK);
	}
	
	
	
}















