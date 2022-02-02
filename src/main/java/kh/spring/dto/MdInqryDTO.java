package kh.spring.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class MdInqryDTO {
	
	private int sort_md_question_id;
	private int md_id;
	private String md_question_username;
	private String md_question_title;
	private String md_question_content;
	private Timestamp md_question_write_date;
	private String md_question_reply_yn;
	private int md_question_id;
	private String md_response_username;
	private String md_response_content;
	private Timestamp md_response_write_date;
	private String md_name;
	private int member_id;
	
	public MdInqryDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MdInqryDTO(int sort_md_question_id, int md_id, String md_question_username, String md_question_title,
			String md_question_content, Timestamp md_question_write_date, String md_question_reply_yn,
			String md_response_username, String md_response_content, Timestamp md_response_write_date, String md_name, int member_id) {
		super();
		this.sort_md_question_id = sort_md_question_id;
		this.md_id = md_id;
		this.md_question_username = md_question_username;
		this.md_question_title = md_question_title;
		this.md_question_content = md_question_content;
		this.md_question_write_date = md_question_write_date;
		this.md_question_reply_yn = md_question_reply_yn;
		this.md_response_username = md_response_username;
		this.md_response_content = md_response_content;
		this.md_response_write_date = md_response_write_date;
		this.md_name = md_name;
		this.member_id = member_id;
	}

	public int getSort_md_question_id() {
		return sort_md_question_id;
	}
	public void setSort_md_question_id(int sort_md_question_id) {
		this.sort_md_question_id = sort_md_question_id;
	}
	public int getMd_id() {
		return md_id;
	}
	public void setMd_id(int md_id) {
		this.md_id = md_id;
	}
	public String getMd_question_username() {
		return md_question_username;
	}
	public void setMd_question_username(String md_question_username) {
		this.md_question_username = md_question_username;
	}
	public String getMd_question_title() {
		return md_question_title;
	}
	public void setMd_question_title(String md_question_title) {
		this.md_question_title = md_question_title;
	}
	public String getMd_question_content() {
		return md_question_content;
	}
	public void setMd_question_content(String md_question_content) {
		this.md_question_content = md_question_content;
	}
	public Timestamp getMd_question_write_date() {
		return md_question_write_date;
	}
	public void setMd_question_write_date(Timestamp md_question_write_date) {
		this.md_question_write_date = md_question_write_date;
	}
	public String getMd_question_reply_yn() {
		return md_question_reply_yn;
	}
	public void setMd_question_reply_yn(String md_question_reply_yn) {
		this.md_question_reply_yn = md_question_reply_yn;
	}
	public int getMd_question_id() {
		return md_question_id;
	}
	public void setMd_question_id(int md_question_id) {
		this.md_question_id = md_question_id;
	}
	public String getMd_response_username() {
		return md_response_username;
	}
	public void setMd_response_username(String md_response_username) {
		this.md_response_username = md_response_username;
	}
	public String getMd_response_content() {
		return md_response_content;
	}
	public void setMd_response_content(String md_response_content) {
		this.md_response_content = md_response_content;
	}
	public Timestamp getMd_response_write_date() {
		return md_response_write_date;
	}
	public void setMd_response_write_date(Timestamp md_response_write_date) {
		this.md_response_write_date = md_response_write_date;
	}
	public String getMd_name() {
		return md_name;
	}
	public void setMd_name(String md_name) {
		this.md_name = md_name;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public MdInqryDTO(int sort_md_question_id, int md_id, String md_question_username, String md_question_title,
			String md_question_content, Timestamp md_question_write_date, String md_question_reply_yn,
			int md_question_id, String md_response_username, String md_response_content,
			Timestamp md_response_write_date, String md_name, int member_id) {
		super();
		this.sort_md_question_id = sort_md_question_id;
		this.md_id = md_id;
		this.md_question_username = md_question_username;
		this.md_question_title = md_question_title;
		this.md_question_content = md_question_content;
		this.md_question_write_date = md_question_write_date;
		this.md_question_reply_yn = md_question_reply_yn;
		this.md_question_id = md_question_id;
		this.md_response_username = md_response_username;
		this.md_response_content = md_response_content;
		this.md_response_write_date = md_response_write_date;
		this.md_name = md_name;
		this.member_id = member_id;
	}
	public String getQuestionFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		if(getMd_question_write_date() == null) {
			return null;
		}
		return sdf.format(getMd_question_write_date().getTime());
	}
	public String getResponseFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		if(getMd_response_write_date() == null) {
			return null;
		}
		return sdf.format(getMd_response_write_date().getTime());
	}
}

