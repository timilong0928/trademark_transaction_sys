package dao;
import java.util.List;

import pojo.Cart;

public class CartDAO extends DAO{

	@SuppressWarnings("unchecked")
	public static List<Cart> findByTeamId(Integer id) {
		String hql="from Cart where teamId=? order by id desc";
		return dao.getHibernateTemplate().find(hql,id);
	}
	
	public static List<Cart> findcart(Integer id,Integer pid) {
		String hql="from Cart where teamId="+id+" and pid="+pid;
		return dao.getHibernateTemplate().find(hql);
	}
	
	@SuppressWarnings("unchecked")
	public static List<Cart> findByxuanzhong(Integer id) {
		String hql="from Cart where teamId=? and xuanze =1 order by id desc";
		return dao.getHibernateTemplate().find(hql,id);
	}

}
