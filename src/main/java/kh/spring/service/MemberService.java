package kh.spring.service;

import org.springframework.stereotype.Service;

import kh.spring.dao.MemberDAO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberService {

	private final MemberDAO memberDAO;
	

}
