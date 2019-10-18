package com.ithe.daoImpl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.ithe.dao.AdminDao;
import com.ithe.domain.Admin;


@Repository("adminDao")
public class AdminDaoImpl extends HibernateDaoSupport implements AdminDao {

	@Override
	public Admin login(Admin admin) {
		DetachedCriteria criteria=DetachedCriteria.forClass(Admin.class);
		criteria.add(Restrictions.eq("adm_name",admin.getAdm_name()));
		criteria.add(Restrictions.eq("adm_password", admin.getAdm_password()));
		List<Admin> list = (List<Admin>) this.getHibernateTemplate().findByCriteria(criteria);
		if(list!=null&&list.size()>0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public Admin fingById(Integer adm_id) {
		
		return this.getHibernateTemplate().get(Admin.class, adm_id);
	}
}
