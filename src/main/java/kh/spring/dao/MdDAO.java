package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<MdDTO> selectAllReviewSort() {
		return mybatis.selectList("Md.selectAllReviewSort");
	}
	
	public List<MdDTO> selectAllNewSort() {
		return mybatis.selectList("Md.selectAllNewSort");
	}
	
	public List<MdDTO> selectByBound(int start, int end, String sort) {
		Map<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		if(sort.equals("reviewSort")) {
			return mybatis.selectList("Md.selectByBoundReviewSort", map);
		} else if (sort.equals("newSort")) {
			return mybatis.selectList("Md.selectByBoundNewSort", map);
		} else {
			return mybatis.selectList("Md.selectByBound", map);
		}
	}
	
	
}
