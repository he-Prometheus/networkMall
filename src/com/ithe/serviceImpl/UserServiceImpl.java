package com.ithe.serviceImpl;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ithe.dao.UserDao;
import com.ithe.domain.PageBean;
import com.ithe.domain.User;
import com.ithe.service.UserService;
import com.ithe.utils.MD5Utils;
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
	
	@Resource(name="userDao")
	private UserDao userDao;
	

	@Override
	public void save(User user) {
		String pwd = user.getUser_password();
		// 给密码加密
		user.setUser_password(MD5Utils.md5(pwd));
		// 用户的状态默认是1状态
		// 调用持久层
		userDao.save(user);

	}

	@Override
	public User checkName(String user_name) {
		return userDao.checkName(user_name);
	}

	@Override
	public User login(User user) {
		String pwd = user.getUser_password();
		// 给密码加密
		user.setUser_password(MD5Utils.md5(pwd));
		return userDao.login(user);
	}

	@Override
	public User findById(Integer user_id) {
		// TODO Auto-generated method stub
		return userDao.findById(user_id);
	}

	@Override
	public void delete(Integer user_id) {
		// TODO Auto-generated method stub
		userDao.delete(user_id);
	}

	@Override
	public PageBean<User> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		// TODO Auto-generated method stub
		return userDao.findByPage(pageCode, pageSize, criteria);
	}

	@Override
	public void update(User user) {
		userDao.update(user);
		
	}

}
