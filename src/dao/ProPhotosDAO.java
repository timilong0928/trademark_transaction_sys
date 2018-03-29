package dao;

import java.util.List;

import pojo.ProPhoto;

public class ProPhotosDAO extends DAO{

	@SuppressWarnings("unchecked")
	public static List<ProPhoto> findByPid(Integer id) {
		String hql="from ProPhoto where pid=?";
		return dao.getHibernateTemplate().find(hql,id);
	}

}
