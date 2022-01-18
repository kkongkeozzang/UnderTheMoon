package kh.spring.service;

import java.util.List;

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
	
	public Integer addToCart(String member_username, Integer md_id, int cart_item_count) {
		
		Integer member_id = memberDAO.selectIdByUsername(member_username);
		MdDTO md = mdDAO.selectMdById(md_id);
		Integer result = cartDAO.insertIntoCart(member_id,md_id,cart_item_count,md);
		
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

}
