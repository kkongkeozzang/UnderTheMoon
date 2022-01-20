package kh.spring.service;

import org.springframework.stereotype.Service;

import kh.spring.dao.DeliveryDAO;
import kh.spring.dto.DeliveryDTO;

@Service
public class DeliveryService {

	private final DeliveryDAO deliveryDAO;
	
	public DeliveryService(DeliveryDAO deliveryDAO) {
		this.deliveryDAO = deliveryDAO;
	}
	
	
	public Integer insertDelivery(DeliveryDTO deliveryDTO) {
		
		int num_of_record_inserted = deliveryDAO.insertDelivery(deliveryDTO);
		
		int id =deliveryDTO.getDelivery_id();
		
		return id;
	}


	public int deleteById(Integer delivery_id) {
		
		return deliveryDAO.deleteById(delivery_id);
	}

	
	
}
