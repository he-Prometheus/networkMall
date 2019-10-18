package com.ithe.dao;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Service;

import com.ithe.domain.Goods;
import com.ithe.domain.PageBean;

public interface ShowGoodsDao {
	public PageBean<Goods> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria);

}
