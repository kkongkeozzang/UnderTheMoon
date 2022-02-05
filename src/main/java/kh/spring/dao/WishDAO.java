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
	
	public int insertMdWish(WishDTO wishDTO) {
		
		return mybatis.insert("Wish.insertMdWish", wishDTO);
	}
	
	public int deleteMdWish(int wish_id) {
		
		return mybatis.delete("Wish.deleteMdWish", wish_id);
	}
	
	public int deleteByMdIdWish(String md_id, Integer member_id) {
		Map<String, String> map = new HashMap<>();
		map.put("md_id", md_id);
		map.put("member_id", String.valueOf(member_id));
				
		return mybatis.delete("Wish.deleteByMdIdWish", map);
	}
	
	public int selectByMdId(String md_id, int member_id) {
		Map<String, String> map = new HashMap<>();
		map.put("md_id", md_id);
		map.put("member_id", String.valueOf(member_id));
		
		return mybatis.selectOne("Wish.selectByMdId", map);
	}
}
