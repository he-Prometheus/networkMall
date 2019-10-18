package com.ithe.daoImpl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.ithe.dao.ShowGoodsDao;
import com.ithe.domain.Goods;
import com.ithe.domain.Img;
import com.ithe.domain.PageBean;
@Repository("showGoodsDao")
public class ShowGoodsDaoImpl extends HibernateDaoSupport implements ShowGoodsDao{

	@Override
	public PageBean<Goods> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		
		PageBean<Goods> page = new PageBean<Goods>();
		page.setPageSize(pageSize);
		page.setPageCode(pageCode);
		
		criteria.setProjection(Projections.rowCount());
		@SuppressWarnings("unchecked")
		List<Number> list=(List<Number>) this.getHibernateTemplate().findByCriteria(criteria);
		if(list!=null||list.size()>0){
			int totalCount=list.get(0).intValue();
			page.setTotalCount(totalCount);
		}
		
		criteria.setProjection(null);
		@SuppressWarnings("unchecked")
		List<Goods> goodsList= (List<Goods>) this.getHibernateTemplate().findByCriteria(criteria, (pageCode-1)*pageSize, pageSize);
		
		page.setBeanList(goodsList);
		return page;
	}

}
