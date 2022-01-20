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
}
