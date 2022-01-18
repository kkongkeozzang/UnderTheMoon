package kh.spring.controller.api;

import java.util.HashMap;

import org.apache.maven.model.Model;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kh.spring.dto.MdDTO;

@RestController
@RequestMapping("/md/detail/rest/")
public class MdDetailAPIController {
	

	@RequestMapping(value = "detailPage", produces = "application/json")
	public HashMap<String, Object> detailPage(String md_id) {
		HashMap<String, Object> result = new HashMap<>();
		return result;
	}
	
//	@RequestMapping(value = "page", produces = "application/json")
//	public ResponseEntity<MdDTO> detail(String md_id, Model model) {
//		MdDTO mdDetails = mdService.selectMdDetailById(md_id);
//		return new ResponseEntity<>(mdDetails, HttpStatus.OK);
//	}
}
