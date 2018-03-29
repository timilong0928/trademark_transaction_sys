package dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import pojo.Mylike;

public class MylikeDAO extends DAO {
	
	//查询是否有点赞,有则返回ID，没有返回0
	public static Integer findmylike(Integer teamid , Integer type ,Integer likeid) {
		
		DetachedCriteria criteria=DetachedCriteria.forClass(Mylike.class);
		criteria.add(Restrictions.eq("teamid", teamid));
		criteria.add(Restrictions.eq("type", type));
		criteria.add(Restrictions.eq("likeid", likeid));
		try {
			List<Mylike> list =  dao.getHibernateTemplate().findByCriteria(criteria);
			if(list.size()>0){
				return list.get(0).getId();
			}else{
				return 0;
			}
		} catch (Exception e) {
		}
		return 0;
	}

}
