package com.ithe.serviceImpl;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ithe.dao.OrderDao;
import com.ithe.service.OrderService;


@Transactional
@Service("orderService")
public class OrderServiceImpl implements OrderService {
	
	
	@Resource(name="orderDao")
	public OrderDao orderDao;
	
	public void delete(Integer order_id) {
		 orderDao.delete(order_id);
	}

	@Override
	public void add(Integer goods_id, Integer user_id) {
		orderDao.add(goods_id,user_id);
	}

}
