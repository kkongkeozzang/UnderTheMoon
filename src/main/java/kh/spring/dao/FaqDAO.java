package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.FaqDTO;

@Repository
public class FaqDAO {
	
	private final SqlSessionTemplate mybatis;
	
	public FaqDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public List<FaqDTO> selectByBound(int start, int end) {
	
		Map<String, String> map = new HashMap<>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		
		return mybatis.selectList("Faq.selectByBound", map);
	}
	
	public int selectRecordCount() {
		return mybatis.selectOne("Faq.selectRecordCount");
	}
	
	public int selectMemberId(String username) {
		return mybatis.selectOne("Faq.selectMemberId", username);
	}
	
	public int insert(FaqDTO dto) {
		return mybatis.insert("Faq.insert", dto);
	}

	public String selectUsername(String member_id) {
		return mybatis.selectOne("Faq.selectUsername", member_id);
	}
	
	public int delete(int Faq_id) {
		return mybatis.delete("Faq.delete", Faq_id);
	}
	
	public FaqDTO selectById(int Faq_id) {
		return mybatis.selectOne("Faq.selectById", Faq_id);
	}
	
	public int update(FaqDTO dto) {
		int result = mybatis.update("Faq.update", dto);
		return dto.getFaq_id();
	}
	
	public List<FaqDTO> selectByKeyword(int start, int end, String select, String keyword){	
		Map<String,String> map = new HashMap<>();
		map.put("select", select);
		map.put("keyword", keyword);
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));	
		return mybatis.selectList("Faq.selectByKeyword", map);		
	}
	
	public int selectRecordCount(String select, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("select", select);
		map.put("keyword", keyword);
		return mybatis.selectOne("Faq.selectKeywordCount",map);
	}
	
	public List<FaqDTO> selectAll() {
		return mybatis.selectList("Faq.selectAll");
	}
	
	public List<FaqDTO> selectByKeywordAdmin(int start, int end, String select, String keyword){	
		Map<String,String> map = new HashMap<>();
		map.put("select", select);
		map.put("keyword", keyword);
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));	
		return mybatis.selectList("Faq.selectByKeywordAdmin", map);		
	}
	
	public int selectRecordCountAdmin(String select, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("select", select);
		map.put("keyword", keyword);
		return mybatis.selectOne("Faq.selectKeywordCountAdmin",map);
	}
//	public void insertDummy() {
//		Map<String,String> map = new HashMap<>();
//		for (int i = 1; i < 150; i++) {
//			map.put("category", "카테고리"+String.valueOf(i));
//			map.put("title", "제목"+String.valueOf(i));
//			map.put("content", "내용"+String.valueOf(i));
//			map.put("member_id", String.valueOf(i));
//			mybatis.insert("Faq.insertDummy", map);
//		}
//	}
	
}
