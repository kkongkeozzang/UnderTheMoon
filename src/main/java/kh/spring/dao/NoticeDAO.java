package kh.spring.dao;

import java.util.List;

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
	
	public NoticeDTO selectById(int notice_id) {
		return mybatis.selectOne("Notice.selectById", notice_id);
	}
	
	public String selectUsername(int notice_id) {
		return mybatis.selectOne("Notice.selectUsername", notice_id);
	}
	
	public int insert(NoticeDTO dto) {
		return mybatis.insert("Notice.insert", dto);
	}
	
	public int delete(int notice_id) {
		return mybatis.delete("Notice.delete", notice_id);
	}
}
