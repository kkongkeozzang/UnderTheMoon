package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.MdDTO;

@Repository
public class MdDAO {
	
private final SqlSessionTemplate mybatis;
	
	public MdDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public List<MdDTO> selectAll() {
		return mybatis.selectList("Md.selectAll");
	}
	
	public int selectAllCount() {
		return mybatis.selectOne("Md.selectAllCount");
	}
}
