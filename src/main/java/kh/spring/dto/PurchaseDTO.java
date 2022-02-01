package kh.spring.dto;

import java.sql.Timestamp;

import kh.spring.util.OrderStatus;

public class PurchaseDTO {

	private Integer purchase_id;
	private String member_id;
	private Timestamp purchase_date;
	private Integer delivery_id;
	private int purchase_amount;
	private Integer purchase_delivery_fee;
	private Integer purchase_used_point;
	private Integer purchase_coupon;
	private Integer purchase_payment;
	private String purchase_method;
	private String member_username;
	private String purchase_date_str;
	private String receipt_id;
	
	public PurchaseDTO() {}
	public PurchaseDTO(Integer purchase_id, String member_id, Timestamp purchase_date, Integer delivery_id,
			int purchase_amount, Integer purchase_delivery_fee, Integer purchase_used_point, Integer purchase_coupon,
			Integer purchase_payment, String purchase_method, String member_username, String purchase_date_str, String receipt_id) {
		super();
		this.purchase_id = purchase_id;
		this.member_id = member_id;
		this.purchase_date = purchase_date;
		this.delivery_id = delivery_id;
		this.purchase_amount = purchase_amount;
		this.purchase_delivery_fee = purchase_delivery_fee;
		this.purchase_used_point = purchase_used_point;
		this.purchase_coupon = purchase_coupon;
		this.purchase_payment = purchase_payment;
		this.purchase_method = purchase_method;
		this.member_username = member_username;
		this.purchase_date_str = purchase_date_str;
		this.receipt_id = receipt_id;
	}
	
	@SuppressWarnings("unused")
	private OrderStatus orderStatus;
	
	public Integer getPurchase_id() {
		return purchase_id;
	}
	public void setPurchase_id(Integer purchase_id) {
		this.purchase_id = purchase_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Timestamp getPurchase_date() {
		return purchase_date;
	}
	public void setPurchase_date(Timestamp purchase_date) {
		this.purchase_date = purchase_date;
	}
	public Integer getDelivery_id() {
		return delivery_id;
	}
	public void setDelivery_id(Integer delivery_id) {
		this.delivery_id = delivery_id;
	}
	public int getPurchase_amount() {
		return purchase_amount;
	}
	public void setPurchase_amount(int purchase_amount) {
		this.purchase_amount = purchase_amount;
	}
	public Integer getPurchase_delivery_fee() {
		return purchase_delivery_fee;
	}
	public void setPurchase_delivery_fee(Integer purchase_delivery_fee) {
		this.purchase_delivery_fee = purchase_delivery_fee;
	}
	public Integer getPurchase_used_point() {
		return purchase_used_point;
	}
	public void setPurchase_used_point(Integer purchase_used_point) {
		this.purchase_used_point = purchase_used_point;
	}
	public Integer getPurchase_coupon() {
		return purchase_coupon;
	}
	public void setPurchase_coupon(Integer purchase_coupon) {
		this.purchase_coupon = purchase_coupon;
	}
	public Integer getPurchase_payment() {
		return purchase_payment;
	}
	public void setPurchase_payment(Integer purchase_payment) {
		this.purchase_payment = purchase_payment;
	}
	public String getPurchase_method() {
		return purchase_method;
	}
	public void setPurchase_method(String purchase_method) {
		this.purchase_method = purchase_method;
	}
	public String getMember_username() {
		return member_username;
	}
	public void setMember_username(String member_username) {
		this.member_username = member_username;
	}
	public String getReceipt_id() {
		return receipt_id;
	}
	public void setReceipt_id(String receipt_id) {
		this.receipt_id = receipt_id;
	}
	
	public void completeOrder() {
		  this.orderStatus = OrderStatus.COMP;
	
	}
    
    public String getPurchase_date_str() {
        return purchase_date_str;
    }
    public void setPurchase_date_str(String purchase_date_str) {
        this.purchase_date_str = purchase_date_str;
    }
}
