package kh.spring.controller;

import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.MdDTO;
import kh.spring.service.MdReviewService;
import kh.spring.service.MdService;
import kh.spring.util.PageStatic;

@Controller
@RequestMapping("/md/detail/")
public class MdDetailController {
	
private final MdService mdService;
private final MdReviewService mdReviewService;
	
	public MdDetailController(MdService mdService, MdReviewService mdReviewService) {
		this.mdService = mdService;
		this.mdReviewService = mdReviewService;
	}
	
	@RequestMapping(value = "page")
	public String detail(String md_id, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		MdDTO mdDetails = mdService.selectMdDetailById(md_id);
		int allMdReviewCount = mdReviewService.selectCount(md_id);
		List<MdDTO> relatedMds = mdService.selectSameRegionMdsExceptForSelectMd(md_id);
		
		// 상품 번호 쿠키에 추가
		
		// 쿠키 찾기 
		Cookie[] cookies = request.getCookies();
		Cookie oldCookie = null; 
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("mdView")) {
					oldCookie = cookie;
				}
			}
		}
		
		// 쿠키가 없다면 생성해주기
		if(oldCookie == null) {
			Cookie newCookie = new Cookie("mdView", md_id);
	        newCookie.setPath("/");
	        newCookie.setMaxAge(60 * 60 * 24);
	        response.addCookie(newCookie);
		} else {  // 쿠키가 있다면
			
			// 쿠키 내용을 split 해서 linkedList로 담기
			LinkedList<String> mdIds = new LinkedList<>();
			String[] temp = oldCookie.getValue().split("/");
			// 5개가 넘으면 최근 순으로 자르기
			int limit = temp.length;
			if(limit > PageStatic.RECENTLY_MD_VIEW_COOKIE_LIMIT) {
				limit = PageStatic.RECENTLY_MD_VIEW_COOKIE_LIMIT;
			}
			for(int i = 0; i < limit; i++) {
				mdIds.add(temp[i]);
			}
			// 쿠키에 해당 상품 번호가 들어있는지 확인
			int index = mdIds.indexOf(md_id);  // 해당 번호의 인덱스
			// 안들어있으면(-1) 맨 처음에 해당 번호 넣어주기
			if (index == -1) {
				mdIds.addFirst(md_id);
			// 처음에 있지 않다면(0이아닐때) 삭제하고 맨 처음에 넣어준다
			} else if(index != 0) {
				mdIds.remove(index);
				mdIds.addFirst(md_id);
			} // 처음이면 (0일때) 아무것도 안함
			
			// String 값으로 이어주기
			String updateCookieValue = mdIds.stream().collect(Collectors.joining("/"));
			// 쿠키값 업데이트
			oldCookie.setValue(updateCookieValue);
			oldCookie.setPath("/");
			response.addCookie(oldCookie);
		}
		
		model.addAttribute("relatedMds", relatedMds);
		model.addAttribute("mdDetails", mdDetails);
		model.addAttribute("allMdReviewCount", allMdReviewCount);
		return "/md/mdDetail";
	}
	
	
}
