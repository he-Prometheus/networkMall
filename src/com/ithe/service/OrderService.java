package com.ithe.service;

import org.hibernate.criterion.DetachedCriteria;

public interface OrderService {
	public void delete(Integer order_id);

	public void add(Integer goods_id,Integer user_id);
}
