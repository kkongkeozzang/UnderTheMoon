package kh.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public int mdReviewViewCountUp(String md_review_id) {
		return mdReviewDAO.mdReviewViewCountUp(md_review_id);
	}
	
	public int mdReviewLikeCountUp(String md_review_id) {
		return mdReviewDAO.mdReviewLikeCountUp(md_review_id);
	}
	
	public int selectMdReviewViewCount(String md_review_id) {
		return mdReviewDAO.selectMdReviewViewCount(md_review_id);
	}

	public int selectMdReviewLikeCount(String md_review_id) {
		return mdReviewDAO.selectMdReviewLikeCount(md_review_id);
	}
	
	public List<MdReviewDTO> selectAll() {
		return mdReviewDAO.selectAll();
	}
	
	public int deleteByMdReviewId(String md_review_id) {
		return mdReviewDAO.deleteByMdReviewId(md_review_id);
	}
	
	public int insertMdReview(MdReviewDTO dto) {
		return mdReviewDAO.insertMdReview(dto);
	}
	
	public List<MdReviewDTO> selectMdReviewByMdReviewId(String md_review_id) {
		return mdReviewDAO.selectMdReviewByMdReviewId(md_review_id);
	}
	
}
