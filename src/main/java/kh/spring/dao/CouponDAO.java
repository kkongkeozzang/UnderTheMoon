package kh.spring.dao;

import java.util.List;

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
}
