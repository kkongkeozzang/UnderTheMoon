package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.WishDTO;

@Repository
public class WishDAO {
	
	private final SqlSessionTemplate mybatis;
	
	public WishDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public List<WishDTO> selectByBound(Integer member_id, int start, int end) {
		
		Map<String, String> map = new HashMap<>();
		map.put("member_id", String.valueOf(member_id));
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		
		return mybatis.selectList("Wish.selectByBound", map);
	}
	
	public int selectRecordCount(Integer member_id) {
		
		return mybatis.selectOne("Wish.selectRecordCount", member_id);
	}
}
