package kh.spring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.MdDTO;
import kh.spring.service.MdReviewService;
import kh.spring.service.MdService;

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
	public String detail(String md_id, Model model) {
		
		MdDTO mdDetails = mdService.selectMdDetailById(md_id);
		int allMdReviewCount = mdReviewService.selectCount(md_id);
		List<MdDTO> relatedMds = mdService.selectSameRegionMdsExceptForSelectMd(md_id);
		model.addAttribute("relatedMds", relatedMds);
		model.addAttribute("mdDetails", mdDetails);
		model.addAttribute("allMdReviewCount", allMdReviewCount);
		return "/md/mdDetail";
	}
	
	
}
