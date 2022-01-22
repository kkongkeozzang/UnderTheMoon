package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.PointDTO;

@Repository
public class PointDAO {
   
   private final SqlSessionTemplate mybatis;
   
   public PointDAO(SqlSessionTemplate mybatis) {
      this.mybatis = mybatis;
   }
      
   public Integer insertRecommendMemberPoint(Integer id) {
      return mybatis.insert("Point.insertRecommendMemberPoint",id);
   }
   
   public Integer insertEventMemberPoint(Integer id) {
      return mybatis.insert("Point.insertEventMemberPoint",id);
   }

	public int selectPointById(Integer member_id) {
		
		return mybatis.selectOne("Point.selectPointById",member_id);
	}
	
	public List<PointDTO> selectPointListById(Integer member_id) {
		
		return mybatis.selectList("Point.selectPointListById", member_id);
	}
}


