package dao;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import pojo.Order2;
import pojo.Post;
import pojo.Product;

public class ProductDAO extends DAO{
	//查询这个分类下的所有商品
	public static List<Product> findbyclassify(Integer typeId){
		DetachedCriteria criteria=DetachedCriteria.forClass(Product.class);
		criteria.add(Restrictions.eq("typeId", typeId));
		criteria.add(Restrictions.eq("isUp", 1));
		criteria.addOrder(Order.desc("id"));
		try {
			return  dao.getHibernateTemplate().findByCriteria(criteria);
		} catch (Exception e) {
		}
		return null;
	}
	//查询所有推荐商品
	public static List<Product> findbytuijian(){
		DetachedCriteria criteria=DetachedCriteria.forClass(Product.class);
		criteria.add(Restrictions.eq("tuiJian", 1));
		criteria.add(Restrictions.eq("isUp", 1));
		criteria.addOrder(Order.desc("id"));
		try {
			return  dao.getHibernateTemplate().findByCriteria(criteria);
		} catch (Exception e) {
		}
		return null;
	}

	//搜索商品
	public static List<Product> sousuo(String keyword) {
		String hql="from Product where title like ? order by id desc";
		return dao.getHibernateTemplate().find(hql,keyword);
	}
	
	
	//按状态查询商品总数量，为了分页
	public static Integer findnumbystatus(Class<?> cls ,Integer status){
		String hql="select count(*) from "+cls.getName()+" where status="+status;
		Long count=(Long) dao.getHibernateTemplate().find(hql).iterator().next();
		return count.intValue();
	}
	
	//按状态查询数据
	public static<T> List<T> findByPageOrderByIdStatus(Class<T> cls,Integer page, Integer size ,Integer status) {
		String hql="from "+cls.getName()+" where status="+status+" order by id desc";
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<T> list=query.list();
		session.close();
		return list;
	}
	
	//按购买量查询数据
	public static<T> List<T> findByPageOrderBybuyNum(Class<T> cls,Integer page, Integer size) {
		String hql="from "+cls.getName()+" where isUp= 1 order by buyNum desc";
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<T> list=query.list();
		session.close();
		return list;
	}
	//按ID倒叙查询数据
	public static<T> List<T> findByPageOrderByid(Class<T> cls,Integer page, Integer size) {
		String hql="from "+cls.getName()+" where isUp= 1 order by id desc";
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<T> list=query.list();
		session.close();
		return list;
	}
	
	public static List<Product> findByKeyPageOrder(String keyName,
			String keyContent,String orderName, Integer page, Integer size) {
		String hql="from Product where "+keyName+" like ? order by "+orderName;
		Session session=dao.getSessionFactory().openSession();
		Query query=session.createQuery(hql);
		query.setString(0, keyContent);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<Product> list=query.list();
		session.close();
		return list;
	}
	
	
	
	@SuppressWarnings("unchecked")
	public static List<Product> findByKey(String keyName, String keyContent) {
		String hql="from Product where "+keyName+" like ?";
		Session session=dao.getSessionFactory().openSession();
		Query query=session.createQuery(hql);
		query.setString(0, keyContent);
		List<Product> list=query.list();
		session.close();
		return list;
	}

	@SuppressWarnings("unchecked")
	public static List<Product> findByTop() {
		String hql="from Product where isTop=1 order by topTime desc";
		return dao.getHibernateTemplate().find(hql);
	}

	@SuppressWarnings("unchecked")
	public static<T> List<T> findByPageOrderById(Class<T> cls,Integer page, Integer size) {
		String hql="from "+cls.getName()+" order by id desc";
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<T> list=query.list();
		session.close();
		return list;
	}

	@SuppressWarnings("unchecked")
	public static<T> List<T> findAllByPageOderByTime(Class<T> cls,Integer page, Integer size) {
		String hql="from "+cls.getName()+" order by time desc";
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<T> list=query.list();
		session.close();
		return list;
	}

	@SuppressWarnings("unchecked")
	public static Integer findJudgeNum() {
		String hql="from Product where isJudge=1";
		List<Product> list=dao.getHibernateTemplate().find(hql);
		return list.size();
	}

	@SuppressWarnings("unchecked")
	public static List<Product> findJudgeOrderById(Integer page, Integer size) {
		String hql="from Product where isJudge=1 order by id";
		Session session=dao.getSessionFactory().openSession();
		Query query=session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<Product> list=query.list();
		session.close();
		return list;
	}

	@SuppressWarnings("unchecked")
	public static List<Product> findMyProduct(Integer id) {
		String hql="from Product where teamId=?";
		return dao.getHibernateTemplate().find(hql,id);
	}

	@SuppressWarnings("unchecked")
	public static List<Product> search1(String keyword) {
		String hql="from Product where concat(title,miaoshu) like ? and isUp=1";
		return dao.getHibernateTemplate().find(hql,keyword);
	}

