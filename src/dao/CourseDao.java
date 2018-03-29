package dao;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import pojo.Content;
import pojo.Course;
import pojo.Post;
import pojo.Team;

public class CourseDao  extends   DAO{
	//搜索这次播放的临时内容
	public static Content thecontent(Integer courseId) {
		String hql="from Content where courseId="+courseId+" and isTest=1";
		List<Content> contents = dao.getHibernateTemplate().find(hql);
		if(contents.size()>0){
			Content coutent = contents.get(0);
			return coutent;
		}
		return null;
	}
	//查询免费课程或付费课程
	@SuppressWarnings("unchecked")
	public static List<Course> findbyfufei(Integer money ,Integer teacherId,Integer classify2id,String sousuo){
		DetachedCriteria criteria=DetachedCriteria.forClass(Course.class);
		criteria.add(Restrictions.lt("status", 2));
		
		if(money!=null){
			if(money==-1)
				criteria.add(Restrictions.eq("status", 1));
			else if(money==0)
				criteria.add(Restrictions.eq("money", 0.0));
			else
				criteria.add(Restrictions.gt("money", 0.0));
		}
		
		if(teacherId!=null&&teacherId>1)
			criteria.add(Restrictions.eq("teacherId",teacherId));
		
		if(classify2id!=null)
			criteria.add(Restrictions.eq("classify2id",classify2id));
		
		if(sousuo!=null){
			//多个or查询
			Disjunction disjunction = Restrictions.disjunction();  
		    disjunction.add(Restrictions.like("title",sousuo,MatchMode.ANYWHERE));
		    disjunction.add(Restrictions.like("introduce",sousuo,MatchMode.ANYWHERE));
		    disjunction.add(Restrictions.like("teacher",sousuo,MatchMode.ANYWHERE));
			
			criteria.add(disjunction);
		}
			
			
		
		
		criteria.addOrder(Order.desc("id"));
		try {
			return  dao.getHibernateTemplate().findByCriteria(criteria);
		} catch (Exception e) {
		}
		return null;
	}
	//搜索所有这个课程的正式课程
	public static List<Content> thecontent1(Integer courseId){
		DetachedCriteria criteria=DetachedCriteria.forClass(Content.class);
		criteria.add(Restrictions.eq("courseId",courseId));
		
		criteria.addOrder(Order.asc("seq"));
		try {
			return  dao.getHibernateTemplate().findByCriteria(criteria);
		} catch (Exception e) {
		}
		return null;
	}
	
	
	//搜索资讯
	public static List<Post> sousuopost(String keyword) {
		String hql="from Post where title like ? order by id desc";
		return dao.getHibernateTemplate().find(hql,keyword);
	}
	
	//搜索课程
	public static List<Course> sousuocourse(String keyword) {
		String hql="from Course where title like ? order by id desc";
		return dao.getHibernateTemplate().find(hql,keyword);
	}
	//搜索文章
	public static List<Course> sousuocourse2(String keyword) {
		String hql="from Course where type=0 and title like ? order by id desc";
		return dao.getHibernateTemplate().find(hql,keyword);
	}
	
	//查询所有推荐的课程
	public static List<Course> findtuijian(){
		DetachedCriteria criteria=DetachedCriteria.forClass(Course.class);
		criteria.add(Restrictions.eq("status",0));
		criteria.add(Restrictions.eq("recommend",0));
		
		criteria.addOrder(Order.desc("id"));
		try {
			return  dao.getHibernateTemplate().findByCriteria(criteria);
		} catch (Exception e) {
		}
		return null;
	}
	
	//查询所有特惠的课程
	public static List<Course> findtehui(){
		DetachedCriteria criteria=DetachedCriteria.forClass(Course.class);
		criteria.add(Restrictions.eq("status",0));
		criteria.add(Restrictions.eq("privilege",0));
		
		criteria.addOrder(Order.desc("id"));
		try {
			return  dao.getHibernateTemplate().findByCriteria(criteria);
		} catch (Exception e) {
		}
		return null;
	}
	
	//查询所有免费的课程
	public static List<Course> nomoney(){
		DetachedCriteria criteria=DetachedCriteria.forClass(Course.class);
		criteria.add(Restrictions.eq("money", 0));
		criteria.addOrder(Order.desc("id"));
		try {
			return  dao.getHibernateTemplate().findByCriteria(criteria);
		} catch (Exception e) {
		}
		return null;
	}
	
