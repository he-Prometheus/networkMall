package com.ithe.daoImpl;

import java.sql.Date;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.ithe.dao.OrderDao;
import com.ithe.domain.Goods;
import com.ithe.domain.Order;
import com.ithe.domain.User;
@Repository("orderDao")
public class OrderDaoImpl extends HibernateDaoSupport implements OrderDao {

	public void delete(Integer order_id) {
		HibernateTemplate hibernateTemplate = this.getHibernateTemplate();
		
		hibernateTemplate.delete(hibernateTemplate.get(Order.class, order_id));
		
		
	}

	@Override
	public void add(Integer goods_id, Integer user_id) {
		HibernateTemplate hibernateTemplate = this.getHibernateTemplate();
		Goods goods = hibernateTemplate.get(Goods.class, goods_id);
		User user = hibernateTemplate.get(User.class, user_id);
		
		Order order = new Order();
		
		order.setUser(user);
		user.getOrders().add(order);
		
		order.setOrderGoods(goods);
		goods.setOrders(order);
		
		Date currentDate = new Date(System.currentTimeMillis());
		order.setOrder_modified_time(currentDate);
		
		hibernateTemplate.save(order);
		
	}
	

}
