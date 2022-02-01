package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.MdInqryDTO;

@Repository
public class MdInqryDAO {
	
private final SqlSessionTemplate mybatis;
	
	public MdInqryDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public List<MdInqryDTO> selectAllByBoundByMdId(String md_id, int start, int end, String sort) {
		Map<String,String> map = new HashMap<>();
		map.put("md_id", md_id);
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		return mybatis.selectList("MdInqry.selectAllByBoundByMdId", map);
	}
	
	public int selectCount(String md_id) {
		return mybatis.selectOne("MdInqry.selectCount",md_id);
	}
	
	public int insert(MdInqryDTO inqry) {
		return mybatis.insert("MdInqry.insert",inqry);
	}
	
	public int delete(String md_inqry_id) {
		return mybatis.delete("MdInqry.delete",md_inqry_id);
	}
}
