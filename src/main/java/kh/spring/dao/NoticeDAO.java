package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.NoticeDTO;

@Repository
public class NoticeDAO {
	
	private final SqlSessionTemplate mybatis;
	
	public NoticeDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public List<NoticeDTO> selectAll() {
		return mybatis.selectList("Notice.selectAll");
	}
	
	public int selectRecordCount() {
		return mybatis.selectOne("Notice.selectRecordCount");
	}
	
	public int selectRecordCount(String select, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("select", select);
		map.put("keyword", keyword);
		return mybatis.selectOne("Notice.selectKeywordCount",map);
	}
	
	public NoticeDTO selectById(int notice_id) {
		return mybatis.selectOne("Notice.selectById", notice_id);
	}
	
	public String selectUsername(int member_id) {
		return mybatis.selectOne("Notice.selectUsername", member_id);
	}
	
	public NoticeDTO selectUpDown(int notice_id) {
		return mybatis.selectOne("Notice.selectUpDown", notice_id);
	}
	
	public int insert(NoticeDTO dto) {
		return mybatis.insert("Notice.insert", dto);
	}
	
	public int delete(int notice_id) {
		return mybatis.delete("Notice.delete", notice_id);
	}
	
	public int update(NoticeDTO dto) {
		int result = mybatis.update("Notice.update", dto);
		return dto.getNotice_id();
	}
	
	public int updateViewCount(int notice_id) {
		return mybatis.update("Notice.updateViewCount", notice_id);
	}
	
	public List<NoticeDTO> selectByBound(int start, int end) {
		
		Map<String, String> map = new HashMap<>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		
		return mybatis.selectList("Notice.selectByBound", map);
	}
	
	public List<NoticeDTO> selectByKeyword(int start, int end, String select, String keyword){
		
		Map<String,String> map = new HashMap<>();
		map.put("select", select);
		map.put("keyword", keyword);
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));

		return mybatis.selectList("Notice.selectByKeyword", map);
		
	}
	
	public int selectMemberId(String username) {
		return mybatis.selectOne("Notice.selectMemberId", username);
	}
	
//	public void insertDummy() {
//		Map<String,String> map = new HashMap<>();
//		for (int i = 1; i < 146; i++) {
//			map.put("title", "제목"+String.valueOf(i));
//			map.put("content", "내용"+String.valueOf(i));
//			map.put("member_id", String.valueOf(i));
//			mybatis.insert("Notice.insertDummy", map);
//		}
//	}
}
