package com.ithe.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.ithe.domain.Goods;
import com.ithe.domain.PageBean;

public interface GoodsDao {
	
	public void delete(Integer goods_id);
	
	public void add(Goods goods);
	
	public void update(Goods goods);

	public PageBean<Goods> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria);
	
	public Goods findById(Integer goods_id);
	
	public List<Goods> findByCate(DetachedCriteria criteria);
}
