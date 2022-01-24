package kh.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.dao.NoticeDAO;
import kh.spring.dto.NoticeDTO;

@Service
public class NoticeService {
	
	private final NoticeDAO noticeDAO;
	
	public NoticeService(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}
	
	public List<NoticeDTO> selectAll(){
		return noticeDAO.selectAll();
	}
	
	public int selectRecordCount() {
		return noticeDAO.selectRecordCount();
	}
	
	public int selectRecordCount(String select, String keyword) {
		return noticeDAO.selectRecordCount(select, keyword);
	}
	
	public NoticeDTO selectById(int notice_id) {
		return noticeDAO.selectById(notice_id);
	}
	
	public String selectUsername(int member_id) {
		return noticeDAO.selectUsername(member_id);
	}
	
	public NoticeDTO selectUpDown(int notice_id) {
		return noticeDAO.selectUpDown(notice_id);
	}
	
	public int insert(NoticeDTO dto) {
		return noticeDAO.insert(dto);
	}
	
	public int delete(int notice_id) {
		return noticeDAO.delete(notice_id);
	}
	
	public int update(NoticeDTO dto) {
		return noticeDAO.update(dto);
	}
	
	public int updateViewCount(int notice_id) {
		return noticeDAO.updateViewCount(notice_id);
	}
	
	public List<NoticeDTO> selectByBound(int start, int end){
		return noticeDAO.selectByBound(start, end);
	}
	
	public List<NoticeDTO> selectByKeyword(int start, int end, String select, String keyword){
		return noticeDAO.selectByKeyword(start, end, select, keyword);
	}
	
	public int selectMemberId(String username) {
		return noticeDAO.selectMemberId(username);
	}
	
//	public void insertDummy() {
//		dao.insertDummy();
//	}
	
}
