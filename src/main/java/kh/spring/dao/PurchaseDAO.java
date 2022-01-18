package kh.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PurchaseDAO {

private final SqlSessionTemplate mybatis;
	
	public PurchaseDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
}
