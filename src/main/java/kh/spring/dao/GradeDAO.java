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
	
}
