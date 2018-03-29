package dao;

import java.util.List;
import pojo.Banner;
public class BannerDAO extends DAO {
	public static int findLastId(){
		String hql="from Banner order by orderid desc";
		List<Banner> list=dao.getHibernateTemplate().find(hql);
		Banner b=null;
		if(list.size()>0){
			b=list.get(0);
		}
		return b.getOrderid();
	}
	public static List<Banner> findAllOrderByOid(){
		String hql="from Banner order by orderid asc";
		return dao.getHibernateTemplate().find(hql);
	}
	public static Banner findDelBanner(){
		String hql="from Banner where orderid=5";
		Banner b=null;
		List<Banner> list=dao.getHibernateTemplate().find(hql);
		try {
			b=list.get(0);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return b;
	}
}
