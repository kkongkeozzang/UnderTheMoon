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
	
	public MdDTO selectMdDetailById(String md_id) {
		return mdDAO.selectMdDetailById(md_id);
	}
	
	public List<MdDTO> selectSameRegionMdsExceptForSelectMd(String md_id) {
		return mdDAO.selectSameRegionMdsExceptForSelectMd(md_id);
	}
	
	public int checkMd(String md_name){
		return mdDAO.checkMd(md_name);
	}
	
	public int insertMd(MdDTO mds){
		return mdDAO.insertMd(mds);
	}
	
	public int deleteMd(int md_id){
		return mdDAO.deleteMd(md_id);
	}
	
	public int updateMd(MdDTO mds){
		return mdDAO.updateMd(mds);
	}
}
