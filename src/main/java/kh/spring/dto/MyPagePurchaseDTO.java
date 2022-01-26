package kh.spring.dto;

import java.sql.Timestamp;

public class MyPagePurchaseDTO {
	private int md_id;
	private String md_name;
	private int md_price;
	private Integer purchase_id;
	private Integer member_id;
	private Timestamp purchase_date;
	private Integer purchase_payment;
	private String md_image;
	
	public MyPagePurchaseDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MyPagePurchaseDTO(int md_id, String md_name, int md_price, Integer purchase_id, Integer member_id,
			Timestamp purchase_date, Integer purchase_payment, String md_image) {
		super();
		this.md_id = md_id;
		this.md_name = md_name;
		this.md_price = md_price;
		this.purchase_id = purchase_id;
		this.member_id = member_id;
		this.purchase_date = purchase_date;
		this.purchase_payment = purchase_payment;
		this.md_image = md_image;
	}

	public int getMd_id() {
		return md_id;
	}

	public void setMd_id(int md_id) {
		this.md_id = md_id;
	}

	public String getMd_name() {
		return md_name;
	}

	public void setMd_name(String md_name) {
		this.md_name = md_name;
	}

	public int getMd_price() {
		return md_price;
	}

	public void setMd_price(int md_price) {
		this.md_price = md_price;
	}

	public Integer getPurchase_id() {
		return purchase_id;
	}

	public void setPurchase_id(Integer purchase_id) {
		this.purchase_id = purchase_id;
	}

	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}

	public Timestamp getPurchase_date() {
		return purchase_date;
	}

	public void setPurchase_date(Timestamp purchase_date) {
		this.purchase_date = purchase_date;
	}

	public Integer getPurchase_payment() {
		return purchase_payment;
	}

	public void setPurchase_payment(Integer purchase_payment) {
		this.purchase_payment = purchase_payment;
	}

	public String getMd_image() {
		return md_image;
	}

	public void setMd_image(String md_image) {
		this.md_image = md_image;
	}
		
}
