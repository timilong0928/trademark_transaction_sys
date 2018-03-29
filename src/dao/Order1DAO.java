package dao;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import pojo.Order1;
import pojo.Order2;
public class Order1DAO extends DAO {

	
	public static Order1 findmyorder1(Integer teamid , Integer courseid ) {
		
		DetachedCriteria criteria=DetachedCriteria.forClass(Order1.class);
		criteria.add(Restrictions.eq("teamid", teamid));
		criteria.add(Restrictions.eq("courseid", courseid));
		criteria.add(Restrictions.eq("status", 1));
		criteria.addOrder(Order.desc("id"));
		try {
			List<Order1> order1s =  dao.getHibernateTemplate().findByCriteria(criteria);
			if(order1s.size()>0)
				return order1s.get(0);
			
		} catch (Exception e) {
		}
		return null;
	}
	
	
	public static Order2 findmyorder2(Integer teamId ,Integer type, Integer typeid ) {
		
		DetachedCriteria criteria=DetachedCriteria.forClass(Order2.class);
		criteria.add(Restrictions.eq("teamId", teamId));
		criteria.add(Restrictions.eq("type", type));
		criteria.add(Restrictions.eq("typeid", typeid));
		criteria.add(Restrictions.eq("fhStatus", 1));
		criteria.addOrder(Order.desc("id"));
		try {
			List<Order2> order2s =  dao.getHibernateTemplate().findByCriteria(criteria);
			if(order2s.size()>0)
				return order2s.get(0);
			
		} catch (Exception e) {
		}
		return null;
	}
	
	
	
	
	@SuppressWarnings("unchecked")
	public static List<Order1> findByOid(String oid) {
		return dao.getHibernateTemplate().find("from Order1 where oid=?",oid);
	}
	
	public static List<Object[]> findByOidMenKan(String orderId) {
		String hql="select classifyId,sum(num*price) from Order1 where oid=? group by classifyId";
		Session session=dao.getSessionFactory().openSession();
		Query query=session.createQuery(hql);
		query.setString(0, orderId);
		List<Object[]> results = query.list();
		session.close();
		return results;
	}


}
