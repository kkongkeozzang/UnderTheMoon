package kh.spring.controller.api;

import java.util.HashMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/md/detail/rest/")
public class MdDetailAPIController {
	

	@RequestMapping(value = "detailPage", produces = "application/json")
	public HashMap<String, Object> detailPage(String md_id) {
		HashMap<String, Object> result = new HashMap<>();
		return result;
	}
	
}
