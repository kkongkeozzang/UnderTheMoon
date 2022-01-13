package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.NoticeDTO;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<NoticeDTO> selectAll() {
		return mybatis.selectList("Notice.selectAll");
	}
	
	public NoticeDTO selectById(int notice_id) {
		return mybatis.selectOne("Notice.selectById", notice_id);
	}
	
	public String selectUsername(int notice_id) {
		return mybatis.selectOne("Notice.selectUsername", notice_id);
	}
	
}
