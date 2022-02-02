package kh.spring.dto;

import java.sql.Timestamp;

public class VisitCountDTO {
	private int visit_id;
	private String visit_ip;
	private Timestamp visit_time;
	private String visit_refer;
	private String visit_agent;
	private String visit_date;
	private int count;
	
	public VisitCountDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public VisitCountDTO(int visit_id, String visit_ip, Timestamp visit_time, String visit_refer, String visit_agent, String visit_date, int count) {
		super();
		this.visit_id = visit_id;
		this.visit_ip = visit_ip;
		this.visit_time = visit_time;
		this.visit_refer = visit_refer;
		this.visit_agent = visit_agent;
		this.visit_date = visit_date;
		this.count = count;
	}
	public int getVisit_id() {
		return visit_id;
	}
	public void setVisit_id(int visit_id) {
		this.visit_id = visit_id;
	}
	public String getVisit_ip() {
		return visit_ip;
	}
	public void setVisit_ip(String visit_ip) {
		this.visit_ip = visit_ip;
	}
	public Timestamp getVisit_time() {
		return visit_time;
	}
	public void setVisit_time(Timestamp visit_time) {
		this.visit_time = visit_time;
	}
	public String getVisit_refer() {
		return visit_refer;
	}
	public void setVisit_refer(String visit_refer) {
		this.visit_refer = visit_refer;
	}
	public String getVisit_agent() {
		return visit_agent;
	}
	public void setVisit_agent(String visit_agent) {
		this.visit_agent = visit_agent;
	}
	public String getVisit_date() {
		return visit_date;
	}
	public void setVisit_date(String visit_date) {
		this.visit_date = visit_date;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
}
