package kh.spring.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnore;


@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class CartDTO {

	private Integer cart_id;
	private Integer member_id;
	private Integer md_id;
	private String cart_item;
	private Integer cart_item_count;
	private Integer cart_price;
	@JsonIgnore
	private Timestamp cart_date;
	private String cart_image;
	
	public CartDTO() {}
	
	public CartDTO(Integer cart_id, Integer member_id, Integer md_id, String cart_item, Integer cart_item_count,
			Integer cart_price, Timestamp cart_date, String cart_image) {
		super();
		this.cart_id = cart_id;
		this.member_id = member_id;
		this.md_id = md_id;
		this.cart_item = cart_item;
		this.cart_item_count = cart_item_count;
		this.cart_price = cart_price;
		this.cart_date = cart_date;
		this.cart_image = cart_image;
	}

	public Integer getCart_id() {
		return cart_id;
	}

	public void setCart_id(Integer cart_id) {
		this.cart_id = cart_id;
	}

	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}

	public Integer getMd_id() {
		return md_id;
	}

	public void setMd_id(Integer md_id) {
		this.md_id = md_id;
	}

	public String getCart_item() {
		return cart_item;
	}

	public void setCart_item(String cart_item) {
		this.cart_item = cart_item;
	}

	public Integer getCart_item_count() {
		return cart_item_count;
	}

	public void setCart_item_count(Integer cart_item_count) {
		this.cart_item_count = cart_item_count;
	}

	public Integer getCart_price() {
		return cart_price;
	}

	public void setCart_price(Integer cart_price) {
		this.cart_price = cart_price;
	}

	public Timestamp getCart_date() {
		return cart_date;
	}

	public void setCart_date(Timestamp cart_date) {
		this.cart_date = cart_date;
	}

	public String getCart_image() {
		return cart_image;
	}

	public void setCart_image(String cart_image) {
		this.cart_image = cart_image;
	}
	
	
	
}
