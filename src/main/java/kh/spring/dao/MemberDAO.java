package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.MemberDTO;


@Repository
public class MemberDAO {

	private final SqlSessionTemplate mybatis;

	public MemberDAO(SqlSessionTemplate mybatis) {
		
		this.mybatis = mybatis;
	}

	public MemberDTO selectByUsername(String member_username) {

		return mybatis.selectOne("Member.selectByUsername",member_username);

	}

	public String selectByNameAndEmail(String member_email, String member_name) {

		Map<String,String> map = new HashMap<>();
		map.put("member_email", member_email);
		map.put("member_name", member_name);

		return mybatis.selectOne("Member.selectByNameAndEmail",map);
	}


	public Integer selectByUsernameAndPhone(String member_username, String member_phone) {

		Map<String,String> map = new HashMap<>();
		map.put("member_username",member_username );
		map.put("member_phone", member_phone);

		return mybatis.selectOne("Member.selectByUsernameAndPhone",map);

	}

	public Integer insertMember(MemberDTO dto) {

		mybatis.insert("Member.insertMember",dto);
		return dto.getMember_id();
	}

	public Integer resetPassword(String member_password, String member_username) {

		Map<String,String> map = new HashMap<>();
		map.put("member_password", member_password);
		map.put("member_username", member_username);

		return mybatis.update("Member.resetPassword", map);
	}

	public int idDuplCheck(String id) {
		return mybatis.selectOne("Member.idDuplCheck", id);
	}

	public Integer selectIdByUsername(String member_username) {
		
		return mybatis.selectOne("Member.selectIdByUsername",member_username);

	}

	public int updateGradeMoon(String member_username) {
		
		return mybatis.update("Member.updateGradeMoon",member_username);		
	}

	public int updateGradeSun(String member_username) {
		
		return mybatis.update("Member.updateGradeSun",member_username);		
	}
	
	public int updateMember(MemberDTO dto) {
		
		return mybatis.update("Member.updateMember", dto);
	}

	public List<MemberDTO> selectAll() {
		return mybatis.selectList("Member.selectAll");
	}
	
	public Integer deleteByMemberId(String member_id) {
		return mybatis.delete("Member.deleteByMemberId", member_id);
	}
	
	public int selectTotalMember() {
		return mybatis.selectOne("Member.selectTotalMember");
	}
	
	public int selectTodayMember() {
		return mybatis.selectOne("Member.selectTodayMember");
	}
	
	public List<MemberDTO> selectByGrade() {
		return mybatis.selectList("Member.selectByGrade");
	}
	
}