	@SuppressWarnings("unchecked")
	public static List<Product> search2(String keyword, Integer mijinMin,
			Integer mijinMax, Integer gaoduMin, Integer gaoduMax,
			Integer guanfuMin, Integer guanfuMax, Integer dijinMin,
			Integer dijinMax) {
		DetachedCriteria criteria=DetachedCriteria.forClass(Product.class);
		Disjunction disj=Restrictions.disjunction();
		disj.add(Restrictions.like("code", keyword, MatchMode.ANYWHERE).ignoreCase());
		disj.add(Restrictions.like("title", keyword, MatchMode.ANYWHERE).ignoreCase());
		disj.add(Restrictions.like("miaoshu", keyword, MatchMode.ANYWHERE).ignoreCase());
		criteria.add(disj);
		if(mijinMin>=0&&mijinMax>0&&mijinMax>=mijinMin){
			criteria.add(Restrictions.between("mijin", mijinMin,mijinMax));
		}
		if(gaoduMin>=0&&gaoduMax>0&&gaoduMax>=gaoduMin){
			criteria.add(Restrictions.between("gaodu", gaoduMin,gaoduMax));
		}
		if(guanfuMin>=0&&guanfuMax>0&&guanfuMax>=guanfuMin){
			criteria.add(Restrictions.between("guanfu", guanfuMin,guanfuMax));
		}
		if(dijinMin>=0&&dijinMax>0&&dijinMax>=dijinMin){
			criteria.add(Restrictions.between("dijin", dijinMin, dijinMax));
		}
		criteria.add(Restrictions.eq("isActive",1));
		return dao.getHibernateTemplate().findByCriteria(criteria);
	}

	@SuppressWarnings("unchecked")
	public static List<Product> findAllByPageOderByPrice(
			Integer page, Integer size) {
		String hql="from Product where isActive=1 order by price";
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<Product> list=query.list();
		session.close();
		return list;
	}

	@SuppressWarnings("unchecked")
	public static List<Product> findMyProductByKey(Integer id, String keyword) {
		String hql="from Product where concat(code,title,miaoshu) like ? and teamId=?";
		Session session=dao.getSessionFactory().openSession();
		Query query=session.createQuery(hql);
		query.setString(0,keyword);
		query.setInteger(1,id);
		List<Product> list=query.list();
		session.close();
		return list;
	}

	@SuppressWarnings("unchecked")
	public static List<Product> findTheTeamProduct(Integer id) {
		String hql="from Product where teamId=?";
		return dao.getHibernateTemplate().find(hql,id);
	}
	
	@SuppressWarnings("unchecked")
	public static List<Product> findTheAdminProduct(Integer id) {
		String hql="from Product where adminId=?";
		return dao.getHibernateTemplate().find(hql,id);
	}

	@SuppressWarnings("unchecked")
	public static List<Product> findTheProductByKey(Integer tid, String keyword) {
		String hql="from Product where concat(code,title,miaoshu) like ? and teamId=? and isActive=1";
		Session session=dao.getSessionFactory().openSession();
		Query query=session.createQuery(hql);
		query.setString(0,keyword);
		query.setInteger(1,tid);
		List<Product> list=query.list();
		session.close();
		return list;
	}

	@SuppressWarnings("unchecked")
	public static List<Product> findAdminProductByPage(Integer id,Integer page,Integer size) {
		String hql="from Product where adminId=? order by time desc";
		Session session=dao.getSessionFactory().openSession();
		Query query=session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		query.setInteger(0,id);
		List<Product> list=query.list();
		return list;
	}

	public static Integer findAdminProductNum(Integer adminId) {
		String hql="from Product where adminId=?";
		return dao.getHibernateTemplate().find(hql,adminId).size();
	}

	public static Integer findTeamProductNum(Integer teamId) {
		String hql="from Product where teamId=?";
		return dao.getHibernateTemplate().find(hql,teamId).size();
	}

