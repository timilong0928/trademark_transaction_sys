package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import pojo.PayRecord;
import pojo.TeamAward;

public class TeamAwardDAO extends DAO {
	
	//按状态查询消费记录
	public static List<PayRecord> myPayRecord(Integer teamid, Integer style){
		DetachedCriteria criteria=DetachedCriteria.forClass(PayRecord.class);
		if(teamid!=null)
			criteria.add(Restrictions.eq("teamid", teamid));
		
		criteria.add(Restrictions.eq("style", style));
		criteria.addOrder(Order.desc("id"));
		
		try {
			return  dao.getHibernateTemplate().findByCriteria(criteria);
		} catch (Exception e) {
		}
		return null;
	}
	
	//按状态查询消费记录
	public static List<TeamAward> myTeamAward(Integer teamId, Integer type){
		DetachedCriteria criteria=DetachedCriteria.forClass(TeamAward.class);
		criteria.add(Restrictions.eq("teamId", teamId));
		criteria.add(Restrictions.eq("type", type));
		criteria.addOrder(Order.desc("id"));
		
		try {
			return  dao.getHibernateTemplate().findByCriteria(criteria);
		} catch (Exception e) {
		}
		return null;
	}
			
	
	
	//分页查询该类型数据
	public static List<TeamAward> findpagebyteamid(Integer page, Integer size,Integer teamid) {
		String hql="from TeamAward where teamid = "+ teamid+" order by id desc";
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<TeamAward> list=query.list();
		session.close();
		return list;
	}
	

	//查询会员对应的课程订单
	public static List<PayRecord> findByTeamId(Integer teamId) {
		
		List<PayRecord> payRecords = dao.getHibernateTemplate().find(
				"from TeamAward where teamId="+teamId+" order by id desc");
		return payRecords;
	}
	
}	
