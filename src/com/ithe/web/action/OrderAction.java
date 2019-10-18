package com.ithe.web.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;

import com.ithe.domain.Goods;
import com.ithe.domain.Order;
import com.ithe.domain.User;
import com.ithe.service.OrderService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


@Controller
public class OrderAction extends ActionSupport implements ModelDriven<Order>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public Order order= new Order();
	public Order getModel() {
		return order;
	}

	@Resource(name="orderService")
	public OrderService orderService;
	
	//删除订单
	public void delete(){
		orderService.delete(order.getOrder_id());
	}
	
	//添加订单
	public void add() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer = response.getWriter();
        
		//添加订单——现在的order.getOrder_id()上传的是商品的id
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		if(user==null){
			writer.print("请先登录");
		}else{
			//传递商品主键和用户主键，到dao层在拼接
			orderService.add(order.getOrder_id(),user.getUser_id());
			writer.print("添加成功");
		}
		
	}
	
}
