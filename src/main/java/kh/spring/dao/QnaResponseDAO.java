package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.QnaDTO;
import kh.spring.dto.QnaResponseDTO;

@Repository
public class QnaResponseDAO {
	
	private final SqlSessionTemplate mybatis;
	
	public QnaResponseDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis; 
	}
	
	public int insert(QnaResponseDTO dto) {
		return mybatis.insert("QnaResponse.insert", dto);
	}
	
	public int selectMemberId(String username) {
		return mybatis.selectOne("QnaResponse.selectMemberId", username);
	}
	
	public String selectUsername(int result) {
		return mybatis.selectOne("QnaResponse.selectUsername", result);
	}
	
	
	public int selectQuestionId(int result) {
		return mybatis.selectOne("QnaResponse.selectQuestionId", result);
	}
	
	public List<QnaResponseDTO> selectAll(int result){
		return mybatis.selectList("QnaResponse.selectAll", result);
	}
	
	public String selectResponseContent(QnaDTO dto) {
		return mybatis.selectOne("QnaResponse.selectResponseContent",dto);
	}
	

}
