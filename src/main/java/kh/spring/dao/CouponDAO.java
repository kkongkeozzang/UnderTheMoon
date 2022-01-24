package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.CouponDTO;

@Repository
public class CouponDAO {

	private final SqlSessionTemplate mybatis;
	
	public CouponDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	public List<CouponDTO> selectAllByMemberId(Integer member_id) {
		
		return mybatis.selectList("Coupon.selectAllByMemberId",member_id);
	}
	
	public int selectByMemberIdCountCoupon(Integer id) {
		return mybatis.selectOne("Coupon.selectByMemberIdCountCoupon", id);
	}
	
	public Integer insertSignUpEventDelivery(Integer id) {
		
		return mybatis.insert("Coupon.insertSignUpEventDelivery",id);
	}
	
	public Integer insertSignUpEventDiscount(Integer id) {
		
		return mybatis.insert("Coupon.insertSignUpEventDiscount",id);
	}
	
	public Integer insertStarGradeDelivery(Integer id) {
		
		return mybatis.insert("Coupon.insertStarGradeDelivery",id);
	}
	
	public Integer insertStarGradeDiscount(Integer id) {
		
		return mybatis.insert("Coupon.insertStarGradeDiscount",id);
	}
	
	public Integer insertMoonGradeDelivery(Integer id) {
		
		return mybatis.insert("Coupon.insertMoonGradeDelivery",id);
	}
	
	public Integer insertMoonGradeDiscount(Integer id) {
		
		return mybatis.insert("Coupon.insertMoonGradeDiscount",id);
	}
	
	public Integer insertSunGradeDelivery(Integer id) {
		
		return mybatis.insert("Coupon.insertSunGradeDelivery",id);
	}
	
	public Integer insertSunGradeDiscount(Integer id) {
		
		return mybatis.insert("Coupon.insertSunGradeDelivery",id);
	}
	
	public List<CouponDTO> selectCouponListById(Integer member_id) {
		
		return mybatis.selectList("Coupon.selectCouponListById", member_id);
	}
	
	public int selectCouponPossibleById(Integer member_id) {
		
		return mybatis.selectOne("Coupon.selectCouponPossibleById", member_id);
	}
	
	public List<CouponDTO> selectByBound(Integer member_id, int start, int end) {
		
		Map<String, String> map = new HashMap<>();
		map.put("member_id", String.valueOf(member_id));
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		
		return mybatis.selectList("Coupon.selectByBound", map);
	}
	
	public int selectRecordCount(Integer member_id) {
		
		return mybatis.selectOne("Coupon.selectRecordCount", member_id);
	}
}
