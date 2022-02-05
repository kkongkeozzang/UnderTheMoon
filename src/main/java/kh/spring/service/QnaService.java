package kh.spring.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.dao.QnaDAO;
import kh.spring.dto.QnaDTO;

@Service
public class QnaService {

	private final QnaDAO qnaDAO;
	
	public QnaService(QnaDAO qnaDAO) {
		this.qnaDAO = qnaDAO;
	}
	
	public int insert(QnaDTO dto) { //작성한 글 저장
		return qnaDAO.insert(dto);
	}
	
	public List<QnaDTO> selectAllByUsername(int result, int qa_question_id){
		return qnaDAO.selectAllByUsername(result, qa_question_id);
	} 
	
	public String selectUsername(String member_id) {
		return qnaDAO.selectUsername(member_id);
	}

	public int selectMemberId(String username) {
		return qnaDAO.selectMemberId(username);
	}
	
	public int delete(int qa_question_id) {
		return qnaDAO.delete(qa_question_id); 
	}
	
	public List<QnaDTO> selectAllAsAdmin(){
		return qnaDAO.selectAllAsAdmin();
	}
	
}
