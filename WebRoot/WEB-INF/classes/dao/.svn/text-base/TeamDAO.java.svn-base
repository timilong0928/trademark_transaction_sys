package dao;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import pojo.Admin;
import pojo.Product;
import pojo.Team;

public class TeamDAO extends DAO {
	
	public static Team findbysellerid(String sellerid) {
		// TODO Auto-generated method stub
		List<Team> teams=dao.getHibernateTemplate().find("from Team where openid=? ",sellerid);
		
		if(teams.size()>0){
			Team team=teams.get(0);
			return team;
		}
		return null;
	}
	
	//按状态查询数据
	@SuppressWarnings("unchecked")
	public static List<Team> findbyzhuce() {
		String hql="from Team where phone is not null and phone <>0 order by id desc";
		List<Team> list = dao.getHibernateTemplate().find(hql);
		return list;
	}
	
	//今日未签到的用户修改连续签到字段
	public static void sign1(){
		String hql="update Team set signDay =0 where signDay>0 and sign =0 ";
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.executeUpdate();
		session.close();
	}
	//今日已签到的用户重置签到功能
	public static void sign2(){
		String hql="update Team set sign =0 where sign>0";
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.executeUpdate();
		session.close();
	}
	
	
	//按openid查询用户
	public static  Team findbyopenid(String openid) {
		
		List<Team> teams=dao.getHibernateTemplate().find("from Team where openId=? ",openid);
		if(teams.size()>0){
			Team team=teams.get(0);
			return team;
		}
		return null;
	}
	
	//按状态查询商品总数量，为了分页
	public static Integer findnumbystatus(Class<?> cls ,Integer member){
		String hql="select count(*) from "+cls.getName()+" where memberdj ="+member;
		Long count=(Long) dao.getHibernateTemplate().find(hql).iterator().next();
		return count.intValue();
	}
	
	//按状态查询数据
	@SuppressWarnings("unchecked")
	public static<T> List<T> findByPageOrderByIdStatus(Class<T> cls,Integer page, Integer size ) {
		String hql = null;
		
		hql = "from "+cls.getName()+" order by id desc";
		
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<T> list=query.list();
		session.close();
		return list;
	}
	
	//按状上级的id查询有多少下级
	public static Integer findnumbycompanyId(Class<?> cls ,Integer companyId){
		String hql="select count(*) from "+cls.getName()+" where companyId ="+companyId;
		Long count=(Long) dao.getHibernateTemplate().find(hql).iterator().next();
		return count.intValue();
	}
	
	//按状态查询数据
	@SuppressWarnings("unchecked")
	public static<T> List<T> findBycompanyId(Integer companyId) {
		String hql="from Team where companyId="+companyId+" order by id desc";
		List<T> list = dao.getHibernateTemplate().find(hql);
		return list;
	}
	
	
	
	//按id查询所有下级数据
	@SuppressWarnings("unchecked")
	public static<T> List<T> findByPageOrderById(Class<T> cls,Integer page, Integer size ,Integer id) {
		String hql =  "from "+cls.getName()+" where companyId="+id+" order by id desc";
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<T> list=query.list();
		session.close();
		return list;
	}
	
	public static List<Team> findAll() {  
       
        return dao.getHibernateTemplate().find("from Team");  
    }  
	

