package kh.spring.dto;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

@JsonDeserialize
public class PurchaseDetailDTO {
	
	private Integer purchase_detail_id;
	private Integer purchase_id;
	private Integer md_id;
	private Integer purchase_detail_quantity;
	private char purchase_detail_purchased;
	private char purchase_detail_cancel_order;
	private char purchase_detail_exchange;
	private char purchase_detail_refund;
	private char purchase_detail_cancel_sale;
	private char purchase_detail_result;
	private char purchase_detail_delivery_date;
	

	public PurchaseDetailDTO() {}


	public PurchaseDetailDTO( Integer purchase_id, Integer md_id,
			Integer purchase_detail_quantity, char purchase_detail_purchased, char purchase_detail_cancel_order,
			char purchase_detail_exchange, char purchase_detail_refund, char purchase_detail_cancel_sale,
			char purchase_detail_result, char purchase_detail_delivery_date) {
		super();
		this.purchase_id = purchase_id;
		this.md_id = md_id;
		this.purchase_detail_quantity = purchase_detail_quantity;
		this.purchase_detail_purchased = purchase_detail_purchased;
		this.purchase_detail_cancel_order = purchase_detail_cancel_order;
		this.purchase_detail_exchange = purchase_detail_exchange;
		this.purchase_detail_refund = purchase_detail_refund;
		this.purchase_detail_cancel_sale = purchase_detail_cancel_sale;
		this.purchase_detail_result = purchase_detail_result;
		this.purchase_detail_delivery_date = purchase_detail_delivery_date;
	}


	public Integer getPurchase_detail_id() {
		return purchase_detail_id;
	}


	public void setPurchase_detail_id(Integer purchase_detail_id) {
		this.purchase_detail_id = purchase_detail_id;
	}


	public Integer getPurchase_id() {
		return purchase_id;
	}


	public void setPurchase_id(Integer purchase_id) {
		this.purchase_id = purchase_id;
	}


	public Integer getMd_id() {
		return md_id;
	}


	public void setMd_id(Integer md_id) {
		this.md_id = md_id;
	}


	public Integer getPurchase_detail_quantity() {
		return purchase_detail_quantity;
	}


	public void setPurchase_detail_quantity(Integer purchase_detail_quantity) {
		this.purchase_detail_quantity = purchase_detail_quantity;
	}


	public char getPurchase_detail_purchased() {
		return purchase_detail_purchased;
	}


	public void setPurchase_detail_purchased(char purchase_detail_purchased) {
		this.purchase_detail_purchased = purchase_detail_purchased;
	}


	public char getPurchase_detail_cancel_order() {
		return purchase_detail_cancel_order;
	}


	public void setPurchase_detail_cancel_order(char purchase_detail_cancel_order) {
		this.purchase_detail_cancel_order = purchase_detail_cancel_order;
	}


	public char getPurchase_detail_exchange() {
		return purchase_detail_exchange;
	}


	public void setPurchase_detail_exchange(char purchase_detail_exchange) {
		this.purchase_detail_exchange = purchase_detail_exchange;
	}


	public char getPurchase_detail_refund() {
		return purchase_detail_refund;
	}


	public void setPurchase_detail_refund(char purchase_detail_refund) {
		this.purchase_detail_refund = purchase_detail_refund;
	}


	public char getPurchase_detail_cancel_sale() {
		return purchase_detail_cancel_sale;
	}


	public void setPurchase_detail_cancel_sale(char purchase_detail_cancel_sale) {
		this.purchase_detail_cancel_sale = purchase_detail_cancel_sale;
	}


	public char getPurchase_detail_result() {
		return purchase_detail_result;
	}


	public void setPurchase_detail_result(char purchase_detail_result) {
		this.purchase_detail_result = purchase_detail_result;
	}


	public char getPurchase_detail_delivery_date() {
		return purchase_detail_delivery_date;
	}


	public void setPurchase_detail_delivery_date(char purchase_detail_delivery_date) {
		this.purchase_detail_delivery_date = purchase_detail_delivery_date;
	}

	
	
}
