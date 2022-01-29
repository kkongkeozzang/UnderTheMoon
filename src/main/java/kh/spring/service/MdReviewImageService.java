package kh.spring.service;

import org.springframework.stereotype.Service;

import kh.spring.dao.MdReviewImageDAO;

@Service
public class MdReviewImageService {
	
	private final MdReviewImageDAO mdReviewImageDAO;
	
	public MdReviewImageService(MdReviewImageDAO mdReviewImageDAO) {
		this.mdReviewImageDAO = mdReviewImageDAO;
	}
	
	public int deleteImage(String name) {
		return mdReviewImageDAO.deleteImage(name);
	}
}
