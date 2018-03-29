package dao;

import java.util.List;

import pojo.Order1;
import pojo.Order2;

public class TongjiDAO extends DAO {
	
	//查询Order2今日订单。按time模糊搜索
	public static List<Order2> tongji2(String time) {
		return dao.getHibernateTemplate().
		find("from Order2 where time1 like '%"+time+"%' and fhStatus !=0");
	}

}
