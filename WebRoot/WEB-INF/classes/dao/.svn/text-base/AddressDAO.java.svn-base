package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import pojo.Address;

public class AddressDAO extends DAO {
	public static List<Address> findByUid(int id){
		DetachedCriteria criteria=DetachedCriteria.forClass(Address.class);
		criteria.add(Restrictions.eq("userId",id));
		criteria.addOrder(Order.desc("id"));
		return dao.getHibernateTemplate().findByCriteria(criteria);
	}

	public static void resetByUid(Integer id) {
		String hql="update Address set isMoren=0 where userId=?";
		Session session=dao.getSessionFactory().openSession();
		Query query=session.createQuery(hql);
		query.setInteger(0,id);
		query.executeUpdate();
		session.close();
	}
}
