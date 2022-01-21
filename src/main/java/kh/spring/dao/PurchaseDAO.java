package kh.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.DeliveryDTO;
import kh.spring.dto.PurchaseDTO;

@Repository
public class PurchaseDAO {

private final SqlSessionTemplate mybatis;
	
	public PurchaseDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	public Integer insertPurchase(PurchaseDTO purchaseDTO) {
		
		return mybatis.insert("Purchase.insertPurchase",purchaseDTO);
		
	}

	public Integer selectIdById(Integer delivery_id) {
		
		
		Integer result = mybatis.selectOne("Purchase.selectIdById",delivery_id);

		return result;
	}

	public int deleteById(Integer order_id) {
		
		return mybatis.delete("Purchase.deleteById",order_id);
	}
	
	public Integer selectByIdSumPurchasePayment(Integer id) {
		
		return mybatis.selectOne("Purchase.selectByIdSumPurchasePayment",id);
	}
}
