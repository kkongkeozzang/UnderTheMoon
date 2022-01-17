package kh.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.PointDTO;

@Repository
public class PointDAO {
	
	private final SqlSessionTemplate mybatis;
	
	public PointDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public Integer insertMemberPoint(PointDTO dto) {
		
		return mybatis.insert("Point.insertMemberPoint",dto);
		
	}
}
