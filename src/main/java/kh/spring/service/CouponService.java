package kh.spring.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import kh.spring.dao.CouponDAO;
import kh.spring.dao.MemberDAO;
import kh.spring.dto.CouponDTO;

@Service
public class CouponService {

	private final CouponDAO couponDAO;
	private final MemberDAO memberDAO;
	
	public CouponService(CouponDAO couponDAO,MemberDAO memberDAO) {
		this.couponDAO = couponDAO;
		this.memberDAO = memberDAO;
		
	}
	public Optional<List<CouponDTO>> selectAllByMemberId(String username) {
		
		Integer member_id = memberDAO.selectIdByUsername(username);
		
		List<CouponDTO> couponList = couponDAO.selectAllByMemberId(member_id);
		
		Optional<List<CouponDTO>> op = Optional.ofNullable(couponList);
		
		return op;
	}
	
	public int selectByMemberIdCountCoupon(Integer id) {
		return couponDAO.selectByMemberIdCountCoupon(id);
	}
	
	public Integer insertSignUpEventDelivery(Integer id) {
		return couponDAO.insertSignUpEventDelivery(id);
	}

	public Integer insertSignUpEventDiscount(Integer id) {
		return couponDAO.insertSignUpEventDiscount(id);
	}
	
	public Integer insertStarGradeDelivery(Integer id) {
		return couponDAO.insertStarGradeDelivery(id);
	}
	
	public Integer insertStarGradeDiscount(Integer id) {
		return couponDAO.insertStarGradeDiscount(id);
	}
}
