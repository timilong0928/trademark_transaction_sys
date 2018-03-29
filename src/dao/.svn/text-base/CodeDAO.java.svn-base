package dao;

import java.util.List;


import pojo.Code;


public class CodeDAO extends DAO {


	public static Code findbycode(String code) {
		List<Code> codes=dao.getHibernateTemplate().find("from Code where code=?",code);
		if(codes.size()>0){
			Code c=codes.get(0);
			return c;
		}
		return null;
	}

	
}
