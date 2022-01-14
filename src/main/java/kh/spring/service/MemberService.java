package kh.spring.service;

import java.util.Optional;



import org.springframework.stereotype.Service;

import kh.spring.dao.MemberDAO;

import lombok.RequiredArgsConstructor;

@Service
public class MemberService {

	private final MemberDAO memberDAO;
	
	public MemberService(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	public String selectByNameAndEmail(String member_email, String member_name) throws IllegalArgumentException {
		String member_username = memberDAO.selectByNameAndEmail(member_email,member_name);
		
		Optional<String> op = Optional.ofNullable(member_username);
		op.orElseThrow(()->{
            return new IllegalArgumentException("user not found");
        });
		
		return member_username;
		
	}
	

}
