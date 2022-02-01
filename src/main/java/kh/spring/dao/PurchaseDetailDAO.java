package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.PurchaseDetailDTO;

@Repository
public class PurchaseDetailDAO {

private final SqlSessionTemplate mybatis;
	
	public PurchaseDetailDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	public int insertPurchaseDetails(List<PurchaseDetailDTO> purchseDetailList) {
		int result = 0;
		for(int i = 0; i < purchseDetailList.size(); i++) {
			PurchaseDetailDTO dto = new PurchaseDetailDTO();
			dto = purchseDetailList.get(i);
			 result = mybatis.insert("PurchaseDetail.insertPurchaseDetails",dto);
		}
		return result;
	}
	
	public List<PurchaseDetailDTO> selectAll(){
		return mybatis.selectList("PurchaseDetail.selectAll");
	}
	
	public int deletePurchaseDetail(int purchase_detail_id){
		return mybatis.delete("PurchaseDetail.deletePurchaseDetail",purchase_detail_id);
	}
	public int completeDelivery(String purchase_detail_id){
		return mybatis.update("PurchaseDetail.completeDelivery",purchase_detail_id);
	}
	public int cancelDelivery(int purchase_detail_id){
		return mybatis.update("PurchaseDetail.cancelDelivery",purchase_detail_id);
	}
	public Integer selectRecordCount(int purchase_id) {
		
		return mybatis.selectOne("PurchaseDetail.selectRecordCount",purchase_id);
	}
	
	public Integer selectCount() {
		return mybatis.selectOne("PurchaseDetail.selectCountDetail");
	}
	
	public List<PurchaseDetailDTO> salesRank(){
		return mybatis.selectList("PurchaseDetail.salesRank");
	}

	public void cancelOrder(Long purchase_id) {
		
		mybatis.selectOne("PurchaseDetail.cancelOrder",purchase_id);
	}
}
