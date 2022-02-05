package kh.spring.controller.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kh.spring.dto.MdReviewDTO;
import kh.spring.service.MdReviewService;
import kh.spring.util.PageNavigator;
import kh.spring.util.PageStatic;

@RestController
@RequestMapping("/md/review/rest/")
public class MdAPIController {
	
	private final MdReviewService mdReviewService;
	
	public MdAPIController(MdReviewService mdReviewService) {
		this.mdReviewService = mdReviewService;
	}
	
}















