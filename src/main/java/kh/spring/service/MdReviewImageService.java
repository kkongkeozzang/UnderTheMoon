package kh.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kh.spring.dao.MdReviewImageDAO;
import kh.spring.dto.MdReviewImageDTO;

@Service
public class MdReviewImageService {
	
	private final MdReviewImageDAO mdReviewImageDAO;
	
	public MdReviewImageService(MdReviewImageDAO mdReviewImageDAO) {
		this.mdReviewImageDAO = mdReviewImageDAO;
	}
	
	public int deleteImage(String name) {
		return mdReviewImageDAO.deleteImage(name);
	}
	
	public void insertMdReviewImage(List<String> fileNames, String md_id, String md_review_id) {
		for(String fileName : fileNames) {
			Map<String,String> map = new HashMap<>();
			map.put("md_review_image", fileName);
			map.put("md_review_id", md_review_id);
			int result = mdReviewImageDAO.insertMdReviewImage(map);
		}
	}
	
	public List<MdReviewImageDTO> selectAllByMdReviewId(String md_review_id) {
		return mdReviewImageDAO.selectAllByMdReviewId(md_review_id);
	}
}
