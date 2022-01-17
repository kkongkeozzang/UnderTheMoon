package kh.spring.service;

import org.springframework.stereotype.Service;

import kh.spring.dao.PointDAO;
import kh.spring.dto.PointDTO;

@Service
public class PointService {
	
	private final PointDAO pointDAO;
	
	public PointService(PointDAO pointDAO) {
		this.pointDAO = pointDAO;
	}
	
	public Integer insertMemberPoint(PointDTO dto) {
		return pointDAO.insertMemberPoint(dto);
	}
}
