package kh.spring.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kh.spring.dao.CartDAO;
import kh.spring.dao.MdDAO;
import kh.spring.dao.MemberDAO;
import kh.spring.dto.CartDTO;
import kh.spring.dto.MdDTO;

@Service
public class CartService {
	
	private final CartDAO cartDAO;
	
	private final MemberDAO memberDAO;
	
	private final MdDAO mdDAO;
	
	public CartService(CartDAO cartDAO,MemberDAO memberDAO, MdDAO mdDAO){
		this.cartDAO = cartDAO;
		this.memberDAO = memberDAO;
		this.mdDAO = mdDAO;
	}
	
	public Integer addToCart(String member_username, Integer md_id, Integer cart_item_count) {
		
		Integer member_id = memberDAO.selectIdByUsername(member_username);
		MdDTO md = mdDAO.selectMdDetailById(String.valueOf(md_id));
		
		Integer result = 0;
		// 기존 존재하는 cart 레코드 가져오기
		List<CartDTO> cartMds = cartDAO.selectMdByMdId(md_id,member_id);
		
		if(cartMds.size() == 0) {  
			// 없다면 생성
			result = cartDAO.insertIntoCart(member_id,md_id,cart_item_count,md);
		} else {
			// 있다면 수량과 가격 업데이트
			
			int cart_price = (cart_item_count+cartMds.get(0).getCart_item_count()) * md.getMd_price();
			result = cartDAO.updateCartMdQuantityAndPrice(cart_item_count, cartMds.get(0).getMd_id(), cart_price);
		}
		
		
		
		return result;
	}

	public List<CartDTO> selectByMemberId(String username) {
		
		List<CartDTO> list = cartDAO.selectByMemberId(username);
		return list;
	}

	public Integer deleteCart(Integer cart_id) {
		
		System.out.println("service"+cart_id);
		Integer result = cartDAO.deleteCart(cart_id);
		return result;
	}

	public Integer addItemCount(Integer cart_id) {
		Integer result = cartDAO.addItemCount(cart_id); 
		return result;
	}

	public Integer subtractItemCount(Integer cart_id) {
		Integer result = cartDAO.subtractItemCount(cart_id);
		return result;
	}

	public Integer deleteAll(Integer member_id) {
		Integer result = cartDAO.deleteAll(member_id);
		return result;
	}

	

}
