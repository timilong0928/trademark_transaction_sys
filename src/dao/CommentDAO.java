package dao;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import pojo.Comment;
import pojo.Content;
import pojo.Post;

public class CommentDAO extends DAO{

	public static  List<Comment> findbytypeandid(Integer type,Integer commentid) {

		List<Comment> comments=dao.getHibernateTemplate().find("from Comment where type = " + type + " and commentid = " + commentid);
		return comments;
	}
	//查询我这个课时评论总数量
	public static Integer findmycommentnum(Integer teamid,Integer contentid){
		String hql="select count(*) from Comment where teamid = "+teamid+ " and contentid="+contentid;
		Long count=(Long) dao.getHibernateTemplate().find(hql).iterator().next();
		return count.intValue();
	}
	//查询评论总数量，为了分页
	public static Integer findcommentnum(Integer teacherid,Integer huifu){
		String hql="select count(*) from Comment";
		
		if(teacherid!=null&&teacherid>1){
				if(huifu==null)//全部
					hql="select count(*) from Comment where teacherid="+teacherid;
				else if(huifu==0)//未回复的
					hql="select count(*) from Comment where teacherid="+teacherid+"and huifu is null";
				else//已回复的
					hql="select count(*) from Comment where teacherid="+teacherid+"and huifu is not null";
		}else{
			if(huifu==null)//全部
				hql="select count(*) from Comment";
			else if(huifu==0)//未回复的
				hql="select count(*) from Comment where  huifu is null";
			else//已回复的
				hql="select count(*) from Comment where  huifu is not null";
		}
		
		
		
		Long count=(Long) dao.getHibernateTemplate().find(hql).iterator().next();
		return count.intValue();
	}
	//分页查询评论
	public static List<Comment> findbycommentpage(Integer teacherid,Integer huifu,Integer page,Integer pagesize){
		DetachedCriteria criteria=DetachedCriteria.forClass(Comment.class);
		if(teacherid!=null&&teacherid>1)
			criteria.add(Restrictions.eq("teacherid", teacherid));
		
		if(huifu!=null&&huifu==0)
			criteria.add(Restrictions.isNull("huifu"));
		
		if(huifu!=null&&huifu==1)
			criteria.add(Restrictions.isNotNull("huifu"));
		
		
		criteria.addOrder(Order.desc("id"));
		return dao.getHibernateTemplate().findByCriteria(criteria,(page-1)*pagesize,pagesize);
	}
	//按评论类型和评论的实体类的ID查询
	@SuppressWarnings("unchecked")
	public static List<Comment> findcomment(Integer teacherid,Integer courseid,Integer contentid, Integer huifu){
		DetachedCriteria criteria=DetachedCriteria.forClass(Comment.class);
		
		if(teacherid!=null&&teacherid>1)
			criteria.add(Restrictions.eq("teacherid", teacherid));
		
		if(courseid!=null)
			criteria.add(Restrictions.eq("courseid", courseid));
		
		if(contentid!=null)
			criteria.add(Restrictions.eq("contentid", contentid));
		
		
		if(huifu!=null&&huifu==0)//未回复
			criteria.add(Restrictions.eq("contentid", contentid));
		
		if(huifu!=null&&huifu==1)//已回复
			criteria.add(Restrictions.eq("contentid", contentid));
		
			
		criteria.addOrder(Order.desc("id"));
		try {
			return  dao.getHibernateTemplate().findByCriteria(criteria);
		} catch (Exception e) {
			
		}
		return null;
	}
	//搜索评论
	public static List<Comment> sousuo(String keyword , Integer teacherid) {
		String hql="from Comment where  content like ? order by id desc";
		if(teacherid!=null&&teacherid>1){
			hql="from Comment where teacherid= "+teacherid+" and content like ? order by id desc";
		}
		return dao.getHibernateTemplate().find(hql,keyword);
	}
}
