package com.ithe.serviceImpl;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ithe.dao.ShowGoodsDao;
import com.ithe.domain.Goods;
import com.ithe.domain.PageBean;
import com.ithe.service.ShowGoodsService;
@Service("showGoodsService")
public class ShowGoodsServiceImpl implements ShowGoodsService {
	
	@Resource(name="showGoodsDao")
	public ShowGoodsDao showGoodsDao;

	@Override
	public PageBean<Goods> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		return showGoodsDao.findByPage(pageCode, pageSize, criteria);
	}

}
