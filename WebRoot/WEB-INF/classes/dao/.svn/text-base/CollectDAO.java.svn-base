package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import pojo.Collect;
import pojo.Mylike;
import pojo.PayRecord;
import pojo.Team;

public class CollectDAO extends DAO {
	
	//查询是否有收藏,有则返回ID，没有返回0
	public static Integer findmyCollect(Integer teamId ,Integer pid) {
		
		DetachedCriteria criteria=DetachedCriteria.forClass(Collect.class);
		criteria.add(Restrictions.eq("teamId", teamId));
		criteria.add(Restrictions.eq("pid", pid));
		try {
			List<Collect> list =  dao.getHibernateTemplate().findByCriteria(criteria);
			if(list.size()>0){
				return list.get(0).getId();
			}else{
				return 0;
			}
		} catch (Exception e) {
		}
		return 0;
	}

	
	
	//按会员ID收藏总数量，为了分页
	public static Integer findnumbyteamid(Integer teamid){
		String hql="select count(*) from Collect where teamid = "+ teamid;
		Long count=(Long) dao.getHibernateTemplate().find(hql).iterator().next();
		return count.intValue();
	}
	
	//分页查询该类型数据
	public static List<Collect> findpagebyteamid(Integer page, Integer size,Integer teamid) {
		String hql="from Collect where teamid = "+ teamid+" order by id desc";
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<Collect> list=query.list();
		session.close();
		return list;
	}

	//根据pid 和 teamid删除收藏数据
	public static void delete(Integer pid,Integer teamId,Integer type){
		List<Collect> collects = findCollectBypidAndteamid(Collect.class, pid, teamId,type);
		for(Collect c:collects){
			DAO.delete(c);
		}
	}
	

	
	public static<T> List<T> findCollectBypidAndteamid(Class<T> cls,Integer pid,Integer teamId,Integer type){
		DetachedCriteria criteria=DetachedCriteria.forClass(cls);
		criteria.add(Restrictions.eq("pid", pid));
		criteria.add(Restrictions.eq("teamId", teamId));
		criteria.add(Restrictions.eq("type", type));
		criteria.addOrder(Order.desc("time"));
		try {
			return  dao.getHibernateTemplate().findByCriteria(criteria);
		} catch (Exception e) {
		}
		return null;
	}
	

}
