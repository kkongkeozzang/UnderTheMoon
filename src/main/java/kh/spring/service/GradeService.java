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

	public List<GradeDTO> selectGradeTarget(){
		return gradeDAO.selectGradeTarget();
	}
	
	public int insertGrade(GradeDTO grades){
		return gradeDAO.insertGrade(grades);
	}
	
	public int deleteGrade(String grade_name){
		return gradeDAO.deleteGrade(grade_name);
	}
	
	public int updateGrade(GradeDTO grades){
		return gradeDAO.updateGrade(grades);
	}
	
	public int checkGrade(String grade_name){
		return gradeDAO.checkGrade(grade_name);
	}

	public int selectGrade_point(String username) {
		
		return gradeDAO.selectGrade_point(username);
	}
}
