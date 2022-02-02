package kh.spring.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class MdReviewDTO {
	private int md_review_id;
	private int md_id;
	private String md_review_title;
	private String member_username;
	private String md_review_content;
	private Timestamp md_review_written_date;
	private String md_review_image;
	private int md_review_like;
	private int md_review_view_count;
	private String member_id;
	private int purchase_detail_id;
	

	

	public MdReviewDTO(int md_review_id, int md_id, String md_review_title, String member_username,
			String md_review_content, Timestamp md_review_written_date, String md_review_image, int md_review_like,
			int md_review_view_count, String member_id, int purchase_detail_id) {
		super();
		this.md_review_id = md_review_id;
		this.md_id = md_id;
		this.md_review_title = md_review_title;
		this.member_username = member_username;
		this.md_review_content = md_review_content;
		this.md_review_written_date = md_review_written_date;
		this.md_review_image = md_review_image;
		this.md_review_like = md_review_like;
		this.md_review_view_count = md_review_view_count;
		this.member_id = member_id;
		this.purchase_detail_id = purchase_detail_id;
	}




	public int getMd_review_id() {
		return md_review_id;
	}




	public void setMd_review_id(int md_review_id) {
		this.md_review_id = md_review_id;
	}




	public int getMd_id() {
		return md_id;
	}




	public void setMd_id(int md_id) {
		this.md_id = md_id;
	}




	public String getMd_review_title() {
		return md_review_title;
	}




	public void setMd_review_title(String md_review_title) {
		this.md_review_title = md_review_title;
	}




	public String getMember_username() {
		return member_username;
	}




	public void setMember_username(String member_username) {
		this.member_username = member_username;
	}




	public String getMd_review_content() {
		return md_review_content;
	}




	public void setMd_review_content(String md_review_content) {
		this.md_review_content = md_review_content;
	}




	public Timestamp getMd_review_written_date() {
		return md_review_written_date;
	}




	public void setMd_review_written_date(Timestamp md_review_written_date) {
		this.md_review_written_date = md_review_written_date;
	}




	public String getMd_review_image() {
		return md_review_image;
	}




	public void setMd_review_image(String md_review_image) {
		this.md_review_image = md_review_image;
	}




	public int getMd_review_like() {
		return md_review_like;
	}




	public void setMd_review_like(int md_review_like) {
		this.md_review_like = md_review_like;
	}




	public int getMd_review_view_count() {
		return md_review_view_count;
	}




	public void setMd_review_view_count(int md_review_view_count) {
		this.md_review_view_count = md_review_view_count;
	}




	public String getMember_id() {
		return member_id;
	}




	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}




	public int getPurchase_detail_id() {
		return purchase_detail_id;
	}




	public void setPurchase_detail_id(int purchase_detail_id) {
		this.purchase_detail_id = purchase_detail_id;
	}




	public MdReviewDTO() {
		super();
		// TODO Auto-generated constructor stub
	}




	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		return sdf.format(getMd_review_written_date().getTime());
	}
	
	
}
