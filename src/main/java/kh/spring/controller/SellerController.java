package kh.spring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.NoticeDTO;
import kh.spring.util.PageNavigator;
import kh.spring.util.PageStatic;

@RequestMapping("/seller/")
@Controller
public class SellerController {

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
	    return "/seller/sidebar";
	}
	
}
