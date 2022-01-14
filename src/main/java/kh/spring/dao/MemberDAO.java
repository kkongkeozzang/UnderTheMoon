package kh.spring.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.MemberDTO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class MemberDAO {

	private final SqlSessionTemplate mybatis;

	public MemberDTO SelectByUsername(String member_username) {
		
		return mybatis.selectOne("Member.SelectByUsername",member_username);
		}

	public String selectByNameAndEmail(String member_email, String member_name) {
		
		Map<String,String> map = new HashMap<>();
		map.put("member_email", member_email);
		map.put("member_name", member_name);
		
		return mybatis.selectOne("Member.SelectByNameAndEmail",map);
	}
	
	}

