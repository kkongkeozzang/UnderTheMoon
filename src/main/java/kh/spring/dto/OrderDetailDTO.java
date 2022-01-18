package kh.spring.dto;

public class OrderDetailDTO {
	
	private Integer order_detail_id;
	private Integer order_id;
	private Integer md_id;
	private Integer order_detail_quantity;
	private Integer order_detail_price;
	private char order_detail_result;
	private String order_detail_method;
	private Integer order_detail_delivery_fee;
	private Integer order_detail_used_point;
	private Integer order_detail_coupon;
	private Integer order_detail_final_price;
	private char order_detail_purchased;
	private Integer delivery_id;

	public OrderDetailDTO() {}

	public OrderDetailDTO(Integer order_detail_id, Integer order_id, Integer md_id, Integer order_detail_quantity,
			Integer order_detail_price, char order_detail_result, String order_detail_method,
			Integer order_detail_delivery_fee, Integer order_detail_used_point, Integer order_detail_coupon,
			Integer order_detail_final_price, char order_detail_purchased, Integer delivery_id) {
		super();
		this.order_detail_id = order_detail_id;
		this.order_id = order_id;
		this.md_id = md_id;
		this.order_detail_quantity = order_detail_quantity;
		this.order_detail_price = order_detail_price;
		this.order_detail_result = order_detail_result;
		this.order_detail_method = order_detail_method;
		this.order_detail_delivery_fee = order_detail_delivery_fee;
		this.order_detail_used_point = order_detail_used_point;
		this.order_detail_coupon = order_detail_coupon;
		this.order_detail_final_price = order_detail_final_price;
		this.order_detail_purchased = order_detail_purchased;
		this.delivery_id = delivery_id;
	}

	public Integer getOrder_detail_id() {
		return order_detail_id;
	}

	public void setOrder_detail_id(Integer order_detail_id) {
		this.order_detail_id = order_detail_id;
	}

	public Integer getOrder_id() {
		return order_id;
	}

	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}

	public Integer getMd_id() {
		return md_id;
	}

	public void setMd_id(Integer md_id) {
		this.md_id = md_id;
	}

	public Integer getOrder_detail_quantity() {
		return order_detail_quantity;
	}

	public void setOrder_detail_quantity(Integer order_detail_quantity) {
		this.order_detail_quantity = order_detail_quantity;
	}

	public Integer getOrder_detail_price() {
		return order_detail_price;
	}

	public void setOrder_detail_price(Integer order_detail_price) {
		this.order_detail_price = order_detail_price;
	}

	public char getOrder_detail_result() {
		return order_detail_result;
	}

	public void setOrder_detail_result(char order_detail_result) {
		this.order_detail_result = order_detail_result;
	}

	public String getOrder_detail_method() {
		return order_detail_method;
	}

	public void setOrder_detail_method(String order_detail_method) {
		this.order_detail_method = order_detail_method;
	}

	public Integer getOrder_detail_delivery_fee() {
		return order_detail_delivery_fee;
	}

	public void setOrder_detail_delivery_fee(Integer order_detail_delivery_fee) {
		this.order_detail_delivery_fee = order_detail_delivery_fee;
	}

	public Integer getOrder_detail_used_point() {
		return order_detail_used_point;
	}

	public void setOrder_detail_used_point(Integer order_detail_used_point) {
		this.order_detail_used_point = order_detail_used_point;
	}

	public Integer getOrder_detail_coupon() {
		return order_detail_coupon;
	}

	public void setOrder_detail_coupon(Integer order_detail_coupon) {
		this.order_detail_coupon = order_detail_coupon;
	}

	public Integer getOrder_detail_final_price() {
		return order_detail_final_price;
	}

	public void setOrder_detail_final_price(Integer order_detail_final_price) {
		this.order_detail_final_price = order_detail_final_price;
	}

	public char getOrder_detail_purchased() {
		return order_detail_purchased;
	}

	public void setOrder_detail_purchased(char order_detail_purchased) {
		this.order_detail_purchased = order_detail_purchased;
	}

	public Integer getDelivery_id() {
		return delivery_id;
	}

	public void setDelivery_id(Integer delivery_id) {
		this.delivery_id = delivery_id;
	}
	
}
