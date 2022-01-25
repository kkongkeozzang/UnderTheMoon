package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.GradeDTO;
import kh.spring.dto.MdDTO;

@Repository
public class AdminDAO {
	
private final SqlSessionTemplate mybatis;
	
	public AdminDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public List<GradeDTO> selectAllGrade() {
		return mybatis.selectList("Admin.selectAllGrade");
	}
	
	public int insertGrade(GradeDTO grades) {
		return mybatis.insert("Admin.insertGrade", grades);
	}
	
	public int deleteGrade(String grade_name) {
		return mybatis.delete("Admin.deleteGrade", grade_name);
	}
	
	public int updateGrade(GradeDTO grades) {
		return mybatis.update("Admin.updateGrade", grades);
	}
	
	public int checkGrade(String grade_name) {
		return mybatis.selectOne("Admin.checkGrade", grade_name);
	}
	
	public List<MdDTO> selectAllMd() {
		return mybatis.selectList("Admin.selectAllMd");
	}
	
}
