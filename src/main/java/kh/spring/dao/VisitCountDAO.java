package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.VisitCountDTO;

@Repository
public class VisitCountDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertVisitor(VisitCountDTO visitors) throws Exception{
        return mybatis.insert("Visit.insertVisitor",visitors);
    }
	
	public int selectTodayVisitor() throws Exception{
        return mybatis.selectOne("Visit.selectTodayVisitor");
    }
	
	public int selectTotalVisitor() throws Exception{
        return mybatis.selectOne("Visit.selectTotalVisitor");
    }
	
	public List<VisitCountDTO> selectMonthlyVisitor() throws Exception{
        return mybatis.selectList("Visit.selectMonthlyVisitor");
    }
}
