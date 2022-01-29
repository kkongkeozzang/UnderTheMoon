package kh.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MdReviewImageDAO {
	
	private final SqlSessionTemplate mybatis;
	
	public MdReviewImageDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public int deleteImage(String name) {
		return mybatis.delete("MdReviewImage.deleteImage", name);
	}
}
