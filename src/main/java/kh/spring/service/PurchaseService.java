package kh.spring.service;

import org.springframework.stereotype.Service;

import kh.spring.dao.PurchaseDAO;
import kh.spring.dto.DeliveryDTO;
import kh.spring.dto.PurchaseDTO;

@Service
public class PurchaseService {

	private final PurchaseDAO purchaseDAO;
	
	public PurchaseService(PurchaseDAO purchaseDAO) {
		this.purchaseDAO = purchaseDAO;
	}
	
	public Integer insertPurchase(PurchaseDTO purchaseDTO) {
		
		return purchaseDAO.insertPurchase(purchaseDTO);
		
	}

	public Integer selectIdById(Integer delivery_id) throws InterruptedException {
		
		
		return purchaseDAO.selectIdById(delivery_id);
	}

	public int deleteById(Integer order_id) {
		
		return purchaseDAO.deleteById(order_id);
	}


	public PurchaseDTO findId(long orderId) {
		
		return purchaseDAO.findId(orderId);
	}

	public void completeOrder(long orderId) {
		PurchaseDTO purchaseDTO = purchaseDAO.findId(orderId);
		purchaseDTO.completeOrder();
		
	}
	
	public void failOrder(Long id) {
		purchaseDAO.deleteById(id);
    }
	

	public Integer selectByIdSumPurchasePayment(Integer id) {
		
		return purchaseDAO.selectByIdSumPurchasePayment(id);
	}
}
