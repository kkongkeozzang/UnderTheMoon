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
	
	public int insert(MdInqryDTO inqry) {
		return mdInqryDAO.insert(inqry);
	}
	
	public int delete(String md_inqry_id) {
		return mdInqryDAO.delete(md_inqry_id);
	}
}
