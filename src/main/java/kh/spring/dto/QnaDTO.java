package kh.spring.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class QnaDTO {

	private int qa_question_id;
	private String qa_question_category;
	private int member_id;
	private String qa_question_title;
	private String qa_question_content;
	private Timestamp qa_question_write_date;
	private String qa_question_sms_yn;
	private String member_username;
	

	public QnaDTO() {
		super();
	}
	public QnaDTO(int qa_question_id, String qa_question_category, int member_id, String qa_question_title,
			String qa_question_content, Timestamp qa_question_write_date, String qa_question_sms_yn) {
		super();
		this.qa_question_id = qa_question_id;
		this.qa_question_category = qa_question_category;
		this.member_id = member_id;
		this.qa_question_title = qa_question_title;
		this.qa_question_content = qa_question_content;
		this.qa_question_write_date = qa_question_write_date;
		this.qa_question_sms_yn = qa_question_sms_yn;
	}
	public int getQa_question_id() {
		return qa_question_id;
	}
	public void setQa_question_id(int qa_question_id) {
		this.qa_question_id = qa_question_id;
	}
	public String getQa_question_category() {
		return qa_question_category;
	}
	public void setQa_question_category(String qa_question_category) {
		this.qa_question_category = qa_question_category;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getQa_question_title() {
		return qa_question_title;
	}
	public void setQa_question_title(String qa_question_title) {
		this.qa_question_title = qa_question_title;
	}
	public String getQa_question_content() {
		return qa_question_content;
	}
	public void setQa_question_content(String qa_question_content) {
		this.qa_question_content = qa_question_content;
	}
	public Timestamp getQa_question_write_date() {
		return qa_question_write_date;
	}
	public void setQa_question_write_date(Timestamp qa_question_write_date) {
		this.qa_question_write_date = qa_question_write_date;
	}
	public String getQa_question_sms_yn() {
		return qa_question_sms_yn;
	}
	public void setQa_question_sms_yn(String qa_question_sms_yn) {
		this.qa_question_sms_yn = qa_question_sms_yn;
	}
	
	public String getMember_username() {
		return member_username;
	}
	public void setMember_username(String member_username) {
		this.member_username = member_username;
	}

	public String getFormedDate() {
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		return date.format(this.qa_question_write_date.getTime());
	}
	
	
	
}
