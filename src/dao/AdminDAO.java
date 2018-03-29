package dao;

import java.util.List;

import pojo.Admin;
import pojo.Order1;
import pojo.Tongji;


public class AdminDAO extends DAO {

	public static Admin findbyname(String name) {
		List<Admin> admins=dao.getHibernateTemplate().find("from Admin where name=?",name);
		if(admins.size()>0){
			Admin admin=admins.get(0);
			return admin;
		}
		return null;
	}

	
	public static List<Tongji> findbytime2(String time1, String time2) {
		List<Tongji> tj = dao.getHibernateTemplate().find(
				"from Tongji where time between ? and ?  order by id desc",
				new String[] { time1, time2 });
		return tj;
	}
	
}
