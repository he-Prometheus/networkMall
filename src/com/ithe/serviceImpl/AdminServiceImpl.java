package com.ithe.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ithe.dao.AdminDao;
import com.ithe.domain.Admin;
import com.ithe.service.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Resource(name="adminDao")
	private AdminDao adminDao;
	
	@Override
	public Admin login(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.login(admin);
	}

	@Override
	public Admin fingById(Integer adm_id) {
		// TODO Auto-generated method stub
		return adminDao.fingById(adm_id);
	}
	
	
	

}
