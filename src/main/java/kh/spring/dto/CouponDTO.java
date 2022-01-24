package kh.spring.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class CouponDTO {

	private Integer coupon_id;
	private String coupon_name;
	private int coupon_discount_rate;
	private String coupon_event;
	private Timestamp coupon_valid_date;
	private char coupon_used_yn;
	private Timestamp coupon_issue_date;
	private Integer member_id;
	
	public CouponDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CouponDTO(Integer coupon_id, String coupon_name, int coupon_discount_rate, String coupon_event,
			Timestamp coupon_valid_date, char coupon_used_yn, Timestamp coupon_issue_date, Integer member_id) {
		super();
		this.coupon_id = coupon_id;
		this.coupon_name = coupon_name;
		this.coupon_discount_rate = coupon_discount_rate;
		this.coupon_event = coupon_event;
		this.coupon_valid_date = coupon_valid_date;
		this.coupon_used_yn = coupon_used_yn;
		this.coupon_issue_date = coupon_issue_date;
		this.member_id = member_id;
	}
	public Integer getCoupon_id() {
		return coupon_id;
	}
	public void setCoupon_id(Integer coupon_id) {
		this.coupon_id = coupon_id;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public int getCoupon_discount_rate() {
		return coupon_discount_rate;
	}
	public void setCoupon_discount_rate(int coupon_discount_rate) {
		this.coupon_discount_rate = coupon_discount_rate;
	}
	public String getCoupon_event() {
		return coupon_event;
	}
	public void setCoupon_event(String coupon_event) {
		this.coupon_event = coupon_event;
	}
	public Timestamp getCoupon_valid_date() {
		return coupon_valid_date;
	}
	public void setCoupon_valid_date(Timestamp coupon_valid_date) {
		this.coupon_valid_date = coupon_valid_date;
	}
	public char getCoupon_used_yn() {
		return coupon_used_yn;
	}
	public void setCoupon_used_yn(char coupon_used_yn) {
		this.coupon_used_yn = coupon_used_yn;
	}
	public Timestamp getCoupon_issue_date() {
		return coupon_issue_date;
	}
	public void setCoupon_issue_date(Timestamp coupon_issue_date) {
		this.coupon_issue_date = coupon_issue_date;
	}
	public Integer getMember_id() {
		return member_id;
	}
	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}
	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		return sdf.format(getCoupon_valid_date().getTime());
	}
	
}
