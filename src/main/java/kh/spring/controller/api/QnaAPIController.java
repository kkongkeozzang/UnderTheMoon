package kh.spring.controller.api;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@RequestMapping("/qnaAPI/")
public class QnaAPIController {
	
		
	@ResponseBody
	@RequestMapping("qnaSmsProc")
	  public String send(String phone) {
		System.out.println(phone);
	    String api_key = ""; //발급받은 key 입력                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          