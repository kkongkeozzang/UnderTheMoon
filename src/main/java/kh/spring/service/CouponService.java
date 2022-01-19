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

}
