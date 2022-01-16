package kh.spring.service;

import java.util.Optional;


import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kh.spring.dao.MemberDAO;

import kh.spring.dto.MemberDTO;

@Service
public class MemberService {

	private final MemberDAO memberDAO;
	
	private final BCryptPasswordEncoder bCrptPasswordEncoder;
	
	public MemberService(MemberDAO memberDAO,BCryptPasswordEncoder bCrptPasswordEncoder) {
		this.memberDAO = memberDAO;
		this.bCrptPasswordEncoder = bCrptPasswordEncoder;
	}

	public String selectByNameAndEmail(String member_email, String member_name) throws IllegalArgumentException {
		String member_username = memberDAO.selectByNameAndEmail(member_email,member_name);
		
		Optional<String> op = Optional.ofNullable(member_username);
		op.orElseThrow(()->{
            return new IllegalArgumentException("user not found");
        });
		
		return member_username;
		
	}


	public Optional<Integer> selectByUsernameAndPhone(String member_username, String member_phone) {
		
		Integer result = memberDAO.selectByUsernameAndPhone(member_username,member_phone);
		System.out.println(result);
		Optional<Integer> op = Optional.ofNullable(result);
		System.out.println(op);
		return op;
	}

	
	public int insertMember(MemberDTO dto) {
		return memberDAO.insertMember(dto);
	}

	
	public Integer resetPassword(String member_password, String member_username) {
		String rawPassword = member_password;
		String encPassword = bCrptPasswordEncoder.encode(rawPassword);
		Integer result = memberDAO.resetPassword(encPassword,member_username);//회원정보 수정을 염두 updatePassword 를 쓰지않았습니다.
		return result;
		
	}

}
