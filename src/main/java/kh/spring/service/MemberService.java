package kh.spring.service;

import java.util.List;
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
		
		Optional<Integer> op = Optional.ofNullable(result);
		
		return op;
	}

	
	public int insertMember(MemberDTO dto) {
		String password = dto.getMember_password();		
		dto.setMember_password(bCrptPasswordEncoder.encode(password));
		return memberDAO.insertMember(dto);
	}

	
	public Integer resetPassword(String member_password, String member_username) {
		String rawPassword = member_password;
		String encPassword = bCrptPasswordEncoder.encode(rawPassword);
		Integer result = memberDAO.resetPassword(encPassword,member_username);//회원정보 수정을 염두 updatePassword 를 쓰지않았습니다.
		return result;
	}

	
	public int idDuplCheck(String id) {
		return memberDAO.idDuplCheck(id);
	}

	public MemberDTO selectByUsername(String username) {
		
		return memberDAO.selectByUsername(username);
	}
	
	public int updateGradeMoon(String member_username) {
		
		return memberDAO.updateGradeMoon(member_username);
	}
	
	public int updateGradeSun(String member_username) {
		
		return memberDAO.updateGradeSun(member_username);
	}
	
	public Integer selectIdByUsername(String member_username) {
		
		return memberDAO.selectIdByUsername(member_username);
	}
	
	public int updateMember(MemberDTO dto) {
		String password = dto.getMember_password();		
		dto.setMember_password(bCrptPasswordEncoder.encode(password));
		return memberDAO.updateMember(dto);
	}

	public List<MemberDTO> selectAll() {
		return memberDAO.selectAll();
	}
	
	public Integer deleteByMemberId(String member_id) {
		return memberDAO.deleteByMemberId(member_id);
	}
	
	public int selectTotalMember() {
		return memberDAO.selectTotalMember();
	}
	
	public int selectTodayMember() {
		return memberDAO.selectTodayMember();
	}
	
	public List<MemberDTO> selectByGrade() {
		return memberDAO.selectByGrade();
	}

}
