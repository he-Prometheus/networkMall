package com.ithe.domain;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;


public class Goods {
	private Integer goods_id;
	private User user;
	private Admin adm;
	private Order orders;
	private Integer category;
	private Set<Img> imgs = new HashSet<Img>();
	private String goods_name;
	private BigDecimal goods_price;
	private String goods_desc;
	private Set<Comment> goodsComments = new HashSet<Comment>();
	private Date goods_modified_time;
	private Integer belong;
	
	
	public Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(Integer goods_id) {
		this.goods_id = goods_id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Admin getAdm() {
		return adm;
	}
	public void setAdm(Admin adm) {
		this.adm = adm;
	}
	public Integer getCategory() {
		return category;
	}
	public void setCategory(Integer category) {
		this.category = category;
	}
	
	public Order getOrders() {
		return orders;
	}
	public void setOrders(Order orders) {
		this.orders = orders;
	}
	
	public Set<Img> getImgs() {
		return imgs;
	}
	public void setImgs(Set<Img> imgs) {
		this.imgs = imgs;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public BigDecimal getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(BigDecimal goods_price) {
		this.goods_price = goods_price;
	}
	public String getGoods_desc() {
		return goods_desc;
	}
	public void setGoods_desc(String goods_desc) {
		this.goods_desc = goods_desc;
	}
	
	public Set<Comment> getGoodsComments() {
		return goodsComments;
	}
	public void setGoodsComments(Set<Comment> goodsComments) {
		this.goodsComments = goodsComments;
	}
	public Date getGoods_modified_time() {
		return goods_modified_time;
	}
	public void setGoods_modified_time(Date goods_modified_time) {
		this.goods_modified_time = goods_modified_time;
	}
	
	public Integer getBelong() {
		return belong;
	}
	public void setBelong(Integer belong) {
		this.belong = belong;
	}
	@Override
	public String toString() {
		return "Goods [goods_id=" + goods_id + ", user=" + user + ", adm=" + adm + ", orders=" + orders + ", category="
				+ category + ", imgs=" + imgs + ", goods_name=" + goods_name + ", goods_price=" + goods_price
				+ ", goods_desc=" + goods_desc + ", goodsComments=" + goodsComments + ", goods_modified_time="
				+ goods_modified_time + ", belong=" + belong + "]";
	}
	
	
	
	
}