	@SuppressWarnings("unchecked")
	public static  List<Team> findbytime(String time1, String time2) {

		List<Team> teams=dao.getHibernateTemplate().find("from Team where regTime between ? and ?  ",new String[]{time1,time2});
		return teams;

	}
	@SuppressWarnings("unchecked")
	public static List<Team> findcomteam(Integer companyId,Integer isJudge){
		DetachedCriteria criteria=DetachedCriteria.forClass(Team.class);
		criteria.add(Restrictions.eq("companyId", companyId));
		criteria.add(Restrictions.eq("isJudge", isJudge));
		try {
			return  dao.getHibernateTemplate().findByCriteria(criteria);
		} catch (Exception e) {
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public static Team findByUserName(String name){
		String hql="from Team where userName=?";
		List<Team> list=dao.getHibernateTemplate().find(hql,name);
		Team t=null;
		if(list.size()>0){
			t=list.get(0);
		}
		return t;
	}

	@SuppressWarnings("unchecked")
	public static Team findByEmail(String name){
		String hql="from Team where email=?";
		List<Team> list=(List<Team>)dao.getHibernateTemplate().find(hql,name);
		if(list.size()>0)
			return list.get(0);
		else
			return null;
	}

	@SuppressWarnings("unchecked")
	public static Team findByPhone(String userName) {
		String hql="from Team where phone=?";
		List<Team> list=(List<Team>)dao.getHibernateTemplate().find(hql,userName);
		if(list.size()>0)
			return list.get(0);
		else
			return null;
	}

	@SuppressWarnings("unchecked")
	public static List<Team> findByKey(String keyName, String keyContent) {
		String hql="from Team where "+keyName+" like ?";
		Session session=dao.getSessionFactory().openSession();
		Query query=session.createQuery(hql);
		query.setString(0, keyContent);
		List<Team> list=query.list();
		session.close();
		return list;
	}

	@SuppressWarnings("unchecked")
	public static List<Team> findByKeyPage(String keyName, String keyContent,
			Integer page, Integer size) {
		String hql="from Team where "+keyName+" like ?";
		Session session=dao.getSessionFactory().openSession();
		Query query=session.createQuery(hql);
		query.setString(0, keyContent);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<Team> list=query.list();
		session.close();
		return list;
	}

	@SuppressWarnings("unchecked")
	public static Integer findJudgeNum() {
		String hql="from Team where isJudge=1";
		List<Team> list=dao.getHibernateTemplate().find(hql);
		return list.size();
	}

	@SuppressWarnings("unchecked")
	public static List<Team> findJudgeOrderById(Integer size, Integer page) {
		String hql="from Team where isJudge=1 order by id";
		Session session=dao.getSessionFactory().openSession();
		Query query=session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<Team> list=query.list();
		session.close();
		return list;
	}

	@SuppressWarnings("unchecked")
	public static Team findByNickName(String nickName) {
		String hql="from Team where nickName=?";
		List<Team> list=dao.getHibernateTemplate().find(hql,nickName);
		if(list.size()>0)
			return list.get(0);
		else
			return null;
	}

	@SuppressWarnings("unchecked")
	public static List<Team> search3(String phone, String nickName,
			Integer tType, String province, String city) {
		
		DetachedCriteria criteria=DetachedCriteria.forClass(Team.class);
		
		if(!phone.equals(""))
			criteria.add(Restrictions.like("phone", phone,MatchMode.ANYWHERE).ignoreCase());
		
		if(!nickName.equals(""))
			criteria.add(Restrictions.like("nickName", nickName,MatchMode.ANYWHERE).ignoreCase());
		if(tType!=0)
			criteria.add(Restrictions.eq("tType", tType));
		if(!province.equals(""))
			criteria.add(Restrictions.like("province", province,MatchMode.ANYWHERE).ignoreCase());
		if(!city.equals(""))
			criteria.add(Restrictions.like("city", city,MatchMode.ANYWHERE).ignoreCase());

		return dao.getHibernateTemplate().findByCriteria(criteria);
	}

	public static Team findByOpenid(String openId) {
		List<Team> teams=dao.getHibernateTemplate().find("from Team where openId=? ",openId);
		if(teams.size()>0){
			Team team=teams.get(0);
			return team;
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public static List<Team> searchnickName(String keyword) {
		String hql="from Team where nickName like ?";
		return dao.getHibernateTemplate().find(hql,keyword);
	}
	
	@SuppressWarnings("unchecked")
	public static List<Team> searchPhone(String keyword) {
		String hql="from Team where phone like ?";
		return dao.getHibernateTemplate().find(hql,keyword);
	}
	
	//查找所有下级
	@SuppressWarnings("unchecked")
	public static<T> T findyijiId(Class<Team> class1,Integer yijiId){
		DetachedCriteria criteria=DetachedCriteria.forClass(class1);
		criteria.add(Restrictions.eq("yijiId", yijiId));
		try {
			return (T) dao.getHibernateTemplate().findByCriteria(criteria);
		} catch (Exception e) {
		}
		return null;
	}
	//查找所有上级
	@SuppressWarnings("unchecked")
	public static<T> T finderjiId(Class<Team> class1,Integer erjiId){
		DetachedCriteria criteria=DetachedCriteria.forClass(class1);
		criteria.add(Restrictions.eq("erjiId", erjiId));
		try {
			return (T) dao.getHibernateTemplate().findByCriteria(criteria);
		} catch (Exception e) {
		}
		return null;
	}
	
	//查找所有上下级
	@SuppressWarnings("unchecked")
	public static<T> T findallxiaji(Class<Team> class1,Integer xiajiId){
		DetachedCriteria criteria=DetachedCriteria.forClass(class1);
		criteria.add(Restrictions.eq("yijiId", xiajiId));
		try {
			return (T) dao.getHibernateTemplate().findByCriteria(criteria);
		} catch (Exception e) {
		}
		return null;
	}
	
	
	/**
	 * 通过companyId==id找到所有该id的下级
	 * @param id
	 * @return
	 */
	public static List<Team> findByid(Integer id) {
		List<Team> teams=dao.getHibernateTemplate().find("from Team where companyid=? ",id);
		if(teams.size()>0){
			return teams;
		}
		return null;
	}
	
	/**
	 * 通过Id==id找到该id的商品
	 * @param id
	 * @return
	 */
	public static Team findByteamidone(Integer id) {
		List<Team> teams=dao.getHibernateTemplate().find("from Team where id=? ",id);
		if(teams.size()>0){
			Team team=teams.get(0);
			return team;
		}
		return null;
	}

	/**
	 * 根据id删除相应的数据Team
	 * @param id
	 * @return
	 */
	public static void toDeleteById(Integer id){
		DAO.deletebyid(Team.class, id);

	}

	public static void updateMemberdj(Integer id, Integer memberdj) {
		Session session = dao.getHibernateTemplate().getSessionFactory().openSession();
		
		String hql = "update Team  set memberdj=memberdj where id=id";
		Query query = session.createQuery(hql);
		query.setInteger("memberdj", memberdj);
		query.setInteger("id", id);
		query.executeUpdate();
		System.out.println(query);
		
		session.close();
		
	}

	


}
