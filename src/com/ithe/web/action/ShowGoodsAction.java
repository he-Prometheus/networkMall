package com.ithe.web.action;

import java.util.Iterator;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.ithe.domain.Goods;
import com.ithe.domain.Img;
import com.ithe.domain.PageBean;
import com.ithe.service.ShowGoodsService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;
@Controller
public class ShowGoodsAction extends ActionSupport implements ModelDriven<Goods>{

	private static final long serialVersionUID = 1L;
	public Goods goods = new Goods();
	public Goods getModel() {
		return goods;
	}
	
	
	//跳转到第几页
	private Integer pageCode=1;
	public void setPageCode(Integer pageCode) {
		if(pageCode==null){
			pageCode=1;
		}
		this.pageCode = pageCode;
	}

	//每页显示页数
	private Integer pageSize=12;
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	
	//查找分类
	private Integer category;
	public void setCategory(Integer category) {
		this.category = category;
	}
	
	private String goods_name;
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		if(goods_name == null){
			pageCode=null;
		}
		this.goods_name = goods_name;
	}


	@Resource(name="showGoodsService")
	private ShowGoodsService showGoodsService;
	
	public String findByPage(){
		
		DetachedCriteria criteria = DetachedCriteria.forClass(Goods.class);
		//根据商品分类查找
		if(goods.getCategory()!=null &&!goods.getCategory().equals(0)){
			criteria.add(Restrictions.eq("category",goods.getCategory()));
		}
		// 查询
		PageBean<Goods> page = showGoodsService.findByPage(pageCode,pageSize,criteria);
		// 压栈
		ValueStack vs = ActionContext.getContext().getValueStack();
		// 栈顶是map<"page",page对象>
		vs.set("page", page);
		return "findByPageOk";
	}
	
	
	public String findByPage1(){
		
		DetachedCriteria criteria = DetachedCriteria.forClass(Goods.class);
		//根据商品名称搜索
		if(goods.getGoods_name()!=null&&!goods.getGoods_name().trim().equals("")){
			criteria.add(Restrictions.like("goods_name", goods.getGoods_name(),MatchMode.ANYWHERE));
		}
		// 查询
		PageBean<Goods> page = showGoodsService.findByPage(pageCode,pageSize,criteria);
		// 压栈
		ValueStack vs = ActionContext.getContext().getValueStack();
		// 栈顶是map<"page",page对象>
		vs.set("page", page);
		return "findByPageOk";
	}
}
