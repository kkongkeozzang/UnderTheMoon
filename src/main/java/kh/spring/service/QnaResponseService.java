package kh.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.dao.QnaResponseDAO;
import kh.spring.dto.QnaDTO;
import kh.spring.dto.QnaResponseDTO;

@Service
public class QnaResponseService {

	private final QnaResponseDAO qnaResponseDAO;
	
	public QnaResponseService(QnaResponseDAO qnaResponseDAO) {
		this.qnaResponseDAO = qnaResponseDAO;
	}
	
	public int insert(QnaResponseDTO dto) {
		return qnaResponseDAO.insert(dto);
	}
	
	public int selectMemberId(String username) {
		return qnaResponseDAO.selectMemberId(username);
	}
	
	public String selectUsername(int result) {
		return qnaResponseDAO.selectUsername(result);
	}
	
	public int selectQuestionId(int result) {
		return qnaResponseDAO.selectQuestionId(result);
	}
	
	public List<QnaResponseDTO> selectAll(int result){
		return qnaResponseDAO.selectAll(result);
	} 	
	
	public String selectResponseContent(QnaDTO dto) {
		return qnaResponseDAO.selectResponseContent(dto);
	}
	
	
	
}
