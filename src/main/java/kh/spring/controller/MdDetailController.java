package kh.spring.controller;

import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.MdDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.WishDTO;
import kh.spring.service.MdReviewService;
import kh.spring.service.MdService;
import kh.spring.service.MemberService;
import kh.spring.service.WishService;
import kh.spring.util.PageStatic;

@Controller
@RequestMapping("/md/detail/")
public class MdDetailController {
	
private final MdService mdService;
private final MdReviewService mdReviewService;
private final WishService wishService;
private final MemberService memberService;
	
	public MdDetailController(MdService mdService, MdReviewService mdReviewService, WishService wishService, MemberService memberService) {
		this.mdService = mdService;
		this.mdReviewService = mdReviewService;
		this.wishService = wishService;
		this.memberService = memberService;
	}
	
	@RequestMapping(value = "page")
	public String detail(String md_id, Model model, HttpServletRequest request, HttpServletResponse response) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(principal != "anonymousUser") {
			String username = ((UserDetails)principal).getUsername();
			MemberDTO memberDTO = memberService.selectByUsername(username);
			int wishResult = wishService.selectByMdId(md_id,memberDTO.getMember_id());
			model.addAttribute("wishResult", wishResult);
		}
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
		//model.addAttribute("wishResult", wishResult);
		return "/md/mdDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="wishMd", produces="text/html;charset=utf8")
	public void wishMd (String wish_item, String md_id, String wish_price) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		WishDTO wishDTO = new WishDTO();
		wishDTO.setMember_id(memberDTO.getMember_id());
		wishDTO.setMd_id(Integer.parseInt(md_id));
		wishDTO.setWish_item(wish_item);
		wishDTO.setWish_price(Integer.parseInt(wish_price));

		wishService.insertMdWish(wishDTO);
	}
	
	@ResponseBody
	@RequestMapping(value="deleteWishMd", produces="text/html;charset=utf8")
	public String deleteWishMd(int wish_id) {
		wishService.deleteMdWish(wish_id);
		
		return String.valueOf(1);
	}
	
	@ResponseBody
	@RequestMapping(value="cancelWishMd", produces="text/html;charset=utf8")
	public void cancelWishMd(String md_id) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		wishService.deleteByMdIdWish(md_id, memberDTO.getMember_id());
	}
}
