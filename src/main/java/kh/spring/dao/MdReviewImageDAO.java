package kh.spring.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.MdReviewImageDTO;

@Repository
public class MdReviewImageDAO {
	
	private final SqlSessionTemplate mybatis;
	
	public MdReviewImageDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public int deleteImage(String name) {
		return mybatis.delete("MdReviewImage.deleteImage", name);
	}
	
	public int insertMdReviewImage(Map<String,String> map) {
		return mybatis.insert("MdReviewImage.insertImage", map);
	}
	
	public List<MdReviewImageDTO> selectAllByMdReviewId(String md_review_id) {
		return mybatis.selectList("MdReviewImage.selectAllByMdReviewId",md_review_id);
	}
}
