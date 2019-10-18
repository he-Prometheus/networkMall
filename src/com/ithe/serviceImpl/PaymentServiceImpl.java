package com.ithe.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ithe.dao.PaymentDao;
import com.ithe.domain.Goods;
import com.ithe.domain.PageBean;
import com.ithe.domain.Payment;
import com.ithe.domain.User;
import com.ithe.service.PaymentService;

@Transactional
@Service("paymentService")
public class PaymentServiceImpl implements PaymentService{

	@Resource(name="paymentDao")
	private PaymentDao paymentDao;
	
	
	@Override
	public PageBean<Payment> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		return paymentDao.findByPage(pageCode, pageSize, criteria);
	}

	@Override
	public String save(User buyUser, User sellUser, Goods payGoods) {
		return paymentDao.save(buyUser, sellUser, payGoods);
	}

	@Override
	public void delete(Integer pay_id) {
		paymentDao.delete(pay_id);
		
	}

	@Override
	public List<Payment> findById(DetachedCriteria criteria) {
		return paymentDao.findById(criteria);
	}

}
