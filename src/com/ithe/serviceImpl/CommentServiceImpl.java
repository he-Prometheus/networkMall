package com.ithe.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ithe.dao.CommentDao;
import com.ithe.service.CommentService;

@Transactional
@Service("commentService")
public class CommentServiceImpl implements CommentService {

	@Resource(name="commentDao")
	public CommentDao commentDao;
	
	
	@Override
	public void add(Integer goods_id, Integer user_id,String content) {
		 commentDao.add(goods_id, user_id,content);
	}


	@Override
	public void delete(Integer com_id) {
		// TODO Auto-generated method stub
		commentDao.delete(com_id);
	}

}