	//按类型查询课程总数量，为了分页
	public static Integer findnumall(Integer teacherid,Integer classify2id,Integer status){
		String hql="select count(*) from Course ";
		
		if(teacherid!=null&&teacherid>1)
			hql= hql+" where teacherid = "+ teacherid;
		
		if(classify2id!=null&&classify2id>1){
			if(teacherid!=null&&teacherid>1)
				hql= hql+" and classify2id = "+ classify2id;
			else
				hql= hql+" where classify2id = "+ classify2id;
		}
		
		if(status!=null){
			if((teacherid!=null&&teacherid>1)||(classify2id!=null&&classify2id>1))
				hql= hql+" and status = "+ status;
			else
				hql= hql+" where status = "+ status;
		}
		
		Long count=(Long) dao.getHibernateTemplate().find(hql).iterator().next();
		return count.intValue();
		
	}
	//分页查询该类型数据
	public static List<Course> findall(Integer teacherid,Integer classify2id,Integer status,Integer size,Integer page){
		DetachedCriteria criteria=DetachedCriteria.forClass(Course.class);
		
		if(teacherid!=null&&teacherid>1)
			criteria.add(Restrictions.eq("teacherid",teacherid));
		if(classify2id!=null)
			criteria.add(Restrictions.eq("classify2id",classify2id));
		if(status!=null)
			criteria.add(Restrictions.eq("status",status));
		
		criteria.addOrder(Order.desc("id"));
		try {
			return dao.getHibernateTemplate().findByCriteria(criteria, (page - 1) * size, size);
		} catch (Exception e) {
		}
		return null;
	}
	
	
	//分页查询该类型数据
	public static List<Course> findpagebytype(Integer page, Integer size,Integer type) {
		String hql="from Course where status = 0 and type= "+type+" order by id desc";
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<Course> list=query.list();
		session.close();
		return list;
	}
	
	//按状态查询课程总数量，为了分页
	public static Integer findnumbystatus(Class<?> cls ,Integer status){
		String hql="select count(*) from "+cls.getName()+" where status = "+ status;
		Long count=(Long) dao.getHibernateTemplate().find(hql).iterator().next();
		return count.intValue();
	}
	//分页查询数据
	public static<T> List<T> findByPageOrderByIdStatus(Class<T> cls,Integer page, Integer size,Integer status) {
		String hql="";
		if(status!=null){
			hql="from "+cls.getName()+" where status="+status+" order by id desc";
		} else {
			hql="from "+cls.getName()+" order by id desc";
		}
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<T> list=query.list();
		session.close();
		return list;
	}
	
	//分页查询数据
	public static<T> List<T> findByPageOrder(Class<T> cls,Integer page, Integer size,String order) {
		String hql="from "+cls.getName()+" order by "+order+" desc";
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<T> list=query.list();
		session.close();
		return list;
	}
	
	
	//按类型查询课程总数量，为了分页
	public static Integer findall(Class<?> cls ,Integer type){
		String hql="select count(*) from "+cls.getName()+" where type = "+ type;
		Long count=(Long) dao.getHibernateTemplate().find(hql).iterator().next();
		return count.intValue();
	}
	
	//分页查询数据
	public static<T> List<T> findByPageOrderByIdType(Class<T> cls,Integer page, Integer size,Integer type) {
		String hql="";
		hql="from "+cls.getName()+" where type="+type+" order by id desc";
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<T> list=query.list();
		session.close();
		return list;
	}
	
	
	
	
	//按课程id查询课时总数量，为了分页
	public static Integer findnumbyCourseId(Integer courseId){
		String hql="select count(*) from Content where courseId = "+ courseId;
		Long count=(Long) dao.getHibernateTemplate().find(hql).iterator().next();
		return count.intValue();
	}
	
	//根据teacherId获取相应课程集合数据
	public static List<Course> findCoursesByTeacherId(Integer teacherId){
		String hql = "from Course where teacherId="+teacherId;
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		List<Course> list=query.list();
		session.close();
		return list;
	}

	//根据课程获取对应课时集合数据
	@SuppressWarnings("unchecked")
	public static List<Content> findContentsByCouresId(Integer courseId){
		String hql = "from Content where courseId="+courseId;
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		List<Content> list=query.list();
		session.close();
		return list;
	}
	
	
	
	
	//按课程名字(title)查找
	@SuppressWarnings("unchecked")
	public static<T> List<T> findByPageOrderByTitle(String keyword) {
		String hql="from Course where title like ?";
		return dao.getHibernateTemplate().find(hql,keyword);
	}
	
	//按课程讲师(teacherId)查找
	@SuppressWarnings("unchecked")
	public static<T> List<T> findByPageOrderByTeacher(String keyword) {
		String hql="from Course where teacher like ?";
		return dao.getHibernateTemplate().find(hql,keyword);
	}
	
	//按课程作者(author)查找
	@SuppressWarnings("unchecked")
	public static<T> List<T> findByPageOrderByAuthor(String keyword) {
		String hql="from Course where author like ?";
		return dao.getHibernateTemplate().find(hql,keyword);
	}
	

	@SuppressWarnings("unchecked")
	public static  List<Team> findbytime(String time1, String time2) {

		List<Team> teams=dao.getHibernateTemplate().find("from course where time between ? and ? ",new String[]{time1,time2});
		return teams;

	}


	/**
	 * 通过id找到相应的数据
	 * @param id
	 * @return
	 */
	public static Course findByid(Integer id) {
		Course course=(Course) dao.getHibernateTemplate().find("from course where id=? ",id);
		if(course!=null){
			return course;
		}
		return null;
	}

	/**
	 * 根据id删除相应的数据Course
	 * @param id
	 * @return
	 */
	public static void toDeleteById(Integer id){
		DAO.deletebyid(Course.class, id);

	}
	
	/**
	 * 修改数据
	 * @param teacher
	 */
	public static  void toUpdate(Course course){
		dao.getHibernateTemplate().update(course);
	}
}




