package com.ithe.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ithe.dao.GoodsDao;
import com.ithe.domain.Goods;
import com.ithe.domain.PageBean;
import com.ithe.service.GoodsService;
@Transactional
@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {

	
	@Resource(name="goodsDao")
	public GoodsDao goodsDao;

    //删除商品
	public void delete(Integer goods_id) {
		 goodsDao.delete(goods_id);
	}
	
	//查找商品
	public PageBean<Goods> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		return goodsDao.findByPage(pageCode, pageSize, criteria);
	}

	@Override
	public Goods findById(Integer goods_id) {
		// TODO Auto-generated method stub
		return goodsDao.findById(goods_id);
	}

	@Override
	public List<Goods> findByCate(DetachedCriteria criteria) {
		
		return goodsDao.findByCate(criteria);
	}

	@Override
	public void add(Goods goods) {
		goodsDao.add(goods);
		
	}

	@Override
	public void update(Goods goods) {
		goodsDao.update(goods);
		
	}

}
