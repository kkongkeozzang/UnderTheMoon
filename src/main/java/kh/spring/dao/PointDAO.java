package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public Integer selectPointById(Integer member_id) {

		return mybatis.selectOne("Point.selectPointById",member_id);
	}

	public List<PointDTO> selectPointListById(Integer member_id) {

		return mybatis.selectList("Point.selectPointListById", member_id);
	}

	public Integer insertNotInputEvent(Integer id) {
		return mybatis.insert("Point.insertNotInputEvent", id);
	}

	public Integer insertUsedPoint(Integer member_id, Integer pointSum) {

		Map<String,Integer> map = new HashMap<>();
		map.put("member_id",member_id);
		map.put("pointSum",pointSum);

		return mybatis.insert("Point.insertUsedPoint",map);
	}

	public Integer savePoints(Integer member_id, Integer productTotal) {
		
		Map<String,Integer> map = new HashMap<>();
		map.put("member_id",member_id);
		map.put("productTotal",productTotal);
		
		return mybatis.insert("Point.savePoints",map);
	}

	public Integer insertRecomendadoMemberPoint(Integer id) {
		return mybatis.insert("Point.insertRecomendadoMemberPoint",id);
	}
	
	public int selectRecordCount(Integer member_id) {
		return mybatis.selectOne("Point.selectRecordCount", member_id);		
	}
	
	public List<PointDTO> selectByBound(Integer member_id, int start, int end) {
		Map<String, String> map = new HashMap<>();
		map.put("member_id", String.valueOf(member_id));
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		
		return mybatis.selectList("Point.selectByBound", map);
	}
	
	public List<PointDTO> selectAll(){
		return mybatis.selectList("Point.selectAll");
	}
	public int insertPoint(PointDTO points){
		return mybatis.insert("Point.insertPoint",points);
	}
	public int deletePoint(int point_id){
		return mybatis.delete("Point.deletePoint",point_id);
	}
	public int updatePoint(PointDTO points){
		return mybatis.update("Point.updatePoint",points);

	}
	
	public int deletePointByMemberId(String member_id) {
		return mybatis.delete("Point.deletePointByMemberId", member_id);
	}
	
	public Integer insertKhEventMemberPoint(String id) {
		return mybatis.insert("Point.insertKhEventMemberPoint",id);
	}
	
	public int selectByIdandCheckKhEvent(String id) {
		return mybatis.selectOne("Point.selectByIdandCheckKhEvent",id);
	}
}


