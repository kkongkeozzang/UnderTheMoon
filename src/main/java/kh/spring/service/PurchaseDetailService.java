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

	public Integer selectRecordCount(int purchase_id) {
	
		return purchaseDetailDAO.selectRecordCount(purchase_id);
	}
}
