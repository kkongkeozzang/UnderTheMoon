package kh.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.dao.GradeDAO;
import kh.spring.dto.GradeDTO;

@Service
public class GradeService {
	
	private final GradeDAO gradeDAO;
	
	public GradeService(GradeDAO gradeDAO) {
		this.gradeDAO = gradeDAO;
	}
	
	public List<GradeDTO> selectAll(){
		return gradeDAO.selectAll();
	}
	
}
