package kh.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PurchaseDetailDAO {

private final SqlSessionTemplate mybatis;
	
	public PurchaseDetailDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
}
