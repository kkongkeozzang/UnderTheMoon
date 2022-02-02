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
	
	public Integer insertMoonGradeDelivery(Integer id) {
		return couponDAO.insertMoonGradeDelivery(id);
	}
	
	public Integer insertMoonGradeDiscount(Integer id) {
		return couponDAO.insertMoonGradeDiscount(id);
	}
	
	public Integer insertSunGradeDelivery(Integer id) {
		return couponDAO.insertSunGradeDelivery(id);
	}
	
	public Integer insertSunGradeDiscount(Integer id) {
		return couponDAO.insertSunGradeDiscount(id);
	}
	
	public List<CouponDTO> selectCouponListById(Integer member_id) {
		return couponDAO.selectCouponListById(member_id);		
	}
	
	public int selectCouponPossibleById(Integer member_id) {
		return couponDAO.selectCouponPossibleById(member_id);
	}
	
	public List<CouponDTO> selectByBound(Integer member_id, int start, int end) {
		return couponDAO.selectByBound(member_id, start, end);
	}
	
	public int selectRecordCount(Integer member_id) {
		return couponDAO.selectRecordCount(member_id);
	}
	
	public Integer updateCouponUsed(Integer coupon_id) {
		return couponDAO.updateCouponUsed(coupon_id);
	}
	
	public List<CouponDTO> selectAll() {
		return couponDAO.selectAll();
	}
	
	public int insertCoupon(CouponDTO coupons) {
		return couponDAO.insertCoupon(coupons);
	}
	
	public int deleteCoupon(int coupon_id) {
		return couponDAO.deleteCoupon(coupon_id);
	}
	
	public int updateCoupon(CouponDTO coupons) {
		return couponDAO.updateCoupon(coupons);
	}
	
	public int deleteCouponByMemberId(String member_id) {
		return couponDAO.deleteCouponByMemberId(member_id);
	}
	
	public Integer insertBirthCoupon(Integer id) {
		return couponDAO.insertBirthCoupon(id);
	}
}
