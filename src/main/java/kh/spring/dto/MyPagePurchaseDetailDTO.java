package kh.spring.dto;

public class MyPagePurchaseDetailDTO {

	private Integer purchase_detail_id;
	private Integer purchase_id;
	private Integer md_id;
	private Integer purchase_detail_quantity;
	private Integer purchase_detail_price;
	private String purchase_detail_purchased;
	private String purchase_detail_cancel_order;
	private String purchase_detail_exchange;
	private String purchase_detail_refund;
	private String purchase_detail_cancel_sale;
	private String purchase_detail_result;
	private String purchase_detail_delivery_date;
	private String member_username;
	private String member_id;
	private String md_region;
	private String md_name;
	private String md_content;
	private int md_price;
	private String md_category;
	private int md_abv;
	private String md_image;
	private String md_detail_image;
	public MyPagePurchaseDetailDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public MyPagePurchaseDetailDTO(Integer purchase_detail_id, Integer purchase_id, Integer md_id,
			Integer purchase_detail_quantity, Integer purchase_detail_price, String purchase_detail_purchased,
			String purchase_detail_cancel_order, String purchase_detail_exchange, String purchase_detail_refund,
			String purchase_detail_cancel_sale, String purchase_detail_result, String purchase_detail_delivery_date,
			String member_username, String member_id, String md_region, String md_name, String md_content, int md_price,
			String md_category, int md_abv, String md_image, String md_detail_image) {
		super();
		this.purchase_detail_id = purchase_detail_id;
		this.purchase_id = purchase_id;
		this.md_id = md_id;
		this.purchase_detail_quantity = purchase_detail_quantity;
		this.purchase_detail_price = purchase_detail_price;
		this.purchase_detail_purchased = purchase_detail_purchased;
		this.purchase_detail_cancel_order = purchase_detail_cancel_order;
		this.purchase_detail_exchange = purchase_detail_exchange;
		this.purchase_detail_refund = purchase_detail_refund;
		this.purchase_detail_cancel_sale = purchase_detail_cancel_sale;
		this.purchase_detail_result = purchase_detail_result;
		this.purchase_detail_delivery_date = purchase_detail_delivery_date;
		this.member_username = member_username;
		this.member_id = member_id;
		this.md_region = md_region;
		this.md_name = md_name;
		this.md_content = md_content;
		this.md_price = md_price;
		this.md_category = md_category;
		this.md_abv = md_abv;
		this.md_image = md_image;
		this.md_detail_image = md_detail_image;
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
	public Integer getPurchase_detail_price() {
		return purchase_detail_price;
	}
	public void setPurchase_detail_price(Integer purchase_detail_price) {
		this.purchase_detail_price = purchase_detail_price;
	}
	public String getPurchase_detail_purchased() {
		return purchase_detail_purchased;
	}
	public void setPurchase_detail_purchased(String purchase_detail_purchased) {
		this.purchase_detail_purchased = purchase_detail_purchased;
	}
	public String getPurchase_detail_cancel_order() {
		return purchase_detail_cancel_order;
	}
	public void setPurchase_detail_cancel_order(String purchase_detail_cancel_order) {
		this.purchase_detail_cancel_order = purchase_detail_cancel_order;
	}
	public String getPurchase_detail_exchange() {
		return purchase_detail_exchange;
	}
	public void setPurchase_detail_exchange(String purchase_detail_exchange) {
		this.purchase_detail_exchange = purchase_detail_exchange;
	}
	public String getPurchase_detail_refund() {
		return purchase_detail_refund;
	}
	public void setPurchase_detail_refund(String purchase_detail_refund) {
		this.purchase_detail_refund = purchase_detail_refund;
	}
	public String getPurchase_detail_cancel_sale() {
		return purchase_detail_cancel_sale;
	}
	public void setPurchase_detail_cancel_sale(String purchase_detail_cancel_sale) {
		this.purchase_detail_cancel_sale = purchase_detail_cancel_sale;
	}
	public String getPurchase_detail_result() {
		return purchase_detail_result;
	}
	public void setPurchase_detail_result(String purchase_detail_result) {
		this.purchase_detail_result = purchase_detail_result;
	}
	public String getPurchase_detail_delivery_date() {
		return purchase_detail_delivery_date;
	}
	public void setPurchase_detail_delivery_date(String purchase_detail_delivery_date) {
		this.purchase_detail_delivery_date = purchase_detail_delivery_date;
	}
	public String getMember_username() {
		return member_username;
	}
	public void setMember_username(String member_username) {
		this.member_username = member_username;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMd_region() {
		return md_region;
	}
	public void setMd_region(String md_region) {
		this.md_region = md_region;
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
	public int getMd_price() {
		return md_price;
	}
	public void setMd_price(int md_price) {
		this.md_price = md_price;
	}
	public String getMd_category() {
		return md_category;
	}
	public void setMd_category(String md_category) {
		this.md_category = md_category;
	}
	public int getMd_abv() {
		return md_abv;
	}
	public void setMd_abv(int md_abv) {
		this.md_abv = md_abv;
	}
	public String getMd_image() {
		return md_image;
	}
	public void setMd_image(String md_image) {
		this.md_image = md_image;
	}
	public String getMd_detail_image() {
		return md_detail_image;
	}
	public void setMd_detail_image(String md_detail_image) {
		this.md_detail_image = md_detail_image;
	}
	
	
}
