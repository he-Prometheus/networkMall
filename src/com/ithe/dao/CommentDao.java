package com.ithe.dao;

public interface CommentDao {
	public void add(Integer goods_id,Integer user_id,String content);

	public void delete(Integer com_id);
}
