package kh.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.dao.MdDAO;
import kh.spring.dto.MdDTO;

@Service
public class MdService {
	
	private final MdDAO mdDAO;
	
	public MdService(MdDAO mdDAO) {
		this.mdDAO = mdDAO;
	}
	
	public List<MdDTO> selectAll() {
		return mdDAO.selectAll();
	}
	
	public List<MdDTO> selectAllReviewSort() {
		return mdDAO.selectAllReviewSort();
	}
	
	public List<MdDTO> selectAllNewSort() {
		return mdDAO.selectAllNewSort();
	}
	
	public int selectCount(String select) {
		return mdDAO.selectCount(select);
	}
	
	public List<MdDTO> selectByBound(int start, int end, String select, String sort) {
		return mdDAO.selectByBound(start, end, select, sort);
	}
	
}
