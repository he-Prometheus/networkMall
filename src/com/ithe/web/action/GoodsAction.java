package com.ithe.web.action;

import java.io.File;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;

import com.ithe.domain.Admin;
import com.ithe.domain.Goods;
import com.ithe.domain.Img;
import com.ithe.domain.PageBean;
import com.ithe.domain.User;
import com.ithe.service.AdminService;
import com.ithe.service.GoodsService;
import com.ithe.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;

@Controller
public class GoodsAction extends ActionSupport implements ModelDriven<Goods>{

	private static final long serialVersionUID = 1L;
	public Goods goods = new Goods();
	public Goods getModel() {
		return goods;
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
	
	private Integer category;
	public void setCategory(Integer category) {
		this.category = category;
	}
	
	@Resource(name="goodsService")
	public GoodsService goodsService;
	
	
	@Resource(name="userService")
	public UserService userService;
	
	@Resource(name="adminService")
	public AdminService adminService;
	
	//查找商品
    public String findByPage(){
		
		DetachedCriteria criteria = DetachedCriteria.forClass(Goods.class);
		if(goods.getCategory()!=null &&!goods.getCategory().equals(0)){
			criteria.add(Restrictions.eq("category",goods.getCategory()));
		}
		// 查询
		PageBean<Goods> page = goodsService.findByPage(pageCode,pageSize,criteria);
		// 压栈
		ValueStack vs = ActionContext.getContext().getValueStack();
		// 栈顶是map<"page",page对象>
		vs.set("page", page);
		
		ServletActionContext.getRequest().getSession().setAttribute("msg", "goods");
		return "findByPageOk";
	}
	
	//删除商品
	public void delete() throws Exception{
		
		Goods deleteGoods = goodsService.findById(goods.getGoods_id());
		ServletActionContext.getRequest().setCharacterEncoding("UTF-8");
        String realpath = ServletActionContext.getServletContext().getRealPath("/img");
		
        //从服务器中删除图片
        if(deleteGoods.getImgs()!=null && deleteGoods.getImgs().size()>0){
        	Iterator<Img> iterator = deleteGoods.getImgs().iterator();
    		while(iterator.hasNext()){
    			File file = new File(realpath,iterator.next().getImg_url());
    			if(file.exists()){
    				file.delete();
    			}
    		}
        }
        HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		goodsService.delete(goods.getGoods_id());
		response.getWriter().println("删除成功");
	}
	
	
	//商品详情
	public String Details(){
		DetachedCriteria criteria = DetachedCriteria.forClass(Goods.class);
		//查找商品
		Goods goodsDetails = goodsService.findById(goods.getGoods_id());
		if(goodsDetails!=null){
			criteria.add(Restrictions.eq("category",goodsDetails.getCategory()));
		}
		//查找类似商品
		List<Goods> listGoods = goodsService.findByCate(criteria);
		
		ServletActionContext.getRequest().setAttribute("goodsDetails", goodsDetails);
		ValueStack vs = ActionContext.getContext().getValueStack();
		vs.set("goodsDetails", goodsDetails);
		vs.set("listGoods", listGoods);
		return "goodsDetails";
	}
	
	
	//文件修改页跳转
	public String edit(){
		
		Goods editGoods = goodsService.findById(goods.getGoods_id());
		if(editGoods!=null){
			ServletActionContext.getRequest().setAttribute("goods", editGoods);
		}
		return "edit";
	}
	
	
	//文件上传
	private File[] upload; //上传的文件
    private String[] uploadFileName; //文件名称
    private String[] uploadContentType; //文件类型

	public void setUpload(File[] upload) {
		this.upload = upload;
	}
	public void setUploadFileName(String[] uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public void setUploadContentType(String[] uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
    
    public String add() throws Exception{
    	
    	ServletActionContext.getRequest().setCharacterEncoding("UTF-8");
        String realpath = ServletActionContext.getServletContext().getRealPath("/img");
    	
        if (upload != null) {
        	//生成项目路径文件
            File savedir=new File(realpath);
            if(!savedir.getParentFile().exists())
                savedir.getParentFile().mkdirs();
            
            for(int i=0;i<upload.length;i++){
                File savefile = new File(savedir, uploadFileName[i]);
                FileUtils.copyFile(upload[i], savefile);
                
                //生成图片类
                Img img = new Img();
                img.setImg_url(uploadFileName[i]);
                
                //图片与商品相关联
                img.setGoods(goods);
                goods.getImgs().add(img);
            }
        }
        Date currentDate = new Date(System.currentTimeMillis());
        goods.setGoods_modified_time(currentDate);
        
    	User existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
    	if(existUser!=null){
    		User user = userService.findById(existUser.getUser_id());
    		
    		goods.setUser(user);
    		user.getGoodsSet().add(goods);
    		
    		goodsService.add(goods);
    		System.out.println("user+用户+++++++++++++++++++");
    		return "userAddOk";
    	}
    	Admin existAdmin = (Admin) ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
    	if(existAdmin!=null){
    		Admin admin = adminService.fingById(existAdmin.getAdm_id());
    		
    		goods.setAdm(admin);
    		admin.getAdm_goodsSet().add(goods);
    		
    		goodsService.add(goods);
    		return "admAddOk";
    	}
    	return "index";
    }
    
    public String update() throws Exception{
    	ServletActionContext.getRequest().setCharacterEncoding("UTF-8");
        String realpath = ServletActionContext.getServletContext().getRealPath("/img");
        
        //获取旧图片名称
        String img_url[] = ServletActionContext.getRequest().getParameterValues("img_url");
    	if(upload != null) {
    		//删除被更改的图片文件
    		//生成项目路径文件
    		File savedir=new File(realpath);
    		if(img_url!=null){
    			for(int i=0;i<img_url.length;i++){
        			//生成旧文件路径
        			File saveoldfile = new File(savedir,img_url[i]);
        			if(saveoldfile != null){
        				// 说明，旧的路径存在的，删除图片
        				saveoldfile.delete();
        			}
                }
    		}
    		
    		//商品中的图片类大小
    		System.out.println("商品中的图片类大小"+goods.getImgs().size());
			goods.getImgs().clear();
    		//清空商品对应的图片数据
    		for(int i=0;i<upload.length;i++){
	    		File savefile = new File(savedir, uploadFileName[i]);
	            FileUtils.copyFile(upload[i], savefile);
	            //生成图片类
	            Img img = new Img();
	            img.setImg_url(uploadFileName[i]);
	            //图片与商品相关联
	            img.setGoods(goods);
	            goods.getImgs().add(img);
    		}
    	}
    	goodsService.update(goods);
    	User user = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
    	if(user!=null){
    		return "userAddOk";
    	}
    	return "admAddOk";
    }
}
