package com.ithe.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;

import com.ithe.domain.Goods;
import com.ithe.domain.PageBean;
import com.ithe.domain.Payment;
import com.ithe.domain.User;
import com.ithe.service.GoodsService;
import com.ithe.service.PaymentService;
import com.ithe.service.UserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;

@Controller
public class PaymentAction extends ActionSupport implements ModelDriven<Payment>{

	private static final long serialVersionUID = 1L;
	private Payment payment = new Payment();
	public Payment getModel() {
		return payment;
	}
	
	//取得密码
	private String password;
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	//	第一页
	private Integer pageCode=1;
	public void setPageCode(Integer pageCode) {
		if(pageCode==null){
			pageCode=1;
		}
		this.pageCode = pageCode;
	}
	
//	每页多少数据
	private Integer pageSize=12;
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	
	@Resource(name="paymentService")
	private PaymentService paymentService;
	
	@Resource(name="goodsService")
	public GoodsService goodsService;
	 
	@Resource(name="userService")
	public UserService userService;

	
	public String findByPage(){
	    DetachedCriteria criteria = DetachedCriteria.forClass(Payment.class);
		
		// 查询
		PageBean<Payment> page = paymentService.findByPage(pageCode,pageSize,criteria);
		// 压栈
		ValueStack vs = ActionContext.getContext().getValueStack();
		// 栈顶是map<"page",page对象>
		vs.set("page", page);
		
		ServletActionContext.getRequest().getSession().setAttribute("msg", "payment");
		return "findByPageOk";
	}
	 
	 public void buyGoods() throws IOException{
		 
         HttpServletResponse response = ServletActionContext.getResponse();
         response.setContentType("text/html;charset=utf-8");
         PrintWriter writer = response.getWriter();
         if(payment.getPay_buy_id()==null){
        	 writer.print("请先登录");
          	 return;
         }
         //商品
         Goods payGoods = goodsService.findById(payment.getPay_goods_id());
         System.out.println(payGoods.getGoods_desc()+":"+payGoods.getBelong());
         if(payGoods.getBelong()!=null){
        	 writer.print("商品已被购买");
         	 return;
         }
         BigDecimal price = payGoods.getGoods_price();
		//买方
		 User buyUser = userService.findById(payment.getPay_buy_id());
		 if(buyUser.getUser_id()==payGoods.getUser().getUser_id()){
			 writer.print("点击错误，是自己的商品");
			 return;
		 }
		 if(password.equals(buyUser.getUser_password())){
			 writer.print("密码错误");
			 return;
		 }
		 
		 BigDecimal goods_price = price;
		 BigDecimal buyMoney = buyUser.getUser_money();
		 if(buyMoney.compareTo(goods_price)!=1){
		 	 writer.print("对不起，您的余额不足");
		 	 return;
		 }
		 //卖方
		 User sellUser = userService.findById(payment.getPay_sell_id());
		 String judge = paymentService.save(buyUser, sellUser, payGoods);
		 if("交易成功".equals(judge)){
			 System.out.println(judge);
			 writer.print("交易成功");
		 }else{
			 writer.print("交易失败");
		 }
	}
	 
	 public void delete() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		paymentService.delete(payment.getPay_id());
		response.getWriter().println("删除成功");		 
	 }
	 
	 public void findByID(){
		 DetachedCriteria criteria = DetachedCriteria.forClass(Payment.class);
		 
		 System.out.println(payment.getPay_buy_id());
		 
		 criteria.add(Restrictions.eq("pay_buy_id", payment.getPay_buy_id()));
		 List<Payment> paymentList = (List<Payment>) paymentService.findById(criteria);

		 HttpServletResponse response = ServletActionContext.getResponse();
		 response.setContentType("text/html;charset=UTF-8");
		 try {
			ServletActionContext.getRequest().getSession().setAttribute("paymentList", paymentList);
			response.getWriter().println("查找成功");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	 }
}
