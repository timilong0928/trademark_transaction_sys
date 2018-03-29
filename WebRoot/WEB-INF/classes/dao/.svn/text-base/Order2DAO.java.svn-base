package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import pojo.Order1;
import pojo.Order2;
import pojo.Team;


/**
 * 商品订单 
 */
public class Order2DAO extends DAO {
	//按时间搜索
	public static List<Order2> findbytime1(String time1, String time2,Integer type) {
		DetachedCriteria criteria=DetachedCriteria.forClass(Order2.class);
		
		if(type!=null)
			criteria.add(Restrictions.eq("type", type));
		
		criteria.add(Restrictions.between("time", time1, time2));
		
		criteria.addOrder(Order.desc("id"));
		return dao.getHibernateTemplate().findByCriteria(criteria);
	}
	
	
	//查询总数量，为了分页
	public static Integer order2num(Integer type){
		String hql;
		if(type!=null){
			hql="select count(*) from Order2 where status="+type;
			
		}else{
			hql="select count(*) from Order2 ";
			
		}
			
		
		
		Long count=(Long) dao.getHibernateTemplate().find(hql).iterator().next();
		return count.intValue();
	}
	//根据总数量分页查询订单
	public static List<Order2> findorder2bypage(Integer type,Integer page,Integer pagesize){
		DetachedCriteria criteria=DetachedCriteria.forClass(Order2.class);
		if(type!=null){
			criteria.add(Restrictions.eq("status", type));
			criteria.addOrder(Order.desc("id"));
			
		}else{
			
			DAO dao=new DAO();
			return	dao.findall1(Order2.class);
		}
		
		return dao.getHibernateTemplate().findByCriteria(criteria,(page-1)*pagesize,pagesize);
	}

	//按状态查询数据
	@SuppressWarnings("unchecked")
	public static<T> List<T> findByPageOrderByIdStatus(Class<T> cls,Integer page, Integer size ) {
		String hql = null;
		
		hql = "from "+cls.getName()+" order by id desc";
		
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<T> list=query.list();
		session.close();
		return list;
	}
	
	//计算某个字段总合 fhStatus！=0
	public static Double findhe(String name) {
		String hql = "";
		
			hql="select SUM("+name+") from Order2 where status = 1";
		
		Double count= (Double) dao.getHibernateTemplate().find(hql).listIterator().next();
		if(count==null){
			return 0.0;
		}
		return count;
	}
	
	//查询我的订单
	public static List<Order2> findmyorder(Integer teamId) {
		
		DetachedCriteria criteria=DetachedCriteria.forClass(Order2.class);
		criteria.add(Restrictions.eq("teamId", teamId));
		criteria.add(Restrictions.eq("fhStatus", 1));
		criteria.addOrder(Order.desc("id"));
		try {
			return  dao.getHibernateTemplate().findByCriteria(criteria);
		} catch (Exception e) {
		}
		return null;
	}
	
	
	
	
	
	//搜索订单
	public static List<Order2> sousuoOrder2ByOid(String keyword) {
		String hql="from Order2 where oid = ? order by id desc";
		return dao.getHibernateTemplate().find(hql,keyword);
	}
	
	
	/**
	 * 通过订单ID查找
	 */
	public static Order2 find(String oid) {
		System.out.println(oid);
		List<Order2> orders = dao.getHibernateTemplate().find(
				"from Order2 where oid=?", oid);
		if (orders.size() > 0) {
			Order2 order = orders.get(0);
			return order;
		}
		return null;
	}

	
	public static List<Order2> findfour() {
		int rowsPerPage = 4;
		DetachedCriteria criteria = DetachedCriteria.forClass(Order2.class);
		List<Order2> orders = dao.getHibernateTemplate().findByCriteria(
				criteria, 0, rowsPerPage);

		return orders;

	}

	/**
	 * 通过时间和状态查找,后端用
	 */
	public static List<Order2> findbytimestatus(String time1, String time2,
			String status) {
		List<Order2> orders = dao
				.getHibernateTemplate()
				.find(
						"from Order2 where time1 between ? and ? and status=? order by id desc",
						new String[] { time1, time2, status });
		return orders;

	}
	/**
	 * 查找所有,后端用
	 */
	public static int findallpage() {
		String hql = "select count(*) from Order2 ";

		Long count = (Long) dao.getHibernateTemplate().find(hql).listIterator()
				.next();
		System.out.println(count);
		int count1 = count.intValue();
		int pageSize = 20;
		if (count1 % pageSize == 0) {
			return count1 / pageSize;
		} else {
			return count1 / pageSize + 1;
		}

	}


}
