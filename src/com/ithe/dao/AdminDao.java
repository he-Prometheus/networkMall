package com.ithe.dao;

import com.ithe.domain.Admin;

public interface AdminDao {
	public Admin login(Admin admin); 
	
	public Admin fingById(Integer adm_id);
}
