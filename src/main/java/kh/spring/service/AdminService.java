package kh.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.dao.AdminDAO;
import kh.spring.dto.GradeDTO;
import kh.spring.dto.MdDTO;

@Service
public class AdminService {

	private final AdminDAO adminDAO;
	
	public AdminService(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}
	
	public List<GradeDTO> selectAllGrade(){
		return adminDAO.selectAllGrade();
	}
	
	public int insertGrade(GradeDTO grades){
		return adminDAO.insertGrade(grades);
	}
	
	public int deleteGrade(String grade_name){
		return adminDAO.deleteGrade(grade_name);
	}
	
	public int updateGrade(GradeDTO grades){
		return adminDAO.updateGrade(grades);
	}
	
	public int checkGrade(String grade_name){
		return adminDAO.checkGrade(grade_name);
	}
	
	public List<MdDTO> selectAllMd(){
		return adminDAO.selectAllMd();
	}
}
