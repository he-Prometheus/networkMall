package com.ithe.domain;

import java.math.BigDecimal;
import java.sql.Date;

public class Payment {
	private Integer pay_id;
//	卖方
	private Integer pay_sell_id;
	private String pay_sell_name;
//	买方
	private Integer pay_buy_id;
	private String pay_buy_name;
	private Integer pay_goods_id;
	private String pay_goods_name;
	private BigDecimal pay_price;
	private Date pay_records_time;
	
	public Integer getPay_id() {
		return pay_id;
	}
	public void setPay_id(Integer pay_id) {
		this.pay_id = pay_id;
	}
	public Integer getPay_sell_id() {
		return pay_sell_id;
	}
	public void setPay_sell_id(Integer pay_sell_id) {
		this.pay_sell_id = pay_sell_id;
	}
	public String getPay_sell_name() {
		return pay_sell_name;
	}
	public void setPay_sell_name(String pay_sell_name) {
		this.pay_sell_name = pay_sell_name;
	}
	public Integer getPay_buy_id() {
		return pay_buy_id;
	}
	public void setPay_buy_id(Integer pay_buy_id) {
		this.pay_buy_id = pay_buy_id;
	}
	public String getPay_buy_name() {
		return pay_buy_name;
	}
	public void setPay_buy_name(String pay_buy_name) {
		this.pay_buy_name = pay_buy_name;
	}
	public Integer getPay_goods_id() {
		return pay_goods_id;
	}
	public void setPay_goods_id(Integer pay_goods_id) {
		this.pay_goods_id = pay_goods_id;
	}
	public String getPay_goods_name() {
		return pay_goods_name;
	}
	public void setPay_goods_name(String pay_goods_name) {
		this.pay_goods_name = pay_goods_name;
	}
	public BigDecimal getPay_price() {
		return pay_price;
	}
	public void setPay_price(BigDecimal pay_price) {
		this.pay_price = pay_price;
	}
	public Date getPay_records_time() {
		return pay_records_time;
	}
	public void setPay_records_time(Date pay_records_time) {
		this.pay_records_time = pay_records_time;
	}
	@Override
	public String toString() {
		return "Payment [pay_id=" + pay_id + ", pay_sell_id=" + pay_sell_id + ", pay_sell_name=" + pay_sell_name
				+ ", pay_buy_id=" + pay_buy_id + ", pay_buy_name=" + pay_buy_name + ", pay_goods_id=" + pay_goods_id
				+ ", pay_goods_name=" + pay_goods_name + ", pay_price=" + pay_price + ", pay_records_time="
				+ pay_records_time + "]";
	}
	
}
