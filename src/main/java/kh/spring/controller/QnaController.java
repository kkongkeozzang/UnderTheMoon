package kh.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.MemberDTO;
import kh.spring.dto.QnaDTO;
import kh.spring.dto.QnaResponseDTO;
import kh.spring.service.CouponService;
import kh.spring.service.MemberService;
import kh.spring.service.PointService;
import kh.spring.service.QnaResponseService;
import kh.spring.service.QnaService;

@Controller
@RequestMapping("/qna/")
public class QnaController {
	
	private final QnaService qnaService;
	private final MemberService memberService;
	private final QnaResponseService qnaResponseService;
	private final CouponService couponService;
	private final PointService pointService;
	
	public QnaController(QnaService qnaService,  MemberService memberService, QnaResponseService qnaResponseService,
			CouponService couponService, PointService pointService) {
		this.qnaService = qnaService;
		this.memberService = memberService;
		this.qnaResponseService = qnaResponseService;
		this.couponService = couponService;
		this.pointService = pointService;
	}
	
	private int writer_id;
	
	@ResponseBody
	@RequestMapping("username")
	public String writerName(String member_id, int writer_id) {
		String username = qnaService.selectUsername(member_id);
		this.writer_id= writer_id;
		return username;
	}

	
	
	@RequestMapping("qnaList") //글 목록
	public String myPage(QnaResponseDTO dto, QnaDTO qdto, Model model) {
		
		System.out.println(dto);
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		String username = ((UserDetails)principal).getUsername();
		System.out.println("null2");
		MemberDTO memberDTO = memberService.selectByUsername(username);
		int result = qnaService.selectMemberId(username);

		int pointSum = pointService.selectPointById(username).get();
		int couponSum = couponService.selectCouponPossibleById(memberDTO.getMember_id());
		
		if(result == 1)
		{
		String content = qnaResponseService.selectResponseContent(qdto);
        System.out.println(content);
        //int qa_question_id= this.writer_id;
		int qa_question_id= this.writer_id;
        System.out.println(qa_question_id);
		List<QnaDTO> qnas = qnaService.selectAllByUsername(result, qdto.getQa_question_id());
		System.out.println("null3");
		List<QnaDTO> qnasAdmin = qnaService.selectAllAsAdmin();
        List<QnaResponseDTO> response = qnaResponseService.selectAll(result);
		System.out.println(response);
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("qnas", qnas); 
		model.addAttribute("member_id", result);
		model.addAttribute("qnasAdmin", qnasAdmin); 
		model.addAttribute("qa_question_id", qa_question_id);
		model.addAttribute("response", response);
		model.addAttribute("content", content);
        System.out.println("null");
		return "/qna/qnaList";

		}else {
		List<QnaDTO> qnas = qnaService.selectAllByUsername(result,qdto.getQa_question_id());
		System.out.println("null3");
		List<QnaDTO> qnasAdmin = qnaService.selectAllAsAdmin();
        List<QnaResponseDTO> response = qnaResponseService.selectAll(result);
		System.out.println(response);
		int qa_question_id= this.writer_id;
		String content = qnaResponseService.selectResponseContent(qdto);


        
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("qnas", qnas); 
		model.addAttribute("member_id", result);
		model.addAttribute("qnasAdmin", qnasAdmin); 
		model.addAttribute("qa_question_id", qa_question_id);
		model.addAttribute("response", response);
		model.addAttribute("content", content);

		model.addAttribute("pointSum",pointSum);
		model.addAttribute("couponSum", couponSum);

        System.out.println("null");
		return "/qna/qnaList";
		}
	}
	
	
	
	@RequestMapping("qnaWrite") //글 작성 폼으로 이동
	public String toWrite(Model model) {
		//로그인된 아이디
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		int result = qnaService.selectMemberId(username);
		int pointSum = pointService.selectPointById(username).get();
		int couponSum = couponService.selectCouponPossibleById(memberDTO.getMember_id());
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("member_id", result);
		model.addAttribute("pointSum",pointSum);
		model.addAttribute("couponSum", couponSum);
		System.out.println(result);
		return "/qna/qnaWrite";
	}
	
	

	
	
	@RequestMapping("writeProc") //작성된 글 저장
	public String writeProc(QnaDTO dto) throws Exception{
				
		int result = qnaService.insert(dto);
		return "redirect:/qna/qnaList";
	}
	
	@RequestMapping("delete")
	public String delete(int qa_question_id) {
		int result = qnaService.delete(qa_question_id);
		return "redirect:/qna/qnaList";
	}
	
	@RequestMapping("adminWriteProc")
	public String adminWriteProc(QnaResponseDTO dto, QnaDTO qdto, Model model) {
		qnaResponseService.insert(dto);
		System.out.println("성공");
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		String content = qnaResponseService.selectResponseContent(qdto);
		System.out.print(content);
		int result = qnaService.selectMemberId(username);
		System.out.print(result);

		int qa_question_id= this.writer_id;
		//int qa_question_id = qnaResponseService.selectQuestionId(result);
		System.out.print(qa_question_id);

		List<QnaDTO> qnas = qnaService.selectAllByUsername(result, qdto.getQa_question_id());
		List<QnaDTO> qnasAdmin = qnaService.selectAllAsAdmin();
		List<QnaResponseDTO> response = qnaResponseService.selectAll(result);
		System.out.println("성공");
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("qnas", qnas); 
		model.addAttribute("member_id", result);
		model.addAttribute("qnasAdmin", qnasAdmin); 
		model.addAttribute("qa_question_id", qa_question_id);
		System.out.print(model);

		model.addAttribute("response", response); 

		return "redirect:/qna/qnaList";
	}
	

	@ResponseBody
	@RequestMapping(value="getQnaContent", produces = "application/json")
	public HashMap<String, Object> getQnaContent(int questionId) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		int result = qnaService.selectMemberId(username);
		HashMap<String, Object> response = new HashMap<>();
		QnaDTO qdto = new QnaDTO();
		qdto.setQa_question_id(questionId);
		String content = qnaResponseService.selectResponseContent(qdto);
		response.put("content", content);

		return response;

	}

	
	
	
	
}