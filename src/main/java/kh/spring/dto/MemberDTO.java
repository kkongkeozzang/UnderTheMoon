package kh.spring.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
	private Integer member_id;
	private String member_username;
	private String member_password;
	private String member_name;
	private Timestamp member_birth_date;
	private String member_phone;
	private String member_zipcode;
	private String member_address1;
	private String member_address2;
	private Timestamp member_signup_date;
	private String grade_name;
	private String role;
	private String member_email;
	
}
