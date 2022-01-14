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

	public Integer selectByUsernameAndPhone(String member_username, String member_phone) {
		
		Map<String,String> map = new HashMap<>();
		map.put("member_username",member_username );
		map.put("member_phone", member_phone);
		
		int result = mybatis.selectOne("Member.SelectByUsernameAndPhone",map);
		System.out.println(result+"sdsd");
		return result;
	}
	
	}

