package dao;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import pojo.News;

public class NewsDAO extends DAO{

	@SuppressWarnings("unchecked")
	public static List<News> findByPageOderByTime(Integer page, Integer size) {
		String hql="from News order by time desc";
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<News> list=query.list();
		session.close();
		return list;
	}
	

}
