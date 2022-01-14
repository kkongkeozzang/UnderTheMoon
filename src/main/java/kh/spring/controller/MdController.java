package kh.spring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.MdDTO;
import kh.spring.service.MdService;

@Controller
@RequestMapping("/md/")
public class MdController {
	
	private final MdService mdService;
	
	public MdController(MdService mdService) {
		this.mdService = mdService;
	}
	
	@RequestMapping("list")
	public String list(Model model) {
		List<MdDTO> mds = mdService.selectAll();
		int allMdCount = mdService.selectAllCount();
		model.addAttribute("mds", mds);
		model.addAttribute("allMdCount", allMdCount);
		System.out.println(mds.size());
		return "/md/mdList";
	}
	
	@RequestMapping("reviewSort")
	public String reviewSort(Model model) {
		List<MdDTO> mds = mdService.selectAllReviewSort();
		// 상품 갯수는 동일하므로 메소드 그대로 사용
		int allMdCount = mdService.selectAllCount();
		model.addAttribute("mds", mds);
		model.addAttribute("allMdCount", allMdCount);
		return "/md/mdList";
	}
	
	@RequestMapping("newSort")
	public String newSort(Model model) {
		List<MdDTO> mds = mdService.selectAllNewSort();
		// 상품갯수는 동일하므로 메소드 그대로 사용
		int allMdCount = mdService.selectAllCount();
		model.addAttribute("allMdCount", allMdCount);
		model.addAttribute("mds", mds);
		return "/md/mdList";
	}
	
}
