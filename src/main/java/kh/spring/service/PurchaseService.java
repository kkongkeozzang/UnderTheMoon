package kh.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.dao.PurchaseDAO;
import kh.spring.dto.MyPagePurchaseDTO;
import kh.spring.dto.MyPagePurchaseDetailDTO;
import kh.spring.dto.PurchaseDTO;
import kh.spring.dto.PurchaseDateDTO;


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

	public List<MyPagePurchaseDTO> selectByBound(Integer member_id, int start, int end) {

		return purchaseDAO.selectByBound(member_id, start, end);
	}

	public int selectRecordCount(Integer member_id) {

		return purchaseDAO.selectRecordCount(member_id);
	}

	public List<PurchaseDTO> selectAll(){
		return purchaseDAO.selectAll();
	}

	public int deletePurchase(int purchase_id){
		return purchaseDAO.deletePurchase(purchase_id);
	}

	public List<PurchaseDTO> selectPurchaseByBound(Integer member_id, int start, int end) {

		return purchaseDAO.selectPurchaseByBound(member_id, start, end);
	}

	public List<MyPagePurchaseDetailDTO> selectPurchaseDetailByBound(Integer purchase_id, int start, int end) {
		// TODO Auto-generated method stub
		return purchaseDAO.selectPurchaseDetailByBound(purchase_id, start, end);
	}
	
	public PurchaseDTO selectYear(){
		return purchaseDAO.selectYear();
	}
	
	public PurchaseDTO selectMonth(){
		return purchaseDAO.selectMonth();
	}
	
	public List<PurchaseDTO> selectMonths(){
		return purchaseDAO.selectMonths();
	}

	public Integer updatePurchase(String receipt_id, Integer purchase_id) {
		
		return purchaseDAO.updatePurchase(receipt_id,purchase_id);
	}


	public List<PurchaseDateDTO> selectPurchaseDateByBound(Integer member_id, int selectDate, int start, int end) {

		return purchaseDAO.selectPurchaseDateByBound(member_id,selectDate, start, end);
	}
}
