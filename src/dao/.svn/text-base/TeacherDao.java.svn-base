package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import pojo.Award;
import pojo.Course;
import pojo.Teacher;
import pojo.Team;

public class TeacherDao extends DAO {

	//查询讲师总数量，为了分页
	public static Integer findnum(Class<?> cls ){
		String hql="select count(*) from "+cls.getName();
		Long count=(Long) dao.getHibernateTemplate().find(hql).iterator().next();
		return count.intValue();
	}
	//查询数据一页数据
	@SuppressWarnings("unchecked")
	public static<T> List<T> findByPageOrder(Class<T> cls,Integer page, Integer size) {
		String hql="from "+cls.getName()+" order by id desc";
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<T> list=query.list();
		session.close();
		return list;
	}




	/**
	 * 通过id找到相应的数据
	 * @param id
	 * @return
	 */
	public static Teacher findByid(Integer id) {
		Teacher teacher=(Teacher) dao.getHibernateTemplate().find("from course where id=? ",id);
		if(teacher!=null){
			return teacher;
		}
		return null;
	}

	/**
	 * 根据id删除相应的数据Course
	 * @param id
	 * @return
	 */
	public static void toDeleteById(Integer id){
		DAO.deletebyid(Teacher.class, id);
	}
	
	
	/**
	 * 修改数据
	 * @param teacher
	 */
	public static  void toUpdate(Teacher teacher){
		dao.getHibernateTemplate().update(teacher);
	}
	
	
	
	
}
