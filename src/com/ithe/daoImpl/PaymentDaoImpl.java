package com.ithe.daoImpl;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.ithe.dao.PaymentDao;
import com.ithe.domain.Goods;
import com.ithe.domain.PageBean;
import com.ithe.domain.Payment;
import com.ithe.domain.User;
@Repository("paymentDao")
public class PaymentDaoImpl extends HibernateDaoSupport implements PaymentDao{


	@Override
	public PageBean<Payment> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		PageBean<Payment> page = new PageBean<Payment>();
		page.setPageSize(pageSize);
		page.setPageCode(pageCode);
		
		criteria.setProjection(Projections.rowCount());
		List<Number> list=(List<Number>) this.getHibernateTemplate().findByCriteria(criteria);
		if(list!=null||list.size()>0){
			int totalCount=list.get(0).intValue();
			page.setTotalCount(totalCount);
		}
		
		criteria.setProjection(null);
		List<Payment> paymentList= (List<Payment>) this.getHibernateTemplate().findByCriteria(criteria, (pageCode-1)*pageSize, pageSize);
		
		page.setBeanList(paymentList);
		return page;
	}

	@Override
	public String save(User buyUser, User sellUser, Goods payGoods) {
		
		Payment payment = new Payment();
		
		HibernateTemplate hibernateTemplate = this.getHibernateTemplate();
		payGoods.setBelong(buyUser.getUser_id());
		
		//添加商品的部分
		payment.setPay_goods_id(payGoods.getGoods_id());
		payment.setPay_goods_name(payGoods.getGoods_name());
		payment.setPay_price(payGoods.getGoods_price());
		
		hibernateTemplate.update(payGoods);
		//买方
		BigDecimal buy_money = buyUser.getUser_money();
		//卖方
		BigDecimal sell_money = sellUser.getUser_money();
		BigDecimal goods_price = payGoods.getGoods_price();
		System.out.println("买方:"+buy_money);
		 System.out.println("买方:"+buy_money+
        		 "商品:"+goods_price+"卖方:"+sell_money);
          
		buy_money = buy_money.subtract(goods_price);
		sell_money = sell_money.add(goods_price);
		
		buyUser.setUser_money(buy_money);
		payment.setPay_buy_id(buyUser.getUser_id());
		payment.setPay_buy_name(buyUser.getUser_name());
		
		hibernateTemplate.update(buyUser);
		
		sellUser.setUser_money(sell_money);
		payment.setPay_sell_id(sellUser.getUser_id());
		payment.setPay_sell_name(sellUser.getUser_name());
		
		hibernateTemplate.update(sellUser);
		
		Date currentDate = new Date(System.currentTimeMillis());
		payment.setPay_records_time(currentDate);
		hibernateTemplate.save(payment);
		
		return "交易成功";
	}

	@Override
	public void delete(Integer pay_id) {
		HibernateTemplate hibernateTemplate = this.getHibernateTemplate();
		
		hibernateTemplate.delete(hibernateTemplate.get(Payment.class, pay_id));
		
	}

	@Override
	public List<Payment> findById(DetachedCriteria criteria) {
		
		List<Payment> paymentList =	(List<Payment>) this.getHibernateTemplate().findByCriteria(criteria);
		if(paymentList!=null){
			System.out.println(paymentList.size()+"aaaaaaaaaa");	
		}
		return paymentList;
	}
}
