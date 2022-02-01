package kh.spring.dto;

public class MdReviewImageDTO {
	private int md_review_image_id;
	private int md_review_id;
	private String md_review_image;
	public MdReviewImageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MdReviewImageDTO(int md_review_image_id, int md_review_id, String md_review_image) {
		super();
		this.md_review_image_id = md_review_image_id;
		this.md_review_id = md_review_id;
		this.md_review_image = md_review_image;
	}
	public int getMd_review_image_id() {
		return md_review_image_id;
	}
	public void setMd_review_image_id(int md_review_image_id) {
		this.md_review_image_id = md_review_image_id;
	}
	public int getMd_review_id() {
		return md_review_id;
	}
	public void setMd_review_id(int md_review_id) {
		this.md_review_id = md_review_id;
	}
	public String getMd_review_image() {
		return md_review_image;
	}
	public void setMd_review_image(String md_review_image) {
		this.md_review_image = md_review_image;
	}
	
}
