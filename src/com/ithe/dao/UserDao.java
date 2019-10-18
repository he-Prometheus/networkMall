package com.ithe.dao;

import org.hibernate.criterion.DetachedCriteria;

import com.ithe.domain.Goods;
import com.ithe.domain.PageBean;
import com.ithe.domain.User;

public interface UserDao {
	public void save(User user);
	
	public void update(User user);

	public User checkName(String username);

	public User login(User user);

	public User findById(Integer user_id);
	
	public void delete(Integer user_id);
	
	public PageBean<User> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria);
}