	@SuppressWarnings("unchecked")
	public static List<Product> findTeamProductByPage(Integer id,
			Integer page, Integer size) {
		String hql="from Product where teamId=? order by time desc";
		Session session=dao.getSessionFactory().openSession();
		Query query=session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		query.setInteger(0,id);
		List<Product> list=query.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public static List<Product> search3(String title, String code,
			String province, String city, Integer mijinMin, Integer mijinMax,
			Integer gaoduMin, Integer gaoduMax, Integer guanfuMin,
			Integer guanfuMax, Integer dijinMin, Integer dijinMax) {
		DetachedCriteria criteria=DetachedCriteria.forClass(Product.class);
		if(!title.equals(""))
		criteria.add(Restrictions.like("title", title,MatchMode.ANYWHERE).ignoreCase());
		if(!code.equals(""))
		criteria.add(Restrictions.like("code", code,MatchMode.ANYWHERE).ignoreCase());
		if(!province.equals(""))
		criteria.add(Restrictions.like("province", province,MatchMode.ANYWHERE).ignoreCase());
		if(!city.equals(""))
		criteria.add(Restrictions.like("city", city,MatchMode.ANYWHERE).ignoreCase());
		if(mijinMin>=0&&mijinMax>0&&mijinMax>=mijinMin){
			criteria.add(Restrictions.between("mijin", mijinMin,mijinMax));
		}
		if(gaoduMin>=0&&gaoduMax>0&&gaoduMax>=gaoduMin){
			criteria.add(Restrictions.between("gaodu", gaoduMin,gaoduMax));
		}
		if(guanfuMin>=0&&guanfuMax>0&&guanfuMax>=guanfuMin){
			criteria.add(Restrictions.between("guanfu", guanfuMin,guanfuMax));
		}
		if(dijinMin>=0&&dijinMax>0&&dijinMax>=dijinMin){
			criteria.add(Restrictions.between("dijin", dijinMin, dijinMax));
		}
		return dao.getHibernateTemplate().findByCriteria(criteria);
	}

	@SuppressWarnings("unchecked")
	public static List<Product> findByPageOrderBySort(
			Integer page, Integer size, String sortKey, String sortOpt) {
		String hql="from Product where isTop=0 order by "+sortKey+" "+sortOpt;
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		List<Product> list=query.list();
		session.close();
		return list;
	}
//前台查找 需要 验证isUP字段
	@SuppressWarnings("unchecked")
	public static List<Product> findByStatus(Integer status, Integer page, Integer size) {
		String hql="from Product where status=? and isUp=1 order by time desc";
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		query.setInteger(0, status);
		List<Product> list=query.list();
		session.close();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public static List<Product> findByStatus(Integer status) {
		String hql="from Product where status=? and isUp=1 order by time desc";
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setInteger(0, status);
		List<Product> list=query.list();
		session.close();
		return list;
	}

	@SuppressWarnings("unchecked")
	public static List<Product> findByClassTuijian(Integer classifyId,Integer page, Integer size) {
		String hql="from Product where status=0 and tuiJian=1 and isUp=1 and typeId=? order by rank asc";
		Session session=dao.getSessionFactory().openSession();
		Query query= session.createQuery(hql);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		query.setInteger(0, classifyId);
		List<Product> list=query.list();
		session.close();
		return list;
	}

	@SuppressWarnings("unchecked")
	public static List<Product> findByClassify(Integer id) {
		String hql;
		if(id==-1){
			hql="from Product where isUp=1 and status=0 order by id desc";
			return dao.getHibernateTemplate().find(hql);
		}
		else{
			hql="from Product where isUp=1 and typeId=? and status=0 order by rank asc";
			return dao.getHibernateTemplate().find(hql,id);
		}
	}
	@SuppressWarnings("unchecked")
	public static List<Product> search2(String keyword, double minPrice,
			double maxPrice) {
		DetachedCriteria criteria=DetachedCriteria.forClass(Product.class);
		if(!keyword.equals(""))
		criteria.add(Restrictions.like("title", keyword,MatchMode.ANYWHERE).ignoreCase());
		if(minPrice>=0&&maxPrice>0&&maxPrice>=minPrice){
			criteria.add(Restrictions.between("price", minPrice, maxPrice));
		}
		criteria.add(Restrictions.eq("status", 0));
		return dao.getHibernateTemplate().findByCriteria(criteria);
	}
	
	@SuppressWarnings("unchecked")
	public static List<Product> findbytimestatus(String time1, String time2,
			Integer status) {
		String hql="from Product where time between ? and ? and status=? order by id desc";
		Session session=dao.getSessionFactory().openSession();
		Query query=session.createQuery(hql);
		query.setString(0,time1);
		query.setString(1, time2);
		query.setInteger(2, status);
		List<Product> list=query.list();
		session.close();
        return list;
	}
	
	@SuppressWarnings("unchecked")
	public static List<Product> findbytimestatus(String time1, String time2) {
		String hql="from Product where time between ? and ? order by id desc";
		Session session=dao.getSessionFactory().openSession();
		Query query=session.createQuery(hql);
		query.setString(0,time1);
		query.setString(1, time2);
		List<Product> list=query.list();
		session.close();
        return list;
	}
	public static void updateAttrIsUp(int id,int status) {
		String hql="update Product set isUp=? where id=?";
		Session session=dao.getSessionFactory().openSession();
		Query query=session.createQuery(hql);
		query.setInteger(0, status);
		query.setInteger(1, id);
		query.executeUpdate();
		session.close();
	}
	
	@SuppressWarnings("unchecked")
	public static List<Product> searchTitle(String keyword) {
		String hql="from Product where title like ?";
		return dao.getHibernateTemplate().find(hql,keyword);
	}

	@SuppressWarnings("unchecked")
	public static List<Product> findByClassifyBack(Integer id) {
		String hql;
		if(id==-1){
			hql="from Product where status=0 order by id desc";
			return dao.getHibernateTemplate().find(hql);
		}
		else{
			hql="from Product where typeId=? and status=0 order by rank asc";
			return dao.getHibernateTemplate().find(hql,id);
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public static List<Product> findByIsUp(Integer isUp) {
		String hql="from Product where isUp=? order by id desc";
		return dao.getHibernateTemplate().find(hql,isUp);
	}
	
	@SuppressWarnings("unchecked")
	public static List<Product> findAllOrderByNum() {
		String hql="from Product  order by buyNum desc";
		return dao.getHibernateTemplate().find(hql);
	}

}
