package com.ithe.dao;

import org.hibernate.criterion.DetachedCriteria;

public interface OrderDao {
	
	public void delete(Integer order_id);
   
	public void add(Integer goods_id,Integer user_id);
}
