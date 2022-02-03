package kh.spring.controller.api;


import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.Random;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kh.spring.service.MemberService;
import kh.spring.service.VerificationService;



@RestController
@RequestMapping("/member/")
public class MemberAPIController {

	private final MemberService memberService;

	private final VerificationService verificationService;
	
	public  MemberAPIController(MemberService memberService,VerificationService verificationService) {
		this.memberService = memberService;
		this.verificationService = verificationService;
	}
	
		
	@GetMapping(value="findUsernameProc",produces="text/html;charset=utf8")
	public String findUsername(String member_email,String member_name) {
		
		String member_username = memberService.selectByNameAndEmail(member_email,member_name);
		return member_username;
	}


		
	@GetMapping(value="findPasswordProc",produces="text/html;charset=utf8")
	public String findPasswordProc(String member_username,String member_phone) throws JsonProcessingException {
		
		Optional<Integer> opt = memberService.selectByUsernameAndPhone(member_username,member_phone);
		String result = "";
		String phone = String.valueOf(opt);
		
		if(opt.isEmpty()) {
			System.out.println(phone);
			result = "1";
			
		}else if(!(opt.isEmpty())){
		 Random rand  = new Random();
	        String numStr = "";
	        for(int i=0; i<4; i++) {
	            String ran = Integer.toString(rand.nextInt(10));
	            numStr+=ran;
	        }

	        System.out.println("수신자 번호 : " + member_phone);
	        System.out.println("인증번호 : " + numStr);
	        verificationService.verifiedPhoneNumber(member_phone,numStr);
		
	        Map<String,Object> map = new HashMap<>();
	        map.put("result", phone);
	        map.put("numStr", numStr);
	        
	        result = new ObjectMapper().writeValueAsString(map);
	        
		}
		return result;
	}
	
	@PostMapping("resetPasswordProc")
	public String resetPasswordProc( String member_password,String member_username) {
		
		int result = memberService.resetPassword(member_password,member_username);
		
		return String.valueOf(result);
	}
	
	
}
