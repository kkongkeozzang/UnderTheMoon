package kh.spring.dto;

import java.sql.Timestamp;

public class OrderDTO {

	private Integer number_id;
	private String member_id;
	private Timestamp order_date;
	
	public OrderDTO() {}

	public OrderDTO(Integer number_id, String member_id, Timestamp order_date) {
		super();
		this.number_id = number_id;
		this.member_id = member_id;
		this.order_date = order_date;
	}

	public Integer getNumber_id() {
		return number_id;
	}

	public void setNumber_id(Integer number_id) {
		this.number_id = number_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Timestamp getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}
	
	
}
