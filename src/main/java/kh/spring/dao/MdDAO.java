package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.GradeDTO;
import kh.spring.dto.MdAndReviewDTO;
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
				return mybatis.selectList("Md.selectRegionByBoundNewSort", map);
			} else if(sort.equals("search")) {
				return mybatis.selectList("Md.selectSearchResult",map);
			}
			return mybatis.selectList("Md.selectRegionByBound", map);
		}
	}
	
	public List<MdDTO> selectByBoundForSearch(int start, int end, String select, String sort) {
		Map<String, String> map = new HashMap<>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("select", select);
		if(sort.equals("reviewSort")) {
			return mybatis.selectList("Md.selectAllSearchByBoundReviewSort", map);
		} else if (sort.equals("newSort")) {
			return mybatis.selectList("Md.selectAllSearchByBoundNewSort", map);
		} 
		return mybatis.selectList("Md.selectAllSearchByBound", map);
	}
	
	public MdDTO selectMdDetailById(String md_id) {
		return mybatis.selectOne("Md.selectMdDetailById", md_id);
	}
	
	public List<MdDTO> selectSameRegionMdsExceptForSelectMd(String md_id) {
		return mybatis.selectList("Md.selectSameRegionMdsExceptForSelectMd", md_id);
	}
	
	public int checkMd(String md_name) {
		return mybatis.selectOne("Md.checkMd", md_name);
	}
	
	public int insertMd(MdDTO mds) {
		return mybatis.insert("Md.insertMd", mds);
	}
	
	public int deleteMd(int md_id) {
		return mybatis.delete("Md.deleteMd", md_id);
	}
	
	public int updateMd(MdDTO mds) {
		return mybatis.update("Md.updateMd", mds);
	}
	
	public List<MdDTO> selectMdById(int md_id) {
		return mybatis.selectList("Md.selectMdById", md_id);
	}
	
	public List<MdAndReviewDTO> selectByBoundNotReviewMdByMemberId(String member_id, int start, int end){
		Map<String,String> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		return mybatis.selectList("Md.selectByBoundNotReviewMdByMemberId", map);
	}

	public List<MdAndReviewDTO> selectByBoundReviewMdByMemberId(String member_id, int start, int end){
		Map<String,String> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		return mybatis.selectList("Md.selectByBoundReviewMdByMemberId", map);
	}

	public int selectByBoundNotReviewMdCountByMemberId(String member_id) {
		return mybatis.selectOne("Md.selectByBoundNotReviewMdCountByMemberId", member_id);
	}

	public int selectByBoundReviewMdCountByMemberId(String member_id) {
		return mybatis.selectOne("Md.selectByBoundReviewMdCountByMemberId", member_id);
	}
	
	public int selectSerchResultCount(String search) {
		return mybatis.selectOne("Md.selectSerchResultCount",search);
	}
}




