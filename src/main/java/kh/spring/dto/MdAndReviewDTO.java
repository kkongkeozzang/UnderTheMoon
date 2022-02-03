package kh.spring.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class MdAndReviewDTO {
	private int d_purchase_detail_id;
	private int d_purchase_id;
	private int purchase_detail_quantity;
	private int purchase_detail_price;
	private String purchase_detail_result;
	private Timestamp purchase_detail_delivery_date;
	private int purchase_id;
	private int p_member_id;
	private int md_review_id;
	private int md_id;
	private String md_name;
	private String md_content;
	private String md_image;

	public int getD_purchase_detail_id() {
		return d_purchase_detail_id;
	}





	public void setD_purchase_detail_id(int d_purchase_detail_id) {
		this.d_purchase_detail_id = d_purchase_detail_id;
	}





	public int getD_purchase_id() {
		return d_purchase_id;
	}





	public void setD_purchase_id(int d_purchase_id) {
		this.d_purchase_id = d_purchase_id;
	}





	public int getPurchase_detail_quantity() {
		return purchase_detail_quantity;
	}





	public void setPurchase_detail_quantity(int purchase_detail_quantity) {
		this.purchase_detail_quantity = purchase_detail_quantity;
	}





	public int getPurchase_detail_price() {
		return purchase_detail_price;
	}





	public void setPurchase_detail_price(int purchase_detail_price) {
		this.purchase_detail_price = purchase_detail_price;
	}





	public String getPurchase_detail_result() {
		return purchase_detail_result;
	}





	public void setPurchase_detail_result(String purchase_detail_result) {
		this.purchase_detail_result = purchase_detail_result;
	}





	public Timestamp getPurchase_detail_delivery_date() {
		return purchase_detail_delivery_date;
	}





	public void setPurchase_detail_delivery_date(Timestamp purchase_detail_delivery_date) {
		this.purchase_detail_delivery_date = purchase_detail_delivery_date;
	}





	public int getPurchase_id() {
		return purchase_id;
	}





	public void setPurchase_id(int purchase_id) {
		this.purchase_id = purchase_id;
	}





	public int getP_member_id() {
		return p_member_id;
	}





	public void setP_member_id(int p_member_id) {
		this.p_member_id = p_member_id;
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





	public String getMd_name() {
		return md_name;
	}





	public void setMd_name(String md_name) {
		this.md_name = md_name;
	}





	public String getMd_content() {
		return md_content;
	}





	public void setMd_content(String md_content) {
		this.md_content = md_content;
	}





	public String getMd_image() {
		return md_image;
	}





	public void setMd_image(String md_image) {
		this.md_image = md_image;
	}





	public MdAndReviewDTO(int d_purchase_detail_id, int d_purchase_id, int purchase_detail_quantity,
			int purchase_detail_price, String purchase_detail_result, Timestamp purchase_detail_delivery_date,
			int purchase_id, int p_member_id, int md_review_id, int md_id, String md_name, String md_content,
			String md_image) {
		super();
		this.d_purchase_detail_id = d_purchase_detail_id;
		this.d_purchase_id = d_purchase_id;
		this.purchase_detail_quantity = purchase_detail_quantity;
		this.purchase_detail_price = purchase_detail_price;
		this.purchase_detail_result = purchase_detail_result;
		this.purchase_detail_delivery_date = purchase_detail_delivery_date;
		this.purchase_id = purchase_id;
		this.p_member_id = p_member_id;
		this.md_review_id = md_review_id;
		this.md_id = md_id;
		this.md_name = md_name;
		this.md_content = md_content;
		this.md_image = md_image;
	}





	public MdAndReviewDTO() {
		super();
		// TODO Auto-generated constructor stub
	}





	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		return sdf.format(getPurchase_detail_delivery_date().getTime());
	}

}