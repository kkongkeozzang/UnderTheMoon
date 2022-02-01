package kh.spring.dto;

import java.sql.Timestamp;

public class WishDTO {
	private int wish_id;
	private Integer member_id;
	private int md_id;
	private String wish_item;
	private int wish_price;
	private Timestamp wish_date;
	
	// md join문으로 필요한 컬럼들
	private String md_image;
	private String md_content;
	
	public WishDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public WishDTO(int wish_id, Integer member_id, int md_id, String wish_item, int wish_price, Timestamp wish_date,
			String md_image, String md_content) {
		super();
		this.wish_id = wish_id;
		this.member_id = member_id;
		this.md_id = md_id;
		this.wish_item = wish_item;
		this.wish_price = wish_price;
		this.wish_date = wish_date;
		this.md_image = md_image;
		this.md_content = md_content;
	}

	public int getWish_id() {
		return wish_id;
	}

	public void setWish_id(int wish_id) {
		this.wish_id = wish_id;
	}

	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}

	public int getMd_id() {
		return md_id;
	}

	public void setMd_id(int md_id) {
		this.md_id = md_id;
	}

	public String getWish_item() {
		return wish_item;
	}

	public void setWish_item(String wish_item) {
		this.wish_item = wish_item;
	}

	public int getWish_price() {
		return wish_price;
	}

	public void setWish_price(int wish_price) {
		this.wish_price = wish_price;
	}

	public Timestamp getWish_date() {
		return wish_date;
	}

	public void setWish_date(Timestamp wish_date) {
		this.wish_date = wish_date;
	}

	public String getMd_image() {
		return md_image;
	}

	public void setMd_image(String md_image) {
		this.md_image = md_image;
	}

	public String getMd_content() {
		return md_content;
	}

	public void setMd_content(String md_content) {
		this.md_content = md_content;
	}

	
	
}
