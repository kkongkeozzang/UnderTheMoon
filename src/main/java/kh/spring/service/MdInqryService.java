package kh.spring.service;

import java.util.List;

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
	
	public List<MdInqryDTO> selectByBoundByMemberId(Integer member_id, int start, int end) {
		return mdInqryDAO.selectByBoundByMemberId(member_id, start, end);
	}
	
	public int selectRecordCount(Integer member_id) {
		return mdInqryDAO.selectRecordCount(member_id);
	}
}
