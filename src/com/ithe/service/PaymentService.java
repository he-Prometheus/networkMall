package com.ithe.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.ithe.domain.Goods;
import com.ithe.domain.PageBean;
import com.ithe.domain.Payment;
import com.ithe.domain.User;

public interface PaymentService {
	
	public List<Payment> findById(DetachedCriteria criteria);
	
	public void delete(Integer pay_id);
	
	public String save(User buyUser,User sellUser,Goods payGoods);
	
	public PageBean<Payment> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria);

}
