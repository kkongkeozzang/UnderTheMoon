package kh.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.dao.SellerDAO;
import kh.spring.dto.GradeDTO;
import kh.spring.dto.MdDTO;

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
	
	public int checkGrade(String grade_name){
		return sellerDAO.checkGrade(grade_name);
	}
	
	public List<MdDTO> selectAllMd(){
		return sellerDAO.selectAllMd();
	}
	
	public int checkMd(String md_name){
		return sellerDAO.checkMd(md_name);
	}
	
	public int insertMd(MdDTO mds){
		return sellerDAO.insertMd(mds);
	}
}
