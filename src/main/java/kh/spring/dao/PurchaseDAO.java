package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.MyPagePurchaseDTO;
import kh.spring.dto.MyPagePurchaseDetailDTO;
import kh.spring.dto.PurchaseDTO;
import kh.spring.dto.PurchaseDateDTO;


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
	
	public long deleteById(long order_id) {
		
		return mybatis.delete("Purchase.deleteById",order_id);
	}


	public PurchaseDTO findId(long orderId) {
		
		return mybatis.selectOne("Purchase.findId",orderId);
	}
	
	public Integer selectByIdSumPurchasePayment(Integer id) {
		
		return mybatis.selectOne("Purchase.selectByIdSumPurchasePayment",id);
	}
	
	public int selectRecordCount(Integer member_id) {
		
		return mybatis.selectOne("Purchase.selectRecordCount", member_id);
	}
	
	public List<MyPagePurchaseDTO> selectByBound(Integer member_id, int start, int end) {
		
		Map<String, String> map = new HashMap<>();
		map.put("member_id", String.valueOf(member_id));
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		
		return mybatis.selectList("Purchase.selectByBound", map);
	}

	public List<PurchaseDTO> selectAll(){
		return mybatis.selectList("Purchase.selectAll");
	}
	
	public int deletePurchase(int purchase_id){
		return mybatis.delete("Purchase.deletePurchase",purchase_id);
	}


	public List<PurchaseDTO> selectPurchaseByBound(Integer member_id, int start, int end) {
		Map<String, String> map = new HashMap<>();
		map.put("member_id", String.valueOf(member_id));
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		
		return mybatis.selectList("Purchase.selectPurchaseByBound", map);
	}

	public List<MyPagePurchaseDetailDTO> selectPurchaseDetailByBound(Integer purchase_id, int start, int end) {
		Map<String, String> map = new HashMap<>();
		map.put("purchase_id", String.valueOf(purchase_id));
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		
		return mybatis.selectList("Purchase.selectPurchaseDetailByBound", map);
	}

	public PurchaseDTO selectYear(){
		return mybatis.selectOne("Purchase.selectYear");
	}
	
	public PurchaseDTO selectMonth(){
		return mybatis.selectOne("Purchase.selectMonth");
	}
	
	public List<PurchaseDTO> selectMonths(){
		return mybatis.selectList("Purchase.selectMonths");
	}
	public Integer updatePurchase(String receipt_id, Integer purchase_id) {
		
		Map<String, String> map = new HashMap<>();
		map.put("receipt_id",receipt_id);
		map.put("purchase_id", String.valueOf(purchase_id));
		
		return mybatis.update("Purchase.updatePurchase", map);
}
	
	public List<PurchaseDateDTO> selectPurchaseDateByBound(Integer member_id, int selectDate, int start, int end) {
		Map<String, String> map = new HashMap<>();
		map.put("member_id", String.valueOf(member_id));
		map.put("selectDate", String.valueOf(selectDate));
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		
		return mybatis.selectList("Purchase.selectPurchaseDateByBound", map);
	}
}
