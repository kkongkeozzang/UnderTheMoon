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
}
