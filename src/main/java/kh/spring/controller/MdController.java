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
	
}
