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
		this.member_id = member_id;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       