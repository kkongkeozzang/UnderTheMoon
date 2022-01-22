package kh.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.dao.SellerDAO;
import kh.spring.dto.GradeDTO;

@Service
public class SellerService {

	private final SellerDAO sellerDAO;
	
	public SellerService(SellerDAO sellerDAO) {
		this.sellerDAO = sellerDAO;
	}
	
	public List<GradeDTO> selectAllGrade(){
		return sellerDAO.selectAllGrade();
	}
	
	public int insertGrade(GradeDTO grades){
		return sellerDAO.insertGrade(grades);
	}
	
	public int deleteGrade(String grade_name){
		return sellerDAO.deleteGrade(grade_name);
	}
	
	public int updateGrade(GradeDTO grades){
		return sellerDAO.updateGrade(grades);
	}
}
