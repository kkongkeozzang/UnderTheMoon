package kh.spring.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class MemberDTO {


	   private Integer member_id;
	   private String member_username;
	   private String member_password;
	   private String member_name;
	   private String member_birth_date;
	   private String member_phone;
	   private String member_zipcode;
	   private String member_address1;
	   private String member_address2;
	   private Timestamp member_signup_date;
	   private String grade_name;
	   private String role;
	   private String member_email;
	   private int count;
	   
	   public MemberDTO() {}
	   
	   public MemberDTO(Integer member_id, String member_username, String member_password, String member_name,
	         String member_birth_date, String member_phone, String member_zipcode, String member_address1,
	         String member_address2, Timestamp member_signup_date, String grade_name, String role, String member_email, int count) {
	      super();
	      this.member_id = member_id;
	      this.member_username = member_username;
	      this.member_password = member_password;
	      this.member_name = member_name;
	      this.member_birth_date = member_birth_date;
	      this.member_phone = member_phone;
	      this.member_zipcode = member_zipcode;
	      this.member_address1 = member_address1;
	      this.member_address2 = member_address2;
	      this.member_signup_date = member_signup_date;
	      this.grade_name = grade_name;
	      this.role = role;
	      this.member_email = member_email;
	      this.count = count;
	   }

	   public Integer getMember_id() {
	      return member_id;
	   }

	   public void setMember_id(Integer member_id) {
	      this.member_id = member_id;
	   }

	   public String getMember_username() {
	      return member_username;
	   }

	   public void setMember_username(String member_username) {
	      this.member_username = member_username;
	   }

	   public String getMember_password() {
	      return member_password;
	   }

	   public void setMember_password(String member_password) {
	      this.member_password = member_password;
	   }

	   public String getMember_name() {
	      return member_name;
	   }

	   public void setMember_name(String member_name) {
	      this.member_name = member_name;
	   }

	   public String getMember_birth_date() {
	      return member_birth_date;
	   }

	   public void setMember_birth_date(String member_birth_date) {
	      this.member_birth_date = member_birth_date;
	   }

	   public String getMember_phone() {
	      return member_phone;
	   }

	   public void setMember_phone(String member_phone) {
	      this.member_phone = member_phone;
	   }

	   public String getMember_zipcode() {
	      return member_zipcode;
	   }

	   public void setMember_zipcode(String member_zipcode) {
	      this.member_zipcode = member_zipcode;
	   }

	   public String getMember_address1() {
	      return member_address1;
	   }

	   public void setMember_address1(String member_address1) {
	      this.member_address1 = member_address1;
	   }

	   public String getMember_address2() {
	      return member_address2;
	   }

	   public void setMember_address2(String member_address2) {
	      this.member_address2 = member_address2;
	   }

	   public Timestamp getMember_signup_date() {
	      return member_signup_date;
	   }

	   public void setMember_signup_date(Timestamp member_signup_date) {
	      this.member_signup_date = member_signup_date;
	   }

	   public String getGrade_name() {
	      return grade_name;
	   }

	   public void setGrade_name(String grade_name) {
	      this.grade_name = grade_name;
	   }

	   public String getRole() {
	      return role;
	   }

	   public void setRole(String role) {
	      this.role = role;
	   }

	   public String getMember_email() {
	      return member_email;
	   }

	   public void setMember_email(String member_email) {
	      this.member_email = member_email;
	   }

	   public String getFormedDate() {
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
			return sdf.format(getMember_signup_date().getTime());
	   }
	   
	   public int getCount() {
	      return count;
	   }

	   public void setCount(int count) {
	      this.count = count;
	   }
}

