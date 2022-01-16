package kh.spring.dto;

import java.sql.Timestamp;

public class NoticeDTO {

    private int notice_id;
    private String notice_title;
    private String notice_content;
    private Timestamp notice_write_date;
    private int notice_view_count;
    private int member_id;
    
    public NoticeDTO() {
        super();
        // TODO Auto-generated constructor stub
    }
    public NoticeDTO(int notice_id, String notice_title, String notice_content, Timestamp notice_write_date,
            int notice_view_count, int member_id) {
        super();
        this.notice_id = notice_id;
        this.notice_title = notice_title;
        this.notice_content = notice_content;
        this.notice_write_date = notice_write_date;
        this.notice_view_count = notice_view_count;
        this.member_id = member_id;
    }
    public int getNotice_id() {
        return notice_id;
    }
    public void setNotice_id(int notice_id) {
        this.notice_id = notice_id;
    }
    public String getNotice_title() {
        return notice_title;
    }
    public void setNotice_title(String notice_title) {
        this.notice_title = notice_title;
    }
    public String getNotice_content() {
        return notice_content;
    }
    public void setNotice_content(String notice_content) {
        this.notice_content = notice_content;
    }
    public Timestamp getNotice_write_date() {
        return notice_write_date;
    }
    public void setNotice_write_date(Timestamp notice_write_date) {
        this.notice_write_date = notice_write_date;
    }
    public int getNotice_view_count() {
        return notice_view_count;
    }
    public void setNotice_view_count(int notice_view_count) {
        this.notice_view_count = notice_view_count;
    }
    public int getMember_id() {
        return member_id;
    }
    public void setMember_id(int member_id) {
        this.member_id = member_id;
    } 
}


