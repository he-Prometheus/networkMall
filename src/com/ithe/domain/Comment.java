package com.ithe.domain;

import java.sql.Date;

public class Comment {

	private Integer com_id;
	private User user;
	private Goods goodsCom;
	private String com_content;
	private Date com_audit_time;
	public Integer getCom_id() {
		return com_id;
	}
	public void setCom_id(Integer com_id) {
		this.com_id = com_id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Goods getGoodsCom() {
		return goodsCom;
	}
	public void setGoodsCom(Goods goodsCom) {
		this.goodsCom = goodsCom;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	public Date getCom_audit_time() {
		return com_audit_time;
	}
	public void setCom_audit_time(Date com_audit_time) {
		this.com_audit_time = com_audit_time;
	}
	
}
