package kh.spring.dto;

public class MdDTO {
	private int md_id;
	private String md_region;
	private String md_name;
	private String md_content;
	private int md_price;
	private String md_category;
	private int md_abv;
	private String md_image;
	private String md_detail_image;
	
	public MdDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MdDTO(int md_id, String md_region, String md_name, String md_content, int md_price, String md_category,
			int md_abv, String md_image) {
		super();
		this.md_id = md_id;
		this.md_region = md_region;
		this.md_name = md_name;
		this.md_content = md_content;
		this.md_price = md_price;
		this.md_category = md_category;
		this.md_abv = md_abv;
		this.md_image = md_image;
	}
	public int getMd_id() {
		return md_id;
	}
	public void setMd_id(int md_id) {
		this.md_id = md_id;
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

