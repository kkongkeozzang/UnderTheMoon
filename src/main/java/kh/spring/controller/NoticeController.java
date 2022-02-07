package kh.spring.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import kh.spring.dto.NoticeDTO;
import kh.spring.service.NoticeService;
import kh.spring.util.ApiKey;
import kh.spring.util.PageNavigator;
import kh.spring.util.PageStatic;

@RequestMapping("/notice/")
@Controller
public class NoticeController {
	
	private final NoticeService noticeService;
	
	public NoticeController(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	
	@RequestMapping("toNotice")

	public String notice(Model model, int cPage) throws Exception {
//		service.insertDummy(); // 더미자료생성용도
		int start = cPage * PageStatic.NOTICE_COUNT_PER_PAGE-(PageStatic.NOTICE_COUNT_PER_PAGE - 1);
		int end = cPage * PageStatic.NOTICE_COUNT_PER_PAGE;
		List<NoticeDTO> notices = noticeService.selectByBound(start, end);
		int allNoticeCount = noticeService.selectRecordCount();
		String pageNavi = PageNavigator.getPageNavigator(allNoticeCount, cPage, PageStatic.NOTICE_COUNT_PER_PAGE, PageStatic.NOTICE_NAVI_COUNT_PER_PAGE, "notice", "all" ,"","");
		model.addAttribute("notices", notices);
		model.addAttribute("pageNavi", pageNavi);
		model.addAttribute("cPage", cPage);
	    return "/notice/noticeList";
	}
	
	@RequestMapping("detail")
	public String selectById(int notice_id, int member_id, Model model, int cPage) throws Exception {
		NoticeDTO notices = noticeService.selectById(notice_id);
		int viewCount = noticeService.updateViewCount(notice_id);
		NoticeDTO selectUpDown = noticeService.selectUpDown(notice_id);
		String username = noticeService.selectUsername(member_id);

		model.addAttribute("notices", notices);
		model.addAttribute("username", username);
		model.addAttribute("upDown", selectUpDown);
		model.addAttribute("cPage", cPage);
		return "/notice/noticeDetail";
	}
		
	@RequestMapping("toWrite")
	public String toWrite(Model model) throws Exception {
		//로그인된 아이디
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = ((UserDetails)principal).getUsername();
		int result = noticeService.selectMemberId(username);
		model.addAttribute("member_id", result);
		return "/notice/noticeWrite";
	}
	
	@RequestMapping("insert")
	public String insert(NoticeDTO dto) throws Exception {
		int result = noticeService.insert(dto); // 게시판에 작성된 내용을 DB에 저장하는 부분
		return "redirect:/notice/toNotice?cPage=1";
	}
	
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  throws Exception {
		
		JsonObject jsonObject = new JsonObject();
		
        
		String fileRoot = ApiKey.SUMMERNOTE_FILE; // 외부경로로 저장을 희망할때.
				
		// 내부경로로 저장
//		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
//		System.out.println(contextRoot);
//		String fileRoot = contextRoot+"resources/fileupload/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernoteImage/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	
	@RequestMapping("delete")
	public String delete(int notice_id)  throws Exception{
		int result = noticeService.delete(notice_id); // 게시판에 작성된 내용을 DB에 저장하는 부분
		return "redirect:/notice/toNotice?cPage=1";
	}
	
	@RequestMapping("toUpdate")
	public String toUpdate(int notice_id, int cPage, Model model)  throws Exception {
		NoticeDTO notices = noticeService.selectById(notice_id);
		model.addAttribute("notices", notices);
		model.addAttribute("cPage", cPage);
		return "/notice/noticeUpdate";
	}
	
	@RequestMapping("update")
	public String update(NoticeDTO dto, int cPage)  throws Exception{
		int result = noticeService.update(dto); // 게시판에 작성된 내용을 DB에 저장하는 부분
		return "redirect:/notice/detail?notice_id="+dto.getNotice_id()+"&member_id="+dto.getMember_id()+"&cPage="+cPage;
	}
	
	@RequestMapping("search") //검색기능
	public String search(String select, String keyword, int cPage, Model model)  throws Exception{
		

		int start = cPage * PageStatic.NOTICE_COUNT_PER_PAGE-(PageStatic.NOTICE_COUNT_PER_PAGE - 1);
		int end = cPage * PageStatic.NOTICE_COUNT_PER_PAGE;
		
		List<NoticeDTO> notices = noticeService.selectByKeyword(start, end, select, keyword);
		int allNoticeCount = noticeService.selectRecordCount(select, keyword);
		String pageNavi = PageNavigator.getPageNavigator(allNoticeCount, cPage, PageStatic.NOTICE_COUNT_PER_PAGE, PageStatic.NOTICE_NAVI_COUNT_PER_PAGE, "notice", "search",select,keyword);
		model.addAttribute("notices", notices);
		model.addAttribute("pageNavi", pageNavi);
		model.addAttribute("cPage", cPage);
		model.addAttribute("select", select);
		model.addAttribute("keyword", keyword);
	    return "/notice/noticeSearch";
		
	}
	
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/error";
	}

}
