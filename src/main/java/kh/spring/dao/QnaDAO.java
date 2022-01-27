package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.QnaDTO;

@Repository
public class QnaDAO {

	private final SqlSessionTemplate mybatis;
	
	public QnaDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	

	public int insert(QnaDTO dto) {
		return mybatis.insert("Qna.insert", dto);
	}
	
	public List<QnaDTO> selectAllByUsername(int result){
		return mybatis.selectList("Qna.selectAllByUsername", result);
	}
	
	public String selectUsername(String member_id) {
		return mybatis.selectOne("Qna.selectUsername", member_id);
	}
	
	public int selectMemberId(String username) {
		return mybatis.selectOne("Qna.selectMemberId", username);
	}
	
	public int delete(int qa_question_id) {
		return mybatis.delete("Qna.delete", qa_question_id); 
	}
	
	public List<QnaDTO> selectAllAsAdmin(){
		return mybatis.selectList("Qna.selectAllAsAdmin");
	}
	
	
}
