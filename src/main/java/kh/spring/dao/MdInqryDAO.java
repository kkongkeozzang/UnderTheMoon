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
	
	public List<MdInqryDTO> selectAll() {
		return mybatis.selectList("MdInqry.selectAll");
	}
	
	public int deleteMdInqry(int md_question_id) {
		return mybatis.delete("MdInqry.deleteMdInqry", md_question_id);
	}
	
	public int deleteMdResp(int md_question_id) {
		return mybatis.delete("MdInqry.deleteMdResp", md_question_id);
	}
	
	public int updateWait(int md_question_id) {
		return mybatis.update("MdInqry.updateWait", md_question_id);
	}
	
	public int updateComplete(int md_question_id) {
		return mybatis.update("MdInqry.updateComplete", md_question_id);
	}
	
	public int insertResp(MdInqryDTO inqrys, int member_id) {
		Map<String,Object> map = new HashMap<>();
		map.put("md_question_id",inqrys.getSort_md_question_id());
		map.put("member_id", member_id);
		map.put("md_response_content", inqrys.getMd_response_content());
		return mybatis.insert("MdInqry.insertResp", map);
	}
	
	public int selectMemberId(String username) {
		return mybatis.selectOne("MdInqry.selectMemberId", username);
	}
	
	public int updateResp(MdInqryDTO inqrys) {
		return mybatis.update("MdInqry.updateResp", inqrys);
	}
	
	public int insert(MdInqryDTO inqry) {
		return mybatis.insert("MdInqry.insert",inqry);
	}
	
	public int delete(String md_inqry_id) {
		return mybatis.delete("MdInqry.delete",md_inqry_id);
	}
	
	public int selectRecordCount(Integer member_id) {
		return mybatis.selectOne("MdInqry.selectRecordCount", member_id);
	}
	
	public List<MdInqryDTO> selectByBoundByMemberId(Integer member_id, int start, int end) {
		
		Map<String, String> map = new HashMap<>();
		map.put("member_id", String.valueOf(member_id));
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		
		return mybatis.selectList("MdInqry.selectByBoundByMemberId", map);
	}
}
