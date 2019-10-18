package com.ithe.web.action;

import java.awt.image.RenderedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;

import com.ithe.domain.Goods;
import com.ithe.domain.Img;
import com.ithe.domain.Order;
import com.ithe.domain.PageBean;
import com.ithe.domain.User;
import com.ithe.service.UserService;
import com.ithe.utils.CodeUtil;
import com.ithe.utils.MD5Utils;
import com.ithe.utils.MailUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;


@Controller
public class UserAction extends ActionSupport implements ModelDriven<User> {

	private static final long serialVersionUID = 1L;
	
	private User user = new User();
	public User getModel() {
		return user;
	}
	
	private Integer pageCode=1;
	public void setPageCode(Integer pageCode) {
		if(pageCode==null){
			pageCode=1;
		}
		this.pageCode = pageCode;
	}
	
	private Integer pageSize=12;
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
    
	@Resource(name="userService")
	private UserService userService;
	
	
	//判断用户名是否存在
	public void checkName(){
		
		User u=userService.checkName(user.getUser_name());
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
	    try {
			PrintWriter writer = response.getWriter();
			if(u != null){
				// 说明：登录名查询到用户了，说明登录名已经存在了，不能注册
				writer.print("no");
			}
			else{
				// 说明，不存在登录名，可以注册
				writer.print("yes");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//用户注册
	public String regist(){
		if(!user.getUser_email().contains("QQ.com")){
			user.setUser_email(user.getUser_email()+"QQ.com");
		}
		// 接收请求参数
		userService.save(user);
		return LOGIN;
	}
	
	//用户登录
	public String login(){
		User existUser=userService.login(user);
		if(existUser == null){
			return LOGIN;
		}else{
			ServletActionContext.getRequest().getSession().removeAttribute("existAdmin");
			ServletActionContext.getRequest().getSession().setAttribute("existUser", existUser);
			// 登录成功
			return "loginOK";
		}
	}
	
	//退出登录
	public String exit(){
		ServletActionContext.getRequest().getSession().removeAttribute("existUser");
		return "exit";
	}
	
	
	//激活邮箱
	public void sendEmail() throws IOException{
		
		String emailMsg="注册成功，欢迎您成为我们的一员,";
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		
		try {
			PrintWriter writer = response.getWriter();
			MailUtils.sendMail(user.getUser_email(), emailMsg);
			writer.print("yes");
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//生成验证码
	public void getCode(){
		 // 调用工具类生成的验证码和验证码图片
        Map<String, Object> codeMap = CodeUtil.generateCodeAndPic();

        // 将四位数字的验证码保存到Session中。
        ServletActionContext.getRequest().getSession().setAttribute("code", codeMap.get("code").toString());
        System.out.println(codeMap.get("code").toString());
        // 禁止图像缓存。
        HttpServletResponse response = ServletActionContext.getResponse();
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", -1);

		response.setContentType("image/jpeg");

        // 将图像输出到Servlet输出流中。
        ServletOutputStream sos;
        try {
            sos = response.getOutputStream();
            ImageIO.write((RenderedImage) codeMap.get("codePic"), "jpeg", sos);
            sos.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
	}
	
	//判断验证码是否正确
	public void checkCode() {
		String code = ServletActionContext.getRequest().getParameter("checkcode");
		
		String session_code = (String) ServletActionContext.getRequest().getSession().getAttribute("code");
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		try {
			PrintWriter writer = response.getWriter();
			if(session_code.equals(code)){
				writer.print("yes");
			}else{
				writer.print("no");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//个人中心
	public String info(){
		User userInfo = new User();
		User existUser=(User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		if(existUser!=null){
			userInfo = userService.findById(existUser.getUser_id());
		}
		
		ServletActionContext.getRequest().getSession().setAttribute("userInfo", userInfo);
	    return "info";
	}
	
	//用户管理
	public String manage(){
		User userInfo = userService.findById(user.getUser_id());
		ServletActionContext.getRequest().getSession().setAttribute("userInfo", userInfo);
		return "info";
	}
	
	//删除用户
	public void delete(){
		userService.delete(user.getUser_id());
	}
	
	//用户查询
	public String findByPage(){
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
		
		// 查询
		PageBean<User> page = userService.findByPage(pageCode,pageSize,criteria);
		// 压栈
		ValueStack vs = ActionContext.getContext().getValueStack();
		// 栈顶是map<"page",page对象>
		vs.set("page", page);
		
		ServletActionContext.getRequest().getSession().setAttribute("msg", "user");
		return "findByPageOk";
	}
	
	public String edit(){
		System.out.println(user.getUser_id());
		User editUser = userService.findById(user.getUser_id());
		ServletActionContext.getRequest().getSession().setAttribute("editUser", editUser);
		return "edit";
	}
	
	public String upUser(){
		System.out.println(user.getUser_id());
		User editUser = userService.findById(user.getUser_id());
		ServletActionContext.getRequest().getSession().setAttribute("editUser", editUser);
		return "up";
	}
	
	public String update(){
		System.out.println(user.getUser_money()+user.getUser_email());
		String pwd = user.getUser_password();
		System.out.println(pwd);
		// 给密码加密
		user.setUser_password(MD5Utils.md5(pwd));
		userService.update(user);
		
		return "success";
		
	}
	
}
