package kh.spring.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import kh.spring.dto.MemberDTO;


@Repository
public class MemberDAO {

	private final SqlSessionTemplate mybatis;
	private final BCryptPasswordEncoder bCrptPasswordEncoder;
	
	public MemberDAO(SqlSessionTemplate mybatis, BCryptPasswordEncoder bCrptPasswordEncoder) {
		this.mybatis = mybatis;
		this.bCrptPasswordEncoder = bCrptPasswordEncoder;
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
		
		Map<String,String> map = new HashMap<>();
		map.put("member_username", dto.getMember_username());
		map.put("member_password", bCrptPasswordEncoder.encode((dto.getMember_password())));
		map.put("member_name", dto.getMember_name());
		map.put("member_birth_date", dto.getMember_birth_date());
		map.put("member_phone", dto.getMember_phone());
		map.put("member_zipcode", dto.getMember_zipcode());
		map.put("member_address1", dto.getMember_address1());
		map.put("member_address2", dto.getMember_address2());
		map.put("member_email", dto.getMember_email());
				
		return mybatis.insert("Member.insertMember",map);

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

	}

