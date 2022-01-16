package kh.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.dao.NoticeDAO;
import kh.spring.dto.NoticeDTO;

@Service
public class NoticeService {
	
	private final NoticeDAO dao;
	
	public NoticeService(NoticeDAO dao) {
		this.dao = dao;
	}
	
	public List<NoticeDTO> selectAll(){
		return dao.selectAll();
	}
	
	public NoticeDTO selectById(int notice_id) {
		return dao.selectById(notice_id);
	}
	
	public String selectUsername(int member_id) {
		return dao.selectUsername(member_id);
	}
}
