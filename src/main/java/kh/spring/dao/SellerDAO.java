package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.GradeDTO;
import kh.spring.dto.MdDTO;

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
	
	public int checkGrade(String grade_name) {
		return mybatis.selectOne("Seller.checkGrade", grade_name);
	}
	
	public List<MdDTO> selectAllMd() {
		return mybatis.selectList("Seller.selectAllMd");
	}
	
	public int checkMd(String md_name) {
		return mybatis.selectOne("Seller.checkMd", md_name);
	}
	
	public int insertMd(MdDTO mds) {
		return mybatis.insert("Seller.insertMd", mds);
	}
}
