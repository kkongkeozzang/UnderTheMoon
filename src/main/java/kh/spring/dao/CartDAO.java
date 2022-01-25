package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.CartDTO;
import kh.spring.dto.MdDTO;

@Repository
public class CartDAO {
	
private final SqlSessionTemplate mybatis;
	
	public CartDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	public Integer insertIntoCart(Integer member_id, Integer md_id, int cart_item_count, MdDTO md) {
		
		HashMap<String,String> map = new HashMap<>();
		map.put("member_id", String.valueOf(member_id));
		map.put("md_id", String.valueOf(md_id));
		map.put("cart_item", md.getMd_name());
		map.put("cart_item_count", String.valueOf(cart_item_count));
		map.put("cart_price",  String.valueOf(md.getMd_price()*cart_item_count));
		map.put("cart_image", md.getMd_image());
		
		return mybatis.insert("Cart.insertIntoCart",map);
		
	}
	
	public Integer updateCartMdQuantityAndPrice(int cart_item_count, int cart_id, int cart_price) {
		
		HashMap<String,String> map = new HashMap<>();
		map.put("cart_item_count", String.valueOf(cart_item_count));
		map.put("cart_id",  String.valueOf(cart_id));
		map.put("cart_price",  String.valueOf(cart_price));
		
		return mybatis.insert("Cart.updateCartMdQuantityAndPrice",map);
		
	}

	public List<CartDTO> selectByMemberId(String username) {
		
		return mybatis.selectList("Cart.selectByMemberId",username);
	}

	public Integer deleteCart(Integer cart_id) {
	
		Integer result = mybatis.delete("Cart.deleteCart",cart_id);
		
		return result;
	}

	public Integer addItemCount(Integer cart_id) {
		
		return mybatis.update("Cart.addItemCount",cart_id);
	}

	public Integer subtractItemCount(Integer cart_id) {
		
		return mybatis.update("Cart.subtractItemCount",cart_id);
	}
	
	public List<CartDTO> selectMdByMdId(Integer md_id, Integer member_id) {
		
		Map<String,Integer> map = new HashMap<>();
		map.put("md_id",md_id );
		map.put("member_id", member_id);
		
		return mybatis.selectList("Cart.selectMdByMdId", map);
	}

	public Integer deleteAll(Integer member_id) {
		Integer result = mybatis.delete("Cart.deleteAll",member_id);
		return result;
	}

}
