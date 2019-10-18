package com.ithe.daoImpl;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.ithe.dao.GoodsDao;
import com.ithe.domain.Admin;
import com.ithe.domain.Goods;
import com.ithe.domain.Img;
import com.ithe.domain.PageBean;
import com.ithe.domain.User;

@Repository("goodsDao")
public class GoodsDaoImpl extends HibernateDaoSupport implements GoodsDao{

	@Override
	public void delete(Integer goods_id) {
		HibernateTemplate hibernateTemplate = this.getHibernateTemplate();
		Goods goods = hibernateTemplate.get(Goods.class, goods_id);
		if(goods.getUser()!=null){
			User user = hibernateTemplate.get(User.class, goods.getUser().getUser_id());
			user.getGoodsSet().remove(goods);
		}
		
		if(goods.getAdm()!=null){
			Admin adm = hibernateTemplate.get(Admin.class, goods.getAdm().getAdm_id());
			adm.getAdm_goodsSet().remove(goods);
		}
		
		hibernateTemplate.delete(hibernateTemplate.get(Goods.class, goods_id));
	}

	@Override
	public PageBean<Goods> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		PageBean<Goods> page = new PageBean<Goods>();
		page.setPageSize(pageSize);
		page.setPageCode(pageCode);
		
		criteria.setProjection(Projections.rowCount());
		List<Number> list=(List<Number>) this.getHibernateTemplate().findByCriteria(criteria);
		if(list!=null||list.size()>0){
			int totalCount=list.get(0).intValue();
			page.setTotalCount(totalCount);
		}
		
		criteria.setProjection(null);
		List<Goods> goodsList= (List<Goods>) this.getHibernateTemplate().findByCriteria(criteria, (pageCode-1)*pageSize, pageSize);
		
		page.setBeanList(goodsList);
		return page;
	}

	@Override
	public Goods findById(Integer goods_id) {
		
		Goods goods = this.getHibernateTemplate().get(Goods.class, goods_id);
		return goods;
		
	}

	@Override
	public List<Goods> findByCate(DetachedCriteria criteria) {
		
		List<Goods> listGoods = (List<Goods>) this.getHibernateTemplate().findByCriteria(criteria);
		return listGoods;
		
	}

	@Override
	public void add(Goods goods) {
		
		this.getHibernateTemplate().save(goods);
		
	}

	@Override
	public void update(Goods goods) {
		
		this.getHibernateTemplate().update(goods);
		
	}
}
