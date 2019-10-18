package com.ithe.service;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Service;

import com.ithe.domain.Goods;
import com.ithe.domain.PageBean;

public interface ShowGoodsService {
	public PageBean<Goods> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria);

}
