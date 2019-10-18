package com.ithe.domain;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

public class User {
	private Integer user_id;
	private String user_name;
	private String user_password;
	private String user_email;
	private Date registerTime;
	private BigDecimal user_money;
	
	private Set<Order> orders = new HashSet<Order>();
	private Set<Comment> userComments = new HashSet<Comment>();
	private Set<Goods> goodsSet = new HashSet<Goods>();
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	
	public Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}
	public Set<Goods> getGoodsSet() {
		return goodsSet;
	}
	public void setGoodsSet(Set<Goods> goodsSet) {
		this.goodsSet = goodsSet;
	}
	
	public Set<Order> getOrders() {
		return orders;
	}
	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
	public Set<Comment> getUserComments() {
		return userComments;
	}
	public void setUserComments(Set<Comment> userComments) {
		this.userComments = userComments;
	}
	public BigDecimal getUser_money() {
		return user_money;
	}
	public void setUser_money(BigDecimal user_money) {
		this.user_money = user_money;
	}
	
	
}
