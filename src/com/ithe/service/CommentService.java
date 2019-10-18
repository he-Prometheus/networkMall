package com.ithe.service;

public interface CommentService {
	public void add(Integer goods_id,Integer user_id,String content);
	
	public void delete(Integer com_id);

}
