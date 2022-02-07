package kh.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.dao.WishDAO;
import kh.spring.dto.WishDTO;

@Service
public class WishService {
	
	private final WishDAO wishDAO;
	
	public WishService(WishDAO wishDAO) {
		this.wishDAO = wishDAO;
	}
	
	public List<WishDTO> selectByBound(Integer member_id, int start, int end) {
		return wishDAO.selectByBound(member_id, start, end);
	}
	
	public int selectRecordCount(Integer member_id) {
		return wishDAO.selectRecordCount(member_id);
	}
	
	public int insertMdWish(WishDTO wishDTO) {
		return wishDAO.insertMdWish(wishDTO);
	}
	
	public int deleteMdWish(int wish_id) {
		return wishDAO.deleteMdWish(wish_id);
	}
	
	public int deleteByMdIdWish(String md_id , Integer member_id) {
		return wishDAO.deleteByMdIdWish(md_id, member_id);
	}
	
	public int selectByMdId(String md_id, int member_id) {
		return wishDAO.selectByMdId(md_id, member_id);
	}
}
