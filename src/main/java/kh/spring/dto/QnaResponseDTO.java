package kh.spring.dto;

import java.sql.Timestamp;

public class QnaResponseDTO {
	
	private int qa_response_id;
	private int qa_question_id;
	private int member_id;
	private String qa_response_content;
	private Timestamp qa_response_write_date;
	private String member_username;

	
	
	
	public QnaResponseDTO() {
		super();
	}
	
	public QnaResponseDTO(int qa_response_id, int qa_question_id, int member_id, String qa_response_content,
			Timestamp qa_response_write_date) {
		super();
		this.qa_response_id = qa_response_id;
		this.qa_question_id = qa_question_id;
		this.member_id = member_id;
		this.qa_response_content = qa_response_content;
		this.qa_response_write_date = qa_response_write_date;
	}

	public int getQa_response_id() {
		return qa_response_id;
	}
	public void setQa_response_id(int qa_response_id) {
		this.qa_response_id = qa_response_id;
	}
	

	public int getQa_question_id() {
		return qa_question_id;
	}

	public void setQa_question_id(int qa_question_id) {
		this.qa_question_id = qa_question_id;
	}

	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getQa_response_content() {
		return qa_response_content;
	}
	public void setQa_response_content(String qa_response_content) {
		this.qa_response_content = qa_response_content;
	}
	public Timestamp getQa_response_write_date() {
		return qa_response_write_date;
	}
	public void setQa_response_write_date(Timestamp qa_response_write_date) {
		this.qa_response_write_date = qa_response_write_date;
	}

	public String getMember_username() {
		return member_username;
	}

	public void setMember_username(String member_username) {
		this.member_username = member_username;
	}

	
	
	
	
}
