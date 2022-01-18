package kh.spring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.MdDTO;
import kh.spring.service.MdService;

@Controller
@RequestMapping("/md/detail/")
public class MdDetailController {
	
private final MdService mdService;
	
	public MdDetailController(MdService mdService) {
		this.mdService = mdService;
	}
	
	@RequestMapping(value = "page")
	public String detail(String md_id, Model model) {
		System.out.println(md_id+"ddd");
		MdDTO mdDetails = mdService.selectMdDetailById(md_id);
		List<MdDTO> relatedMds = mdService.selectSameRegionMdsExceptForSelectMd(md_id);
		model.addAttribute("relatedMds", relatedMds);
		model.addAttribute("mdDetails", mdDetails);
		return "/md/mdDetail";
	}
	
	
}
