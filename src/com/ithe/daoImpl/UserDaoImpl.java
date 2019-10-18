package com.ithe.daoImpl;

import java.sql.Date;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.ithe.dao.UserDao;
import com.ithe.domain.Admin;
import com.ithe.domain.Goods;
import com.ithe.domain.Order;
import com.ithe.domain.PageBean;
import com.ithe.domain.User;

@Repository("userDao")
public class UserDaoImpl extends HibernateDaoSupport implements UserDao {
	

	@Override
	public void save(User user) {
		Date currentDate = new Date(System.currentTimeMillis());
		user.setRegisterTime(currentDate);
		this.getHibernateTemplate().save(user);
	}

	@Override
	public User checkName(String user_name) {
		DetachedCriteria criteria=DetachedCriteria.forClass(User.class);
		criteria.add(Restrictions.eq("user_name",user_name));
		@SuppressWarnings("unchecked")
		List<User> list = (List<User>) this.getHibernateTemplate().findByCriteria(criteria);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public User login(User user) {
		DetachedCriteria criteria=DetachedCriteria.forClass(User.class);
		criteria.add(Restrictions.eq("user_name",user.getUser_name()));
		criteria.add(Restrictions.eq("user_password", user.getUser_password()));
		@SuppressWarnings("unchecked")
		List<User> list = (List<User>) this.getHibernateTemplate().findByCriteria(criteria);
		if(list!=null&&list.size()>0){
			return list.get(0);
		}
		return null;
	}

	public User findById(Integer user_id) {
		return (User) this.getHibernateTemplate().get(User.class, user_id);
	}
	@Override
	public void delete(Integer user_id) {
		HibernateTemplate hibernateTemplate = this.getHibernateTemplate();
		
		hibernateTemplate.delete(hibernateTemplate.get(User.class, user_id));
		
	}

	@Override
	public PageBean<User> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		PageBean<User> page = new PageBean<User>();
		page.setPageSize(pageSize);
		page.setPageCode(pageCode);
		
		criteria.setProjection(Projections.rowCount());
		List<Number> list=(List<Number>) this.getHibernateTemplate().findByCriteria(criteria);
		if(list!=null||list.size()>0){
			int totalCount=list.get(0).intValue();
			page.setTotalCount(totalCount);
		}
		
		criteria.setProjection(null);
		List<User> userList= (List<User>) this.getHibernateTemplate().findByCriteria(criteria, (pageCode-1)*pageSize, pageSize);
		
		page.setBeanList(userList);
		return page;
	}

	@Override
	public void update(User user) {
		this.getHibernateTemplate().update(user);
		
	}

}
