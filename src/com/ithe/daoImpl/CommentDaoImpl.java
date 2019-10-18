package com.ithe.daoImpl;

import java.sql.Date;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.ithe.dao.CommentDao;
import com.ithe.domain.Comment;
import com.ithe.domain.Goods;
import com.ithe.domain.User;

@Repository("commentDao")
public class CommentDaoImpl extends HibernateDaoSupport implements CommentDao {

	@Override
	public void add(Integer goods_id, Integer user_id,String content) {
		HibernateTemplate hibernateTemplate = this.getHibernateTemplate();
		
		//得到评论商品
		DetachedCriteria criteria1 = DetachedCriteria.forClass(Goods.class);
		criteria1.add(Restrictions.eq("goods_id",goods_id));
		@SuppressWarnings("unchecked")
		List<Goods> orderGoods = (List<Goods>) hibernateTemplate.findByCriteria(criteria1);
		Goods goods = orderGoods.get(0);
		
		//得到评论人
		DetachedCriteria criteria2 = DetachedCriteria.forClass(User.class);
		criteria2.add(Restrictions.eq("user_id",user_id));
		@SuppressWarnings("unchecked")
		List<User> orderUser = (List<User>) hibernateTemplate.findByCriteria(criteria2);
		User user = orderUser.get(0);
		
		Comment comment = new Comment();
		comment.setUser(user);
		comment.setGoodsCom(goods);
		
		Date currentDate = new Date(System.currentTimeMillis());
		comment.setCom_audit_time(currentDate);
		
		comment.setCom_content(content);
		
		//不加这句会报错（Write operations are not allowed in read-only mode 只读模式下(FlushMode.NEVER/MANUAL)写操作）
		hibernateTemplate.setCheckWriteOperations(false);
		hibernateTemplate.save(comment);
		
	}

	@Override
	public void delete(Integer com_id) {
		// TODO Auto-generated method stub
		HibernateTemplate hibernateTemplate = this.getHibernateTemplate();
		Comment comment = hibernateTemplate.get(Comment.class, com_id);
		if(comment!=null){
			hibernateTemplate.delete(comment);
		}
		
	}
}
