package com.ithe.domain;

import java.util.HashSet;
import java.util.Set;

public class Admin {
	private Integer adm_id;
	private String adm_name;
	private String adm_password;
	private Set<Goods> adm_goodsSet = new HashSet<Goods>();
	
	public Integer getAdm_id() {
		return adm_id;
	}
	public void setAdm_id(Integer adm_id) {
		this.adm_id = adm_id;
	}
	public String getAdm_name() {
		return adm_name;
	}
	public void setAdm_name(String adm_name) {
		this.adm_name = adm_name;
	}
	public String getAdm_password() {
		return adm_password;
	}
	public void setAdm_password(String adm_password) {
		this.adm_password = adm_password;
	}
	public Set<Goods> getAdm_goodsSet() {
		return adm_goodsSet;
	}
	public void setAdm_goodsSet(Set<Goods> adm_goodsSet) {
		this.adm_goodsSet = adm_goodsSet;
	}
	

}
