package com.ithe.web.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.ithe.domain.Admin;
import com.ithe.domain.Comment;
import com.ithe.domain.User;
import com.ithe.service.CommentService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
public class CommentAction extends ActionSupport implements ModelDriven<Comment>{

	private static final long serialVersionUID = 1L;
	public Comment comment = new Comment();
	public Comment getModel() {
		
		return comment;
	}
	
	@Resource(name="commentService")
	public CommentService commentService;
	
	public void add() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		if(user == null){
			writer.print("请先登录");
		}
		commentService.add(comment.getCom_id(), user.getUser_id(),comment.getCom_content());
			writer.print("提交成功");
	}
	
	public void delete() throws IOException{
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		System.out.println(comment.getCom_id());
		
		Admin existAdmin = (Admin) ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		if(existAdmin==null){
			writer.print("管理员才能删除评论");
		}else{
			commentService.delete(comment.getCom_id());
			writer.print("删除成功");
		}
	}
}
