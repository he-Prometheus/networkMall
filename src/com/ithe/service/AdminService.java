package com.ithe.service;

import com.ithe.domain.Admin;

public interface AdminService {
	public Admin login(Admin admin); 
	
	public Admin fingById(Integer adm_id);
}
