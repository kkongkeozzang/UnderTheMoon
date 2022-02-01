package kh.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kh.spring.dao.MdInqryDAO;
import kh.spring.dto.MdInqryDTO;

@Service
public class MdInqryService {

	private final MdInqryDAO mdInqryDAO;
	
	public MdInqryService(MdInqryDAO mdInqryDAO) {
		this.mdInqryDAO = mdInqryDAO;
	}
	
	public List<MdInqryDTO> selectAllByBoundByMdId(String md_id, int start, int end, String sort) {
		return mdInqryDAO.selectAllByBoundByMdId(md_id, start, end, sort);
	}
	
	public int selectCount(String md_id) {
		return mdInqryDAO.selectCount(md_id);
	}
	
	public List<MdInqryDTO> selectAll() {
		return mdInqryDAO.selectAll();
	}
	
	public int deleteMdInqry(int md_question_id) {
		return mdInqryDAO.deleteMdInqry(md_question_id);
	}
	
	public int deleteMdResp(int md_question_id) {
		return mdInqryDAO.deleteMdResp(md_question_id);
	}
	
	public int updateWait(int md_question_id) {
		return mdInqryDAO.updateWait(md_question_id);
	}
	
	public int updateComplete(int md_question_id) {
		return mdInqryDAO.updateComplete(md_question_id);
	}
	
	public int insertResp(MdInqryDTO inqrys, int member_id) {		
		return mdInqryDAO.insertResp(inqrys, member_id);
	}
	
	public int selectMemberId(String username) {
		return mdInqryDAO.selectMemberId(username);
	}
	
	public int updateResp(MdInqryDTO inqrys) {		
		return mdInqryDAO.updateResp(inqrys);
	}
	
	public int insert(MdInqryDTO inqry) {
		return mdInqryDAO.insert(inqry);
	}
	
	public int delete(String md_inqry_id) {
		return mdInqryDAO.delete(md_inqry_id);
	}
	
	public List<MdInqryDTO> selectByBoundByMemberId(Integer member_id, int start, int end) {
		return mdInqryDAO.selectByBoundByMemberId(member_id, start, end);
	}
	
	public int selectRecordCount(Integer member_id) {
		return mdInqryDAO.selectRecordCount(member_id);
	}
}
