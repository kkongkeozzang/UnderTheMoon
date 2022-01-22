package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.GradeDTO;

@Repository
public class SellerDAO {
	
private final SqlSessionTemplate mybatis;
	
	public SellerDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public List<GradeDTO> selectAllGrade() {
		return mybatis.selectList("Seller.selectAllGrade");
	}
	
	public int insertGrade(GradeDTO grades) {
		return mybatis.insert("Seller.insertGrade", grades);
	}
	
	public int deleteGrade(String grade_name) {
		return mybatis.delete("Seller.deleteGrade", grade_name);
	}
	
	public int updateGrade(GradeDTO grades) {
		return mybatis.update("Seller.updateGrade", grades);
	}
}
