package com.ithe.web.action;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.ithe.domain.Admin;
import com.ithe.domain.User;
import com.ithe.service.AdminService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


@Controller
public class AdminAction extends ActionSupport implements ModelDriven<Admin>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private Admin admin = new Admin();
	public Admin getModel() {
		return admin;
	}
	
	@Resource(name="adminService")
	private AdminService adminService;
	
	//判断是否已登录管理员账号
	public String information() {
		
		Admin adm = (Admin) ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		if(adm == null){
			return "admLogin";
		}else{
			return "information";
		}
	}
	
	//管理员登录时提交的表单
	public String login(){
		//从session中判断管理员有没有登录
		Admin existAdmin=adminService.login(admin);
		
		if(existAdmin == null){
			return "admLogin";
		}else{
			ServletActionContext.getRequest().getSession().removeAttribute("existUser");
			ServletActionContext.getRequest().getSession().setAttribute("existAdmin", existAdmin);
			// 登录成功
			return "admLoginOk";
		}
		
	}

}
