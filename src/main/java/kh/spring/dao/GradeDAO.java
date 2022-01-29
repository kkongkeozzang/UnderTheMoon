package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.GradeDTO;

@Repository
public class GradeDAO {

	private final SqlSessionTemplate mybatis;
	
	public GradeDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public List<GradeDTO> selectAll(){
		return mybatis.selectList("Grade.selectAll");
	}

	public List<GradeDTO> selectGradeTarget(){
		return mybatis.selectList("Grade.selectGradeTarget");
	}
	
	public int insertGrade(GradeDTO grades) {
		return mybatis.insert("Grade.insertGrade", grades);
	}
	
	public int deleteGrade(String grade_name) {
		return mybatis.delete("Grade.deleteGrade", grade_name);
	}
	
	public int updateGrade(GradeDTO grades) {
		return mybatis.update("Grade.updateGrade", grades);
	}
	
	public int checkGrade(String grade_name) {
		return mybatis.selectOne("Grade.checkGrade", grade_name);
	}

	public int selectGrade_point(String username) {
		
		return mybatis.selectOne("Grade.selectGrade_point",username);
	}
}
