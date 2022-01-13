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
	
}
