
 package kh.spring.dto;


import java.sql.Timestamp;

public class PointDTO {

	  
   private int point_id;
   private int point_used_saved;
   private String point_event;
   private Timestamp point_date;
   private Integer member_id;
         
   public PointDTO() {
      super();
   }

   public PointDTO(int point_id, int point_used_saved, String point_event, Timestamp point_date, Integer member_id) {
      super();
      this.point_id = point_id;
      this.point_used_saved = point_used_saved;
      this.point_event = point_event;
      this.point_date = point_date;
      this.member_id = member_id;
   }

   public int getPoint_id() {
      return point_id;
   }

   public void setPoint_id(int point_id) {
      this.point_id = point_id;
   }

   public int getPoint_used_saved() {
      return point_used_saved;
   }

   public void setPoint_used_saved(int point_used_saved) {
      this.point_used_saved = point_used_saved;
   }

   public String getPoint_event() {
      return point_event;
   }

   public void setPoint_event(String point_event) {
      this.point_event = point_event;
   }

   public Timestamp getPoint_date() {
      return point_date;
   }

   public void setPoint_date(Timestamp point_date) {
      this.point_date = point_date;
   }

   public Integer getMember_id() {
      return member_id;
   }

   public void setMember_id(Integer member_id) {
      this.member_id = member_id;
   }

   
   
}
