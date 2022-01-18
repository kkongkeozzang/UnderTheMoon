package kh.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.dao.MdReviewDAO;
import kh.spring.dto.MdReviewDTO;

@Service
public class MdReviewService {
	
	private final MdReviewDAO mdReviewDAO;
	
	public MdReviewService(MdReviewDAO mdReviewDAO) {
		this.mdReviewDAO = mdReviewDAO;
	}
	
	public List<MdReviewDTO> selectAllByBoundByMdId(String md_id, int start, int end, String sort) {
		return mdReviewDAO.selectAllByBoundByMdId(md_id, start, end, sort);
	}
	
	public int selectCount(String md_id) {
		return mdReviewDAO.selectCount(md_id);
	}
	
}
