package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.MdReviewDTO;

@Repository
public class MdReviewDAO {
	
	private final SqlSessionTemplate mybatis;
	
	public MdReviewDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public List<MdReviewDTO> selectAllByBoundByMdId(String md_id, int start, int end, String sort) {
		Map<String,String> map = new HashMap<>();
		map.put("md_id", md_id);
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		if(sort.equals("viewSort")) {
			return mybatis.selectList("MdReview.selectAllByBoundByMdIdViewSort",map);
		} else if(sort.equals("likeSort")) {
			return mybatis.selectList("MdReview.selectAllByBoundByMdIdLikeSort",map);
		} else {
			return mybatis.selectList("MdReview.selectAllByBoundByMdId", map);
		}
	}
	
	public int selectCount(String md_id) {
		return mybatis.selectOne("MdReview.selectCount",md_id);
	}
	
}
