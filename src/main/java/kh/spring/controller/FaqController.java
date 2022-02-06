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

import kh.spring.dto.FaqDTO;
import kh.spring.service.FaqService;
import kh.spring.util.ApiKey;
import kh.spring.util.PageNavigator;
import kh.spring.util.PageStatic;

@RequestMapping("/faq/")
@Controller
public class FaqController {
	
	private final FaqService faqService;
	
	public FaqController(FaqService faqService) {
		this.faqService = faqService;
	}
	
	@RequestMapping("toFaq")
	public String notice(Model model, int cPage) throws Exception {
//		faqService.insertDummy(); // 더미자료생성용도
		int start = cPage * PageStatic.FAQ_COUNT_PER_PAGE-(PageStatic.FAQ_COUNT_PER_PAGE - 1); 
		int end = cPage * PageStatic.FAQ_COUNT_PER_PAGE;
		List<FaqDTO> faqs = faqService.selectByBound(start, end);
		int allNoticeCount = faqService.selectRecordCount();
		String pageNavi = PageNavigator.getPageNavigator(allNoticeCount, cPage, PageStatic.FAQ_COUNT_PER_PAGE, PageStatic.FAQ_NAVI_COUNT_PER_PAGE, "faq", "all" ,"","");
		
		model.addAttribute("faqs", faqs);
		model.addAttribute("pageNavi", pageNavi);
		model.addAttribute("cPage", cPage);
	    return "/faq/faqList";
	}
	
	@ResponseBody
	@RequestMapping("username")
	public String username(String member_id) {
		String username = faqService.selectUsername(member_id);
		return username;
	}
	
	@RequestMapping("toWrite")
	public String toWrite(Model model) {
		//로그인된 아이디
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = ((UserDetails)principal).getUsername();
		int result = faqService.selectMemberId(username);
		model.addAttribute("member_id", result);
		return "/faq/faqWrite";
	}
	
	@RequestMapping("insert")
	public String insert(FaqDTO dto) {
		int result = faqService.insert(dto); // 게시판에 작성된 내용을 DB에 저장하는 부분
		return "redirect:/faq/toFaq?cPage=1";
	}
	
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		
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
	public String delete(int faq_id) {
		int result = faqService.delete(faq_id); // 게시판 글을 DB에서 삭제하는 부분
		return "redirect:/faq/toFaq?cPage=1";
	}
	
	@RequestMapping("toUpdate")
	public String toUpdate(int faq_id, int cPage, Model model) {
		FaqDTO faqs = faqService.selectById(faq_id);
		model.addAttribute("faqs", faqs);
		model.addAttribute("cPage", cPage);
		return "/faq/faqUpdate";
	}
	
	@RequestMapping("update")
	public String update(FaqDTO dto, int cPage) {
		int result = faqService.update(dto); // 게시판에 작성된 내용을 DB에 저장하는 부분
		return "redirect:/faq/toFaq?&cPage="+cPage;
	}
	
	@RequestMapping("search") //검색기능
	public String search(String select, String keyword, int cPage, Model model) {

		int start = cPage * PageStatic.FAQ_COUNT_PER_PAGE-(PageStatic.FAQ_COUNT_PER_PAGE - 1);
		int end = cPage * PageStatic.FAQ_COUNT_PER_PAGE;
		
		List<FaqDTO> faqs = faqService.selectByKeyword(start, end, select, keyword);
		int allFAQCount = faqService.selectRecordCount(select, keyword);
		String pageNavi = PageNavigator.getPageNavigator(allFAQCount, cPage, PageStatic.FAQ_COUNT_PER_PAGE, PageStatic.FAQ_NAVI_COUNT_PER_PAGE,"faq","search",select,keyword);
		model.addAttribute("faqs", faqs);
		model.addAttribute("pageNavi", pageNavi);
		model.addAttribute("cPage", cPage);
		model.addAttribute("select", select);
		model.addAttribute("keyword", keyword);
	    return "/faq/faqSearch";
	}
	
	@RequestMapping("searchForAdmin") //검색기능
	public String searchForAdmin(String select, String keyword, int cPage, Model model) {

		int start = cPage * PageStatic.FAQ_COUNT_PER_PAGE-(PageStatic.FAQ_COUNT_PER_PAGE - 1);
		int end = cPage * PageStatic.FAQ_COUNT_PER_PAGE;
		
		List<FaqDTO> faqs = faqService.selectByKeywordAdmin(start, end, select, keyword);
		int allFAQCount = faqService.selectRecordCountAdmin(select, keyword);
		String pageNavi = PageNavigator.getPageNavigator(allFAQCount, cPage, PageStatic.FAQ_COUNT_PER_PAGE, PageStatic.FAQ_NAVI_COUNT_PER_PAGE,"faq","search",select,keyword);
		model.addAttribute("faqs", faqs);
		model.addAttribute("pageNavi", pageNavi);
		model.addAttribute("cPage", cPage);
		model.addAttribute("select", select);
		model.addAttribute("keyword", keyword);
	    return "/faq/faqSearch";
	}
	
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/error";
	}

}
