package kh.spring.controller.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kh.spring.dto.MdInqryDTO;
import kh.spring.service.MdInqryService;
import kh.spring.service.MemberService;
import kh.spring.util.PageNavigator;
import kh.spring.util.PageStatic;

@RestController
@RequestMapping("/md/detail/inqry/rest/")
public class MdInqryAPIController {
	
	private final MdInqryService mdInqryService;
	
	public MdInqryAPIController(MdInqryService mdInqryService) {
		this.mdInqryService = mdInqryService;
	}
	
	@GetMapping(value="board/{md_id}/{sort}/{currentPage}",produces = "application/json")
	public ResponseEntity<Map<String,Object>> board(@PathVariable String md_id, @PathVariable String sort, @PathVariable String currentPage) {
		int cPage = Integer.parseInt(currentPage);
		int start = cPage*PageStatic.MD_REVIEW_COUNT_PER_PAGE-(PageStatic.MD_REVIEW_COUNT_PER_PAGE-1);
		int end = cPage*PageStatic.MD_REVIEW_COUNT_PER_PAGE;
		List<MdInqryDTO> inqrys = mdInqryService.selectAllByBoundByMdId(md_id, start, end, sort);
		int allMdInqryCount = mdInqryService.selectCount(md_id);
		List<String> pageNavis = PageNavigator.getPageNavigator(allMdInqryCount, cPage, PageStatic.MD_COUNT_PER_PAGE, PageStatic.MD_NAVI_COUNT_PER_PAGE, "all", sort);
		Map<String,Object> result = new HashMap<>();
		result.put("inqrys", inqrys);
		result.put("pageNavis", pageNavis);
		return new ResponseEntity<>(result,HttpStatus.OK);
	}
	
	@DeleteMapping(value="delete/{md_inqry_id}",produces = "application/json")
	public ResponseEntity<String> delete(@PathVariable String md_inqry_id) {
		int result = mdInqryService.delete(md_inqry_id);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
}
