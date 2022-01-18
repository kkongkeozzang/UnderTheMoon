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
	
	public int selectCount(String select) {
		if(select.equals("all")) {
			return mybatis.selectOne("Md.selectAllCount");
		}
		return mybatis.selectOne("Md.selectRegionCount", select);
	}
	
	public List<MdDTO> selectAllReviewSort() {
		return mybatis.selectList("Md.selectAllReviewSort");
	}
	
	public List<MdDTO> selectAllNewSort() {
		return mybatis.selectList("Md.selectAllNewSort");
	}
	
	public List<MdDTO> selectByBound(int start, int end, String select, String sort) {
		Map<String, String> map = new HashMap<>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("select", select);
		if(select.equals("all")) {
			if(sort.equals("reviewSort")) {
				return mybatis.selectList("Md.selectAllByBoundReviewSort", map);
			} else if (sort.equals("newSort")) {
				return mybatis.selectList("Md.selectAllByBoundNewSort", map);
			} 
			return mybatis.selectList("Md.selectAllByBound", map);
		} else {
			if(sort.equals("reviewSort")) {
				return mybatis.selectList("Md.selectRegionByBoundReviewSort", map);
			} else if (sort.equals("newSort")) {
				System.out.println("최신순");
				return mybatis.selectList("Md.selectRegionByBoundNewSort", map);
			} 
			return mybatis.selectList("Md.selectRegionByBound", map);
		}
	}
	
	public MdDTO selectMdDetailById(String md_id) {
		return mybatis.selectOne("Md.selectMdDetailById", md_id);
	}
	
	public List<MdDTO> selectSameRegionMdsExceptForSelectMd(String md_id) {
		return mybatis.selectList("Md.selectSameRegionMdsExceptForSelectMd", md_id);
	}

	public MdDTO selectMdById(Integer md_id) {
		
		return mybatis.selectOne("selectMdById",md_id);
	}
	
	
	
}




