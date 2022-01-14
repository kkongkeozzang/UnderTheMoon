package kh.spring.dao;

import java.util.HashMap;
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

	public MemberDTO SelectByUsername(String member_username) {
		
		return mybatis.selectOne("Member.SelectByUsername",member_username);
		}

	public String selectByNameAndEmail(String member_email, String member_name) {
		
		Map<String,String> map = new HashMap<>();
		map.put("member_email", member_email);
		map.put("member_name", member_name);
		
		return mybatis.selectOne("Member.SelectByNameAndEmail",map);
	}
	
	public int insertMember(MemberDTO dto) {
		
		Map<String,String> map = new HashMap<>();
		map.put("member_username", dto.getMember_username());
		map.put("member_password", dto.getMember_password());
		map.put("member_name", dto.getMember_name());
		map.put("member_birth_date", dto.getMember_birth_date());
		map.put("member_phone", dto.getMember_phone());
		map.put("member_zipcode", dto.getMember_zipcode());
		map.put("member_address1", dto.getMember_address1());
		map.put("member_address2", dto.getMember_address2());
		map.put("member_email", dto.getMember_email());
				
		return mybatis.insert("Member.InsertMember",map);
	}
	
	}

