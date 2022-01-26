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
	    String api_key = ""; //발급받은 key 입력
	    String api_secret = ""; 
	    Message coolsms = new Message(api_key, api_secret);

 
	    System.out.println("done");
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phone);
	    params.put("from", ""); //발신자 번호 입력
	    params.put("type", "SMS");
	    params.put("text", "작성하신 문의글에 답변 작성이 완료됐습니다.");
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    } 
	    
	    return "true";
	  }
	

	

}
