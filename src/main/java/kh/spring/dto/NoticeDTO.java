package kh.spring.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class NoticeDTO {

    private int notice_id;
    private String notice_title;
    private String notice_content;
    private Timestamp notice_write_date;
    private int notice_view_count;
    private int member_id;
    private String member_username;
    private int prevNum;
    private int nextNum;
    private String prevTitle;
    private String nextTitle;
    private int prevMember;
    private int nextMember;
    
    public NoticeDTO() {
        super();
        // TODO Auto-generated constructor stub
    }
    public NoticeDTO(int notice_id, String notice_title, String notice_content, Timestamp notice_write_date,
            int notice_view_count, int member_id, String member_username) {
        super();
        this.notice_id = notice_id;
        this.notice_title = notice_title;
        this.notice_content = notice_content;
        this.notice_write_date = notice_write_date;
        this.notice_view_count = notice_view_count;
        this.member_id = member_id;
        this.member_username = member_username;
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
    public String getMember_username() {
        return member_username;
    }
    public void setMember_username(String member_username) {
        this.member_username = member_username;
    }
    
    public int getPrevNum() {
        return prevNum;
    }
    public void setPrevNum(int prevNum) {
        this.prevNum = prevNum;
    }
    
    public int getNextNum() {
        return nextNum;
    }
    public void setNextNum(int nextNum) {
        this.nextNum = nextNum;
    }
    
    public String getPrevTitle() {
        return prevTitle;
    }
    public void setPrevTitle(String prevTitle) {
        this.prevTitle = prevTitle;
    }
    
    public String getNextTitle() {
        return nextTitle;
    }
    public void setNextTitle(String nextTitle) {
        this.nextTitle = nextTitle;
    }
    
    public int getPrevMember() {
        return prevMember;
    }
    public void setPrevMember(int prevMember) {
        this.prevMember = prevMember;
    }
    
    public int getNextMember() {
        return nextMember;
    }
    public void setNextMember(int nextMember) {
        this.nextMember = nextMember;
    }
    
    public String getFormedDate() {
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	return sdf.format(this.notice_write_date.getTime());
    }
}


