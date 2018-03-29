package dao;

import java.lang.reflect.Field;
import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.classic.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import pojo.Article;
import pojo.Order2;
import pojo.Product;
import pojo.Sb;
import pojo.Sbfenlei;
import pojo.Team;
import pojo.Yewu;

import util.SpringUtil;

public class DAO {
	
	protected static HibernateDao dao=(HibernateDao) SpringUtil.getBean("hibernateDao");
	
	static{
		System.out.println("dao:"+dao);
	}
	
	//保存
	public static void save(Object obj){
		dao.getHibernateTemplate().save(obj);
	}
	//删除
	public static void delete(Object obj){
		dao.getHibernateTemplate().delete(obj);
	}
	
	public static<T> void delete(List<T> list) {
		for (Object object : list) {
			delete(object);
	}
}
	//按ID删除
	public static<T> void deletebyid(Class<T> cls,Integer id){
		String hql="delete from "+cls.getName()+" where id=?";
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setInteger(0, id);
		query.executeUpdate();
		session.close();
	}
	
	public static<T> T findbykey(String key,String value,Class<T> cls){
		DetachedCriteria criteria=DetachedCriteria.forClass(cls);
		criteria.add(Restrictions.eq(key, value));
		try {
			return (T) dao.getHibernateTemplate().findByCriteria(criteria).get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	//修改
	public static void update(Object obj){
		dao.getHibernateTemplate().update(obj);
		
	}
	/************************* 指定条件查询 *************************/
	/**
	 * 多条件查询所有，无分页
	 * 
	 * @param o
	 *            丢入的对象有多个参数，模糊查询，取交集
	 * @return
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws ClassNotFoundException
	 */
	public static List<?> find(Object o) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(o.getClass());
		// Class c=Order2.class;
		addCriteria(o, criteria);
		criteria.addOrder(Order.asc("id"));
		List<Object> objects = dao.getHibernateTemplate().findByCriteria(
				criteria);
		return objects;
	}
	/**
	 * 多条件非空判定
	 * 
	 * @param o
	 * @param criteria
	 */
	private static void addCriteria(Object o, DetachedCriteria criteria) {
		Field[] fileds = o.getClass().getDeclaredFields();
		/*System.out.println("cd" + fileds.length);*/
		for (Field f : fileds) {
			f.setAccessible(true);
			try {
				if (f.get(o) != null && !f.get(o) .equals("")) {
					if (f.getType() == Integer.class
							|| f.getType() == Short.class
							|| f.getType() == Long.class
							|| f.getType() == Double.class
							|| f.getType() == Float.class
							|| f.getType() == Timestamp.class) {
						//此处进行了一个很危险的修
						criteria.add(Restrictions.like(f.getName(), f.get(o)));
						/*System.out.println("dao:1" + f.getName() + f.get(o));*/
					} else {
						criteria.add(Restrictions.like(f.getName(), f.get(o)
								.toString(), MatchMode.ANYWHERE));
						/*System.out.println("dao:2" + f.getName() + f.get(o)
								+ f.getType());*/
					}
				}
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// System.out.println(f.getName());
		}
	}
	//按ID查询
	@SuppressWarnings("unchecked")
	public static<T> T findbyid(Class<T> cls,Integer id){
		DetachedCriteria criteria=DetachedCriteria.forClass(cls);
		criteria.add(Restrictions.eq("id", id));
		try {
			return (T) dao.getHibernateTemplate().findByCriteria(criteria).get(0);
		} catch (Exception e) {
		}
		return null;
	}
	
	//按ID查询表中所有
	@SuppressWarnings("unchecked")
	public static<T> T findallbyid(Class<T> cls,Integer id){
		DetachedCriteria criteria=DetachedCriteria.forClass(cls);
		criteria.add(Restrictions.eq("id", id));
		try {
			return (T) dao.getHibernateTemplate().findByCriteria(criteria);
		} catch (Exception e) {
		}
		return null;
	}
	
	//按单个String条件查询
	@SuppressWarnings("unchecked")
	public static<T> List<T> findbystring(Class<T> cls,String name,String value){
		DetachedCriteria criteria=DetachedCriteria.forClass(cls);
		criteria.add(Restrictions.eq(name, value));
		try {
			return  dao.getHibernateTemplate().findByCriteria(criteria);
		} catch (Exception e) {
		}
		return null;
	}
	
	//按单个String条件查询单个
	@SuppressWarnings("unchecked")
	public static<T> T findbystringone(Class<T> cls,String name,String value){
		DetachedCriteria criteria=DetachedCriteria.forClass(cls);
		criteria.add(Restrictions.eq(name, value));
		criteria.addOrder(Order.desc("id"));
		try {
			return  (T) dao.getHibernateTemplate().findByCriteria(criteria).get(0);
		} catch (Exception e) {
		}
		return null;
	}
	//按单个Integer条件查询
	@SuppressWarnings("unchecked")
	public static<T> List<T> findbyinteger(Class<T> cls,String name,Integer value){
		DetachedCriteria criteria=DetachedCriteria.forClass(cls);
		criteria.add(Restrictions.eq(name, value));
		criteria.addOrder(Order.desc("id"));
		try {
			return  dao.getHibernateTemplate().findByCriteria(criteria);
		} catch (Exception e) {
		}
		return null;
	}
	
	//按单个Integer条件查询单个
	@SuppressWarnings("unchecked")
	public static <T> T findbyintegerone(Class<T> cls,String name,Integer value){
		DetachedCriteria criteria=DetachedCriteria.forClass(cls);
		criteria.add(Restrictions.eq(name, value));
		criteria.addOrder(Order.desc("id"));
		try {
			return  (T) dao.getHibernateTemplate().findByCriteria(criteria).get(0);
		} catch (Exception e) {
		}
		return null;
	}
	
	
	//按单个Integer条件查询
	@SuppressWarnings("unchecked")
	public static<T> List<T> findbyintegerordertime(Class<T> cls,String name,Integer value){
		DetachedCriteria criteria=DetachedCriteria.forClass(cls);
		criteria.add(Restrictions.eq(name, value));
		criteria.addOrder(Order.desc("time"));
		try {
			return  dao.getHibernateTemplate().findByCriteria(criteria);
		} catch (Exception e) {
		}
		return null;
	}
	
	
	//查询总数量，为了分页
	public static Integer findnum(Class<?> cls){
		String hql="select count(*) from "+cls.getName();
		Long count=(Long) dao.getHibernateTemplate().find(hql).iterator().next();
		return count.intValue();
	}
	
	//查询单个
	@SuppressWarnings("unchecked")
	public static<T> T findone(Class<T> cls){
		DetachedCriteria criteria=DetachedCriteria.forClass(cls);
		try {
			return (T) dao.getHibernateTemplate().findByCriteria(criteria).get(0);
		} catch (Exception e) {
		}
		return null;
	}
	

	
	//分页查询
	@SuppressWarnings("unchecked")
	public static<T> List<T> findbypage(Class<T> cls,Integer page,Integer pagesize,String desc,String asc){
		DetachedCriteria criteria=DetachedCriteria.forClass(cls);
		if(desc!=null){
			criteria.addOrder(Order.desc(desc));
		}
		if(asc!=null){
			criteria.addOrder(Order.asc(asc));
		}
		return dao.getHibernateTemplate().findByCriteria(criteria,(page-1)*pagesize,pagesize);
	}
	
	@SuppressWarnings("unchecked")
	public static<T> List<T> findbypage(Class<T> cls,Integer page,Integer pagesize){
		DetachedCriteria criteria=DetachedCriteria.forClass(cls);
		criteria.addOrder(Order.desc("id"));
		return dao.getHibernateTemplate().findByCriteria(criteria,(page-1)*pagesize,pagesize);
	}
	
	@SuppressWarnings("unchecked")
	public static<T> List<T> findbypage1(Class<T> cls,Integer page,Integer pagesize,String desc){
		DetachedCriteria criteria=DetachedCriteria.forClass(cls);
		criteria.addOrder(Order.desc(desc));
		return dao.getHibernateTemplate().findByCriteria(criteria,(page-1)*pagesize,pagesize);
	}
	
	@SuppressWarnings("unchecked")
	public static<T> List<T> findall(Class<T> cls,String desc,String asc) {
		DetachedCriteria criteria=DetachedCriteria.forClass(cls);
		if(desc!=null){
			criteria.addOrder(Order.desc(desc));
		}
		if(asc!=null){
			criteria.addOrder(Order.asc(asc));
		}
		return dao.getHibernateTemplate().findByCriteria(criteria);
	}
	
	public static<T> List<T> findall(Class<T> cls){
		return findall(cls,null,"id");
	}
	public static<T> List<T> findall1(Class<T> cls){
		return findall(cls,"id",null);
	}

	public  static Object findbyname(Object o, String name) {
		DetachedCriteria criteria = DetachedCriteria.forClass(o.getClass());
		Field f;
		try {
			f = o.getClass().getDeclaredField(name);
			f.setAccessible(true);
			try {
				criteria.add(Restrictions.eq(name, f.get(o)));
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<Object> objects = dao.getHibernateTemplate().findByCriteria(
				criteria);
		if (objects.size() > 0) {
			return objects.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public static<T> List<T> findbypageorderbyid(Class<T> cls,Integer page, Integer size) {
		String hql="from "+cls.getName()+" order by id desc";
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<T> list=query.list();
		session.close();
		return list;
	}
	//搜索文章标题
	@SuppressWarnings("unchecked")
	public static List<Article> searchtitle(String name1,String name2) {
		DetachedCriteria criteria=DetachedCriteria.forClass(Sb.class);
		criteria.add(Restrictions.like(name1, name2,MatchMode.ANYWHERE));
		criteria.add(Restrictions.eq("state", 0));
		criteria.addOrder(Order.desc("id"));
		try {
			return  dao.getHibernateTemplate().findByCriteria(criteria);
		} catch (Exception e) {
		}
		return null;
	}
	//搜索商标编号
	@SuppressWarnings("unchecked")
	public static List<Sb> searchbiaohao(String keyword) {
		String hql="from Sb where biaohao like ?";
		keyword = "%"+keyword+"%";
		try {
			return dao.getHibernateTemplate().find(hql,keyword);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	//搜索商标标题
	@SuppressWarnings("unchecked")
	public static List<Sb> searchbiaohao1(String keyword) {
		String hql="from Sb where title like ?";
		keyword = "%"+keyword+"%";
		try {
			return dao.getHibernateTemplate().find(hql,keyword);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	//搜索业务标题
	@SuppressWarnings("unchecked")
	public static List<Yewu> sousuostring(String keyword) {
		String hql="from Yewu where biaoti like ?";
		keyword = "%"+keyword+"%";
		try {
			return dao.getHibernateTemplate().find(hql,keyword);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	//两个模糊查询
	@SuppressWarnings("unchecked")
	public static<T> List<Sb> findby2mohu(String name,String name1,String name2,Integer name3){
		DetachedCriteria criteria=DetachedCriteria.forClass(Sb.class);
		criteria.add(Restrictions.or(Restrictions.like(name, name2,MatchMode.ANYWHERE), Restrictions.like(name1, name2,MatchMode.ANYWHERE)));
		criteria.add(Restrictions.eq("fenleiid", name3));
		criteria.addOrder(Order.desc("id"));
		try {
			return  dao.getHibernateTemplate().findByCriteria(criteria);
		} catch (Exception e) {
		}
		return null;
	}
	
	//分类模糊
	@SuppressWarnings("unchecked")
	public static List<Sbfenlei> sousuostring1(String keyword) {
		String hql="from Sbfenlei where name like ?";
		keyword = "%"+keyword+"%";
		try {
			return dao.getHibernateTemplate().find(hql,keyword);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	//按两个条件查询
	@SuppressWarnings("unchecked")
	public static<T> List<T> findbytwo(Class<T> cls,String name,String name1,Integer value,Integer value1){
		DetachedCriteria criteria=DetachedCriteria.forClass(cls);
		criteria.add(Restrictions.eq(name, value));
		criteria.add(Restrictions.eq(name1, value1));
		criteria.addOrder(Order.desc("id"));
		try {
			return  dao.getHibernateTemplate().findByCriteria(criteria);
		} catch (Exception e) {
		}
		return null;
	}
	

	
	

}
