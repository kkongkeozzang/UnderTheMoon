package kh.spring.dto;

public class DeliveryDTO {

	private Integer delivery_id;
	private Integer member_id;
	private String delivery_address;
	private String delivery_recipient;
	private String delivery_phone;
	
	public DeliveryDTO() {}

	public DeliveryDTO(Integer delivery_id, Integer member_id, String delivery_address, String delivery_recipient,
			String delivery_phone) {
		super();
		this.delivery_id = delivery_id;
		this.member_id = member_id;
		this.delivery_address = delivery_address;
		this.delivery_recipient = delivery_recipient;
		this.delivery_phone = delivery_phone;
	}

	public Integer getDelivery_id() {
		return delivery_id;
	}

	public void setDelivery_id(Integer delivery_id) {
		this.delivery_id = delivery_id;
	}

	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}

	public String getDelivery_address() {
		return delivery_address;
	}

	public void setDelivery_address(String delivery_address) {
		this.delivery_address = delivery_address;
	}

	public String getDelivery_recipient() {
		return delivery_recipient;
	}

	public void setDelivery_recipient(String delivery_recipient) {
		this.delivery_recipient = delivery_recipient;
	}

	public String getDelivery_phone() {
		return delivery_phone;
	}

	public void setDelivery_phone(String delivery_phone) {
		this.delivery_phone = delivery_phone;
	}
	
	
	
}
