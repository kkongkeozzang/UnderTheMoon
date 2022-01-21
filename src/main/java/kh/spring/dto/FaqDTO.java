package kh.spring.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class FaqDTO {
	private int faq_id;
	private String faq_category;
	private String faq_title;
	private String faq_content;
	private Timestamp faq_write_date;
	private int faq_view_count;
	private int member_id;
	private String member_username;
	
	public FaqDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FaqDTO(int faq_id, String faq_category, String faq_title, String faq_content, Timestamp faq_write_date,
			int faq_view_count, int member_id) {
		super();
		this.faq_id = faq_id;
		this.faq_category = faq_category;
		this.faq_title = faq_title;
		this.faq_content = faq_content;
		this.faq_write_date = faq_write_date;
		this.faq_view_count = faq_view_count;
		this.member_id = member_id;
	}
	public int getFaq_id() {
		return faq_id;
	}
	public void setFaq_id(int faq_id) {
		this.faq_id = faq_id;
	}
	public String getFaq_category() {
		return faq_category;
	}
	public void setFaq_category(String faq_category) {
		this.faq_category = faq_category;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public Timestamp getFaq_write_date() {
		return faq_write_date;
	}
	public void setFaq_write_date(Timestamp faq_write_date) {
		this.faq_write_date = faq_write_date;
	}
	public int getFaq_view_count() {
		return faq_view_count;
	}
	public void setFaq_view_count(int faq_view_count) {
		this.faq_view_count = faq_view_count;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
    public String getMember_username() {
        return member_username;
    }
    public void setMember_username(String member_username) {
        this.member_username = member_username;
    }
    public String getFormedDate() {
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	return sdf.format(this.faq_write_date.getTime());
    }
}
