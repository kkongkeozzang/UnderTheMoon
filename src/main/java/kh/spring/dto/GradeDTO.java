package kh.spring.dto;

public class GradeDTO {
   
   private String grade_name;
   private double grade_percent;
   private int grade_target;
   private String grade_coupon;
   
   public GradeDTO() {
      super();
   }

   public GradeDTO(String grade_name, double grade_percent, int grade_target, String grade_coupon) {
      super();
      this.grade_name = grade_name;
      this.grade_percent = grade_percent;
      this.grade_target = grade_target;
      this.grade_coupon = grade_coupon;
   }

   public String getGrade_name() {
      return grade_name;
   }

   public void setGrade_name(String grade_name) {
      this.grade_name = grade_name;
   }

   public double getGrade_percent() {
      return grade_percent;
   }

   public void setGrade_percent(double grade_percent) {
      this.grade_percent = grade_percent;
   }

   public int getGrade_target() {
      return grade_target;
   }
		
   public void setGrade_target(int grade_target) {
      this.grade_target = grade_target;
   }

   public String getGrade_coupon() {
      return grade_coupon;
   }

   public void setGrade_coupon(String grade_coupon) {
      this.grade_coupon = grade_coupon;
   }
      
}

