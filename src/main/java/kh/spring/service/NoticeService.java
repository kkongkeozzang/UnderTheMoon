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
	
	public NoticeDTO selectUpDown(int notice_id) {
		return dao.selectUpDown(notice_id);
	}
	
	public int insert(NoticeDTO dto) {
		return dao.insert(dto);
	}
	
	public int delete(int notice_id) {
		return dao.delete(notice_id);
	}
	
	public int update(NoticeDTO dto) {
		return dao.update(dto);
	}
	
	public int updateViewCount(int notice_id) {
		return dao.updateViewCount(notice_id);
	}
	
}
