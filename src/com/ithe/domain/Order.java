package com.ithe.domain;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

public class Order {
	private Integer order_id;
    private User user;
	private Goods orderGoods;
	private Date order_modified_time;
	
	public Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	public Goods getOrderGoods() {
		return orderGoods;
	}
	public void setOrderGoods(Goods orderGoods) {
		this.orderGoods = orderGoods;
	}
	
	public Date getOrder_modified_time() {
		return order_modified_time;
	}
	public void setOrder_modified_time(Date order_modified_time) {
		this.order_modified_time = order_modified_time;
	}
	
	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", user=" + user + ", orderGoods=" + orderGoods
				+ ", order_modified_time=" + order_modified_time + "]";
	}
	
	
	
}
