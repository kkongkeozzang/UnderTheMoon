package kh.spring.dao;

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
}
