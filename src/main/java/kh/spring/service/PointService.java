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

	public Integer insertRecommendMemberPoint(Integer id) {
		return pointDAO.insertRecommendMemberPoint(id);
	}
	
	public Integer insertEventMemberPoint(Integer id) {
		return pointDAO.insertEventMemberPoint(id);
	}
}
