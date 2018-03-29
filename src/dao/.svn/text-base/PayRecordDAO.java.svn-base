package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import pojo.Course;
import pojo.Order1;
import pojo.Order2;
import pojo.Order1;
import pojo.PayRecord;

public class PayRecordDAO extends DAO {
	

	
	
	//按会员ID查询课程订单总数量，为了分页
	public static Integer findnumbyteamid(Integer teamid){
		String hql="select count(*) from PayRecord where teamid = "+ teamid;
		Long count=(Long) dao.getHibernateTemplate().find(hql).iterator().next();
		return count.intValue();
	}
	
	//分页查询该类型数据
	public static List<PayRecord> findpagebyteamid(Integer page, Integer size,Integer teamid) {
		String hql="from PayRecord where teamid = "+ teamid+" order by time desc";
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<PayRecord> list=query.list();
		session.close();
		return list;
	}
	

	//查询会员对应的课程订单
	public static List<PayRecord> findByTeamId(Integer teamId) {
		
		List<PayRecord> payRecords = dao.getHibernateTemplate().find(
				"from PayRecord where teamId="+teamId+" order by time desc");
		return payRecords;
	}
	
}	
