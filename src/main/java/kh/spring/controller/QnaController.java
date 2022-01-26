package kh.spring.controller;

import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.MemberDTO;
import kh.spring.dto.QnaDTO;
import kh.spring.dto.QnaResponseDTO;
import kh.spring.service.MemberService;
import kh.spring.service.QnaResponseService;
import kh.spring.service.QnaService;

@Controller
@RequestMapping("/qna/")
public class QnaController {
	
	private final QnaService qnaService;
	private final MemberService memberService;
	private final QnaResponseService qnaResponseService;
	
	public QnaController(QnaService qnaService,  MemberService memberService, QnaResponseService qnaResponseService) {
		this.qnaService = qnaService;
		this.memberService = memberService;
		this.qnaResponseService = qnaResponseService; 
	}
	
	@ResponseBody
	@RequestMapping("username")
	public String username(String member_id) {
		String username = qnaService.selectUsername(member_id);
		return username;
	}

	
	
	@RequestMapping("qnaList") //글 목록
	public String myPage(Model model) {
        System.out.println("null1");
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
        System.out.println("null2");
		MemberDTO memberDTO = memberService.selectByUsername(username);
		int result = qnaService.selectMemberId(username);
		//int qa_question_id = qnaResponseService.selectQuestionId(result);
		List<QnaDTO> qnas = qnaService.selectAllByUsername(result);
		List<QnaDTO> qnasAdmin = qnaService.selectAllAsAdmin();
        System.out.println("null3");

		//List<QnaResponseDTO> response = qnaResponseService.selectAll(result);
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("qnas", qnas); 
		model.addAttribute("member_id", result);
		model.addAttribute("qnasAdmin", qnasAdmin); 
		//model.addAttribute("qa_question_id", qa_question_id);
		//model.addAttribute("response", response);
        System.out.println("null");
		return "/qna/qnaList";
	}
	
	
	
	@RequestMapping("qnaWrite") //글 작성 폼으로 이동
	public String toWrite(Model model) {
		//로그인된 아이디
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		int result = qnaService.selectMemberId(username);
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("member_id", result);
		System.out.println(result);
		return "/qna/qnaWrite";
	}
	
	

	
	
	@RequestMapping("writeProc") //작성된 글 저장
	public String writeProc(QnaDTO dto, MultipartFile file) throws Exception{
				
		int result = qnaService.insert(dto);
		System.out.println(file.getOriginalFilename());
		return "redirect:/qna/qnaList";
	}
	
	@RequestMapping("delete")
	public String delete(int qa_question_id) {
		int result = qnaService.delete(qa_question_id);
		return "redirect:/qna/qnaList";
	}
	
	@RequestMapping("adminWriteProc")
	public String adminWriteProc(QnaResponseDTO dto, Model model) {
		int resultResponse = qnaResponseService.insert(dto);

		
		System.out.println("성공");
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		int result = qnaService.selectMemberId(username);
		int qa_question_id = qnaResponseService.selectQuestionId(result);
		List<QnaDTO> qnas = qnaService.selectAllByUsername(result);
		List<QnaDTO> qnasAdmin = qnaService.selectAllAsAdmin();
		List<QnaResponseDTO> response = qnaResponseService.selectAll(result);
		System.out.println("성공");
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("qnas", qnas); 
		model.addAttribute("member_id", result);
		model.addAttribute("qnasAdmin", qnasAdmin); 
		model.addAttribute("qa_question_id", qa_question_id);
		model.addAttribute("response", response);

		return "redirect:/qna/qnaList";
	}
	


	
	
	
	
}
