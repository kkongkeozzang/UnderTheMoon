package kh.spring.controller.api;




import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import kh.spring.service.MemberService;



@RestController
@RequestMapping("/member/")
public class MemberAPIController {

	private final MemberService memberService;
	
	public  MemberAPIController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@GetMapping(value="findUsernameProc",produces="text/html;charset=utf8")
	public String findUsername(String member_email,String member_name) {
		
		String member_username = memberService.selectByNameAndEmail(member_email,member_name);
		return member_username;
	}
		
	
}
