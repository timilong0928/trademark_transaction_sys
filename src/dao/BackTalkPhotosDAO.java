package dao;

import java.util.List;
import pojo.BackTalk;

public class BackTalkPhotosDAO extends DAO{

	@SuppressWarnings("unchecked")
	public static List<BackTalk> findByTid(Integer id) {
		String hql="from BackTalk where talkId=?";
		return dao.getHibernateTemplate().find(hql,id);
	}

}
