package kh.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.dao.PurchaseDetailDAO;
import kh.spring.dto.PurchaseDetailDTO;

@Service
public class PurchaseDetailService {
	
	private final PurchaseDetailDAO purchaseDetailDAO;
	
	public PurchaseDetailService(PurchaseDetailDAO purchaseDetailDAO){
		this.purchaseDetailDAO = purchaseDetailDAO;
	}

	public int insertPurchaseDetails(List<PurchaseDetailDTO> purchseDetailList) {
		
		return purchaseDetailDAO.insertPurchaseDetails(purchseDetailList);
	}
	
	public List<PurchaseDetailDTO> selectAll(){
		return purchaseDetailDAO.selectAll();
	}
	
	public int deletePurchaseDetail(int purchase_detail_id){
		return purchaseDetailDAO.deletePurchaseDetail(purchase_detail_id);
	}
	
	public int completeDelivery(String purchase_detail_id){
		return purchaseDetailDAO.completeDelivery(purchase_detail_id);
	}
	
	public int cancelDelivery(int purchase_detail_id){
		return purchaseDetailDAO.cancelDelivery(purchase_detail_id);
	}
	
	public Integer selectRecordCount(int purchase_id) {
	
		return purchaseDetailDAO.selectRecordCount(purchase_id);
	}
	
	public Integer selectCount() {	
		return purchaseDetailDAO.selectCount();
	}
	
	public List<PurchaseDetailDTO> salesRank(){
		return purchaseDetailDAO.salesRank();
	}
	
	public void cancelOrder(Long purchase_id) {
		
		purchaseDetailDAO.cancelOrder(purchase_id);
	}
}
