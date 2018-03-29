package dao;

import java.util.List;

import pojo.Talk;

public class TalkDAO extends DAO{
	@SuppressWarnings("unchecked")
	public static List<Talk> findByFidOrderByTime(Integer id) {
		String hql="from Talk where forumId=? order by time desc";
		return dao.getHibernateTemplate().find(hql,id);
	}

	@SuppressWarnings("unchecked")
	public static List<Integer> findMyTalk(Integer id) {
		String hql="select forumId from Talk where teamId=? group by forumId";
		return dao.getHibernateTemplate().find(hql,id);
	}

	public static List<Integer> findMyBack(Integer id) {
		String hql="select forumId from BackTalk where adminId=? group by forumId";
		return dao.getHibernateTemplate().find(hql,id);
	}
}
