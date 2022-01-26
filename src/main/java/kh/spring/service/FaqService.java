package kh.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.dao.FaqDAO;
import kh.spring.dto.FaqDTO;

@Service
public class FaqService {
	
	private final FaqDAO faqDAO;
	
	public FaqService(FaqDAO faqDAO) {
		this.faqDAO = faqDAO;
	}
	
	public List<FaqDTO> selectByBound(int start, int end){
		return faqDAO.selectByBound(start, end);
	}

	public int selectRecordCount() {
		return faqDAO.selectRecordCount();
	}
	
	public int selectMemberId(String username) {
		return faqDAO.selectMemberId(username);
	}
	
	public int insert(FaqDTO dto) {
		return faqDAO.insert(dto);
	}
	
	public String selectUsername(String member_id) {
		return faqDAO.selectUsername(member_id);
	}
	
	public int delete(int faq_id) {
		return faqDAO.delete(faq_id);
	}
	
	public FaqDTO selectById(int faq_id) {
		return faqDAO.selectById(faq_id);
	}
	
	public int update(FaqDTO dto) {
		return faqDAO.update(dto);
	}

	public List<FaqDTO> selectByKeyword(int start, int end, String select, String keyword){
		return faqDAO.selectByKeyword(start, end, select, keyword);
	}
	
	public int selectRecordCount(String select, String keyword) {
		return faqDAO.selectRecordCount(select, keyword);
	}
	
	public List<FaqDTO> selectAll(){
		return faqDAO.selectAll();
	}
	
	public List<FaqDTO> selectByKeywordAdmin(int start, int end, String select, String keyword){
		return faqDAO.selectByKeywordAdmin(start, end, select, keyword);
	}
	
	public int selectRecordCountAdmin(String select, String keyword) {
		return faqDAO.selectRecordCountAdmin(select, keyword);
	}
	
//	public void insertDummy() {
//		faqDAO.insertDummy();
//	}
	
}
