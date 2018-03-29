package dao;

import java.util.List;

import pojo.TalPhoto;

public class TalPhotosDAO extends DAO{

	@SuppressWarnings("unchecked")
	public static List<TalPhoto> findByTid(Integer id) {
		String hql="from TalPhoto where tid=?";
		return dao.getHibernateTemplate().find(hql,id);
	}

}
