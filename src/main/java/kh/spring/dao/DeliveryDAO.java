package kh.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.DeliveryDTO;

@Repository
public class DeliveryDAO {

private final SqlSessionTemplate mybatis;
	
	public DeliveryDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	public int insertDelivery(DeliveryDTO deliveryDTO) {
		
		return mybatis.insert("Delivery.insertDelivery",deliveryDTO);
	}

	public int deleteById(Integer delivery_id) {
		
		return mybatis.delete("Delivery.deleteById",delivery_id);
	}
}
