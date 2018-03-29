package action;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import moban.WeixinPushMassage;

import org.apache.commons.collections.map.HashedMap;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFHeader;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import pojo.Admin;
import pojo.Award;
import pojo.Classify2;
import pojo.Collect;
import pojo.Comment;
import pojo.Content;
import pojo.Course;
import pojo.Order1;
import pojo.Peizhi;
import pojo.Post;
import pojo.Taocan;
import pojo.Team;
import pojo.TeamAward;
import pojo.TimeUtil;
import util.ImageUploadUtil;

import com.yx.pojo.AccessToken;
import com.yx.util.WeixinUtil;

import dao.CollectDAO;
import dao.CommentDAO;
import dao.CourseDao;
import dao.DAO;
import dao.Order1DAO;
import dao.TeamDAO;

public class CourseAction extends BaseAction {
	private List<Taocan> taocans;
	private Taocan taocan;
	
	private List<Course> courses; //课程集合
	private Course course;   //单个课程
	
	private List<Content> contents;//课程内容集合
	private Content content;//课程内容对象
	
	private List<Comment> comments;//评论
	private Comment comment;
	
	private List<Classify2> classify2s;
	private Classify2 classify2;
	
	private Integer teacherid;
	private Integer classify2id;
	private List<Admin> teachers;
	
	private List<Integer> courseids;
	
	private String key;//收索的类型
	private String keyword;//收索的内容
	
	private String fileFileName;//上架图片名
	private File file;//当前状态显示图片
	
	
	
	private Integer status;//判断课程状态
	private Admin teacher;
	
	private Integer type;//课程类型
	private Integer num;
	
	
	private List<Post> posts;//资讯
	private Order1 order1;
	private List<Order1> order1s;
	
	
	private Integer collectid;
	private String time1;
	private String time2;
	
	private int id1 =0;//是否 
	
	private Integer huifu ;//是否查询未回复消息
	
 	private List<Course> course0s;//活动课程
 	private List<Course> course1s;//免费课程
 	private List<Course> course2s;//付费课程
 	private String jsapi_ticket;
 	private Map<String, String> ret;
 	private Peizhi peizhi;
	
	
	
	//================================================前台部分===============================================
	
 	//搜索或者按分类选择
 	public String sousuo(){
 		peizhi = DAO.findbyid(Peizhi.class, 1);
		ret = new HashedMap();
		team = (Team)session.get("team");
		if(team==null){
			try {
				session.put("id1", id1);
				response.sendRedirect(wx_index_url);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "allcourse";
		}
		
		classify2s=DAO.findall(Classify2.class,null,"orderid");
		Integer classify2id =null;
		if(classify2!=null)
			classify2id = classify2.getId();
		
		if(classify2!=null)
			classify2id = classify2.getId();
		
		courses = CourseDao.findbyfufei(null,teacherid,classify2id,keyword);
		course0s = CourseDao.findbyfufei(-1,teacherid,classify2id,keyword);
		course1s = CourseDao.findbyfufei(0,teacherid,classify2id,keyword);
		course2s = CourseDao.findbyfufei(1,teacherid,classify2id,keyword);
		
		/*if(teacherid!=null&&teacherid>0)
			fenxiang("http://shangbiao18.xmyunxin.com/course!sousuo.action?teacherid="+teacherid+"&id1="+team.getId());
		else if(classify2id!=null&&classify2id>0)
			fenxiang("http://shangbiao18.xmyunxin.com/course!sousuo.action?classify2id="+classify2id+"&id1="+team.getId());
		else if(keyword!=null&&!"".equals(keyword))
			fenxiang("http://shangbiao18.xmyunxin.com/course!sousuo.action?keyword="+keyword+"&id1="+team.getId());
		else
			fenxiang("http://shangbiao18.xmyunxin.com/course!sousuo.action?keyword=&id1="+team.getId());*/
		
		return "allcourse";
	}
 	
 	
 	
 	
	//查看课程内容
	public String thecourse(){
		peizhi = DAO.findbyid(Peizhi.class, 1);
		ret = new HashedMap();
		team = (Team) session.get("team");
		if(team==null){
			if(id1>0){
				session.put("id1",id1);
				session.put("course", course);
			}
			try {
				response.sendRedirect(wx_thecourse_url);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "allcourse";
		}
		try {
			if(id1==0)
				id1=(Integer) session.get("id1");
		} catch (Exception e) {
			// TODO: handle exception
		}
		team = DAO.findbyid(Team.class,team.getId());
		
		//如果用户是通过他人分享来的。
		if(id1>0&&!team.getId().equals(id1)){
			Team shangji = DAO.findbyid(Team.class, id1);
			if(shangji!=null){
				//如果上级未注册则推荐无效，如果是自己推荐自己则无效，
				if(shangji.getPhone()!=null&&!"".equals(shangji.getPhone())){
				
					//第一次被人推荐进来的
					if(team.getYijiId()==0&&team.getRegTime().equals(TimeUtil.getStringShort())){
						team.setYijiId(shangji.getId());
						
						team.setYijiname(shangji.getNickName());
						
						DAO.update(team);
						
						//查询上级用户
						Team shangji1=DAO.findbyid(Team.class,team.getYijiId());
						
						if(shangji1!=null){
							try {
								WeixinPushMassage.zhuce(shangji1.getOpenId(), team.getNickName()+"（下级）");
							} catch (Exception e) {
								// TODO: handle exception
							}
						}
						
					}
				}
				
			}
		}
		
		if(course!=null){
			course = DAO.findbyid(Course.class,course.getId());
		}else{
			course = (Course) session.get("course");
			session.remove("course");
		}
		
		if(course==null){
			return sousuo();
		}
		course = DAO.findbyid(Course.class,course.getId());
		course.setReadNum(course.getReadNum()+1);
		
		DAO.update(course);
		
		//如果不可播放，则提示
		if(course.getStatus()==2){
			msg="该商品已下架";
			return sousuo();
		}
		//获取购买记录
		order1 = Order1DAO.findmyorder1(team.getId(), course.getId());
		Integer a =0;
		if(content!=null)
			a = content.getId();
		if(a==null){
			content=null;
		}
		if(content!=null&&content.getId()==0)
			content = null;
		
		//是否收藏
		collectid =CollectDAO.findmyCollect(team.getId(),course.getId());
		//获取当前显示的内容
		contents = CourseDao.thecontent1(course.getId());
		if(order1==null){
			//试看
			if(content!=null){
				content = DAO.findbyid(Content.class,content.getId());
				if(content.getIsTest()!=1)
					content = CourseDao.thecontent(course.getId());
			}else{
				content = CourseDao.thecontent(course.getId());
			}
		}else{
			//如果是选集进来的
			if(content!=null){
				content = DAO.findbyid(Content.class,content.getId());
				//保存现在所看到的章节
				if(content!=null)
					order1.setContentid(content.getId());
			}else{
				//目录进来的。获取上次观看的章节，或者
				content = DAO.findbyid(Content.class,order1.getContentid());
				//如果观看记录的ID无课时则自动选择第一个课程
				if(content==null){
					if(contents.size()>0){
						content=contents.get(0);
					}
				}
			}
		}
		
		
		//如果有课程可以播放，则显示当前课程的评论内容。如果没有则显示全部评论内容
		if(content!=null){
			//评论
			comments=CommentDAO.findcomment(null,null,content.getId(),null);
		}else{
			comments=CommentDAO.findcomment(null,course.getId(),null,null);
		}
		
		teacher = DAO.findbyid(Admin.class,course.getTeacherId());
		award = DAO.findbyid(Award.class, 1);
		
		fenxiang("http://shangbiao18.xmyunxin.com/course!thecourse.action?course.id="+course.getId()+"&content.id="+a+"&id1="+team.getId());
	    
		return "thecourse";
	}
	public String gothecourse(){
		loadOpenId();
		msg="";
		return thecourse();
	}
	
	
	//收藏商品
	public String shoucang(){
		team=(Team) session.get("team");
		if(team==null){
			return "json_msg";
		}
		course = DAO.findbyid(Course.class,course.getId());
		course.setCollectnum(course.getCollectnum()+1);
		DAO.update(course);
		Collect collect = new Collect(); 
		collect.setPid(course.getId());
		collect.setTeamId(team.getId());
		DAO.save(collect);
		
		msg=collect.getId().toString();
		return "json_msg";
	}
	
	//取消收藏商品
	public String deleteshoucang(){
		team=(Team) session.get("team");
		if(team==null){
			return "json_msg";
		}
		try {
			Collect collect = DAO.findbyid(Collect.class,collectid);
			course = DAO.findbyid(Course.class, collect.getPid());
			course.setCollectnum(course.getCollectnum()-1);
			DAO.deletebyid(Collect.class,collectid);
			msg="1";
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "json_msg";
	}
	
	
	
	//套餐详情
	public String totaocan(){
		peizhi = DAO.findbyid(Peizhi.class, 1);
		ret = new HashedMap();
		team = (Team) session.get("team");
		if(team==null){
			if(id1>0){
				session.put("id1",id1);
				session.put("taocan", taocan);
			}
			try {
				response.sendRedirect(wx_thetaocan_url);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "allcourse";
		}
		try {
			if(id1==0)
				id1=(Integer) session.get("id1");
			if(taocan==null)
				taocan = (Taocan) session.get("taocan");
		} catch (Exception e) {
			// TODO: handle exception
		}
		team = DAO.findbyid(Team.class,team.getId());
		
		//如果用户是通过他人分享来的。
		if(id1>0&&!team.getId().equals(id1)){
			Team shangji = DAO.findbyid(Team.class, id1);
			if(shangji!=null){
				//如果上级未注册则推荐无效，如果是自己推荐自己则无效，
				if(shangji.getPhone()!=null&&!"".equals(shangji.getPhone())){
				
					//第一次被人推荐进来的
					if(team.getYijiId()==0&&team.getRegTime().equals(TimeUtil.getStringShort())){
						team.setYijiId(shangji.getId());
						
						team.setYijiname(shangji.getNickName());
						
						DAO.update(team);
						session.put("team",team);
						//查询上级用户
						Team shangji1=DAO.findbyid(Team.class,team.getYijiId());
					
						if(shangji1!=null){
							try {
								WeixinPushMassage.zhuce(shangji1.getOpenId(), team.getNickName()+"（下级）");
							} catch (Exception e) {
								// TODO: handle exception
							}
						}
						
					}
				}
				
			}
		}
		
		
		taocan = DAO.findbyid(Taocan.class,taocan.getId());
		
		String[] ids = taocan.getCourseids().split(",");
		courses = new ArrayList<Course>();
		for(int i = 0;i<ids.length;i++){
			courses.add(DAO.findbyid(Course.class,Integer.valueOf(ids[i])));
		}
		taocan.setTaocancourses(courses);
		
		fenxiang("http://shangbiao18.xmyunxin.com/course!totaocan.action?taocan.id="+taocan.getId()+"&id1="+team.getId());
		
		
		return "totaocan";
	}
	
	
	void fenxiang(String url){
		//分享功能
		peizhi = DAO.findbyid(Peizhi.class,1);
		
		long time=0;
		try {
			time=team.getHctime();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		Date d=new Date();
		long date=d.getTime();
		long t=date-time;
		
		
		AccessToken at = null;
		if(t>=2*60*60*1000){
			System.err.println("超时，重新获取");
		    at = WeixinUtil.getAccessToken(peizhi.getAppid(), peizhi.getAppsecret());
			String url1="https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token="+at.getToken()+"&type=jsapi";   
	        JSONObject jsonObject1 = WeixinUtil.httpRequest(url1, "GET", null);
	        String ticket=(String) jsonObject1.get("ticket");
			jsapi_ticket = ticket;  
			team.setTicket(ticket);
			team.setHctime(date);
			DAO.update(team);
			session.put("team",team);
		}else{
			jsapi_ticket = team.getTicket();
		}
		
	    
	    Sign s=new Sign();
	    ret = s.sign(jsapi_ticket, url);
	    Map<String, String> ret = (Map<String, String>) request.getAttribute("ret");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//========================================================后台部分=====================================================
	
	//查询所有分类
	public String findClassify(){
		classify2s=DAO.findall(Classify2.class,null,"orderid");
		return "adminclassify2";
	}
	
	//修改分类
	public String updateClassify() throws IOException{
		//按ID查询数据
		Classify2 classify3=DAO.findbyid(Classify2.class,classify2.getId());
		//判断是否有修改图片
		if(file!=null){
			classify3.setImg(ImageUploadUtil.upload(file, fileFileName));
		}
		classify3.setName(classify2.getName());
		classify3.setOrderid(classify2.getOrderid());
		DAO.update(classify3);
		return findClassify();
	}
	//添加分类
	public String addClassify(){
		DAO.save(classify2);
		return findClassify();
	}
	//删除分类
	public String deleteClassify(){
		DAO.delete(classify2);
		return findClassify();
	}
	
	//查询所有课程
	public String findAllCourse(){
		admin = (Admin) session.get("admin");
		if(admin==null)
			return "findAllCourse";
		size=10;
		allpage = (CourseDao.findnumall(admin.getId(), classify2id, status)+size-1)/size;
		checkpage();
		courses = CourseDao.findall(admin.getId(), classify2id, status, size, page);
		
		classify2s=DAO.findall(Classify2.class,null,"orderid");
		if(admin.getQuanxian().equals("teacher")){
			teachers = new ArrayList<Admin>();
			teachers.add(admin);
		}else
			teachers = DAO.findbystring(Admin.class,"quanxian","teacher");
		
		return "findAllCourse";
	}
	
	
	
	
	
	
	
	
	
	
	//查询阅读量和购买量
	public String findAllCourse3(){
		size=10;
		num = (Integer)session.get("num");
		allpage = (DAO.findnum(Course.class)+size-1)/size;
		checkpage();
		if(num==1){
			courses=CourseDao.findByPageOrder(Course.class, page, size,"readNum");
		}else {
			courses=CourseDao.findByPageOrder(Course.class, page, size,"payNum");
		}
		return "findAllCourse";
	}
	

	//搜索查询课程
	public String searchTitleWord(){
		keyword = "%"+keyword+"%";
		courses = CourseDao.findByPageOrderByTitle(keyword);
		allpage = 1;
		checkpage();
		return "findAllCourse";
	}

	//根据id查看相应的课程
	public String toCourse(){
		course = DAO.findbyid(Course.class,course.getId());
		contents = CourseDao.thecontent1(course.getId());
		classify2 = DAO.findbyid(Classify2.class, course.getClassify2id());
		
		return "toCourse";
	}


	//添加课程页面
	public String toAddCourse(){
		//获取所有讲师数据
		classify2s=DAO.findall(Classify2.class,null,"orderid");
		admin=(Admin) session.get("admin");
		if(admin==null)
			return "toAddCourse";
		
		if(admin.getQuanxian().equals("teacher")){
			teachers = new ArrayList<Admin>();
			teachers.add(admin);
		}else
			teachers = DAO.findbystring(Admin.class,"quanxian","teacher");
		
		return "toAddCourse";
	}

	//添加课程，跳转到查询课程页面
	public String addCourse() throws IOException{
		try{
			if(file != null){//上架图
				course.setImg(ImageUploadUtil.upload(file, fileFileName));
			}
			
			if(course.getTeacherId()!=null){
				Admin t = DAO.findbyid(Admin.class, course.getTeacherId());
				course.setTeacher(t.getRname());
			}
			
			
			//活动商品
			if(course.getStatus()==1){
				course.setMoney(Math.round(course.getTwomoney()*100*0.8)/100.0);//暂时用0.8
			}else{
				course.setMoney(course.getTwomoney());
			}
			DAO.save(course);

		}catch(Exception e){
			e.printStackTrace();
			msg = "添加失败";
		}

		return findAllCourse();
	}

	

	//删除课程
	public String deletebyid(){
		if(ids!=null && ids.length>0){
			for(int i=0; i<ids.length; i++){
				List<Content> list = CourseDao.findContentsByCouresId(ids[i]);
				DAO.delete(list);
				DAO.deletebyid(Course.class, ids[i]);
			}
			
			msg = "删除成功";
		}else {
			msg = "未选中,删除失败";
		}

		return findAllCourse();
	}

	//跳转修改课程页面
	public String toUpdateCourse(){
		
		course = DAO.findbyid(Course.class, course.getId());
		
		classify2s=DAO.findall(Classify2.class,null,"orderid");
		admin = (Admin) session.get("admin");
		if(admin==null)
			return "toUpdateCourse";
		
		if(admin.getQuanxian().equals("teacher")){
			teachers = new ArrayList<Admin>();
			teachers.add(admin);
		}else
			teachers = DAO.findbystring(Admin.class,"quanxian","teacher");
		
		return "toUpdateCourse";
	}

	//修改课程
	public String updateById(){
		Course c = DAO.findbyid(Course.class, course.getId());
		if(file !=null){
			course.setImg(ImageUploadUtil.upload(file, fileFileName));
		}else {
			course.setImg(c.getImg());
		}
		
		//活动商品
		if(course.getStatus()==1){
			course.setMoney(Math.round(course.getTwomoney()*100*0.8)/100.0);//暂时用0.8
		}else{
			course.setMoney(course.getTwomoney());
		}
		
		try {
			if(course.getTeacherId()!=null){
				Admin t = DAO.findbyid(Admin.class, course.getTeacherId());
				System.err.println(t);
				course.setTeacher(t.getRname());
			}
			DAO.update(course);
			msg = "更新成功";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "更新失败";
		}
		
		return findAllCourse();
	}
	
	
	
	
	//============================================评论管理==========================================
	
	//查看所有评论
	public String allcomment(){
		admin = (Admin) session.get("admin");
		if(admin==null)
			return "allcomment";
		size=10;
		allpage = (CommentDAO.findcommentnum(admin.getId(),huifu)+size-1)/size;
		checkpage();
		comments=CommentDAO.findbycommentpage(admin.getId(),huifu, page, size);
		
		key="all";
		
		return "allcomment";
	}
	
	//删除评论
	public String deletecommentbyid() {
		if(ids!=null&&ids.length>0){
			for (int i = 0; i < ids.length; i++) {
				try {
					DAO.deletebyid(Comment.class, ids[i]);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			msg ="删除成功";
		}else{
			msg="未选中,删除失败";
		}

		return allcomment();
	}
	
	//查看这个文章的所有评论
	public String thecoursecomment(){
		allpage=1;
		checkpage();
		comments=CommentDAO.findcomment(null, id1, null, huifu);
		return "allcomment";
	}
	
	
	
	//搜索引擎
	public String sousuocomment(){
		admin = (Admin) session.get("admin");
		if(admin==null)
			return null;
		//搜索评论
		allpage=1;
		checkpage();
		comments=CommentDAO.sousuo("%"+keyword+"%",admin.getId());//添加教师ID
		
		return "allcomment";
	}
	//老师回复内容
	public String huifucomment(){
		Comment c2 = DAO.findbyid(Comment.class,comment.getId());
		c2.setHuifu(comment.getHuifu());
		DAO.update(c2);
		
		return null;
	}
	public String tixinkc(){
		course = DAO.findbyid(Course.class,course.getId());
		List<Team> teams = TeamDAO.findbyzhuce();
		for(Team team:teams){
			WeixinPushMassage.kecheng(team.getOpenId(),course.getTitle(), "http://shangbiao18.xmyunxin.com/course!thecourse.action?course.id="+course.getId()+"&content.id=0&id1="+team.getId());
		}
		msg="通知成功";
		return findAllCourse();
	}
	
	
	
	
//------------------------------------------------------------------------课时	
	//根据课程id查找相应的课时集合
	public String allcontent(){
		try {
			if(course==null){
				course = DAO.findbyid(Course.class,(Integer)session.get("cid"));
			}
		} catch (Exception e) {
			return findAllCourse();
		}
		allpage = 1;
		checkpage();
		contents = CourseDao.thecontent1(course.getId());
		session.put("cid",course.getId());
		return "allcontent";
	}
	
	//添加课时内容页面
	public String addcontent(){
		try {
			Integer i = (Integer)session.get("cid");
			course = DAO.findbyid(Course.class,i);
			course.setPeriod(course.getPeriod()+1);
			DAO.update(course);
			content.setCourseId(i);
			content.setSeq(0);
			DAO.save(content);
		} catch (Exception e) {
			return findAllCourse();
			// TODO: handle exception
		}
		return allcontent();
	}

	//修改课时内容页面
	public String updatecontent(){
		try {
			Integer i = (Integer)session.get("cid");
			content.setCourseId(i);
			Content content2 = DAO.findbyid(Content.class,content.getId());
			content.setContent1(content2.getContent1());
			DAO.update(content);
		} catch (Exception e) {
			return findAllCourse();
			// TODO: handle exception
		}
		return allcontent();
	}
	//删除课时内容页面
	public String deletecontent(){
		try {
			content = DAO.findbyid(Content.class,content.getId());
			course = DAO.findbyid(Course.class,content.getCourseId());
			course.setPeriod(course.getPeriod()-1);
			DAO.update(course);
			DAO.delete(content);
		} catch (Exception e) {
			return findAllCourse();
			// TODO: handle exception
		}
		return allcontent();
	}
	
	//============================================套餐===================================================
	//所有套餐
	public String alltaocan(){
		taocans = DAO.findall(Taocan.class);
		String[] ids;
		for(Taocan t : taocans){
			ids = t.getCourseids().split(",");
			System.err.println(ids.length);
			courses = new ArrayList<Course>();
			for(int i = 0;i<ids.length;i++){
				System.err.println(ids[i]);
				courses.add(DAO.findbyid(Course.class,Integer.valueOf(ids[i])));
			}
			t.setTaocancourses(courses);
		}
		allpage = 1;
		checkpage();
		return "alltaocan";
	}
	//查看套餐详情
	public String thetaocan(){
		taocan = DAO.findbyid(Taocan.class,taocan.getId());
		
		String[] ids = taocan.getCourseids().split(",");
		courses = new ArrayList<Course>();
		for(int i = 0;i<ids.length;i++){
			courses.add(DAO.findbyid(Course.class,Integer.valueOf(ids[i])));
		}
		taocan.setTaocancourses(courses);
		return "thetaocan";
	}
	
	//添加课程到套餐
	public String addtaocan1(){
		HashSet<Integer> courseid2s = (HashSet<Integer>) session.get("courseids");
		if(courseid2s==null){
			courseid2s = new HashSet<Integer>();
		}
		if(courseids==null){
			msg = "请选择套餐课程";
			return findAllCourse();
		}
		
		courseid2s.addAll(courseids);
		
		session.put("courseids", courseid2s);
		
		System.err.println(courseid2s.size());
		
		return findAllCourse();
	}
	//去添加套餐
	public String addtaocan2(){
		HashSet<Integer> courseid2s = (HashSet<Integer>) session.get("courseids");
		if(courseid2s==null){
			msg = "请先添加套餐课程";
			return findAllCourse();
		}
		
		courses = new ArrayList<Course>();
		
		for(Integer id:courseid2s){
			courses.add(DAO.findbyid(Course.class, id));
		}
		
		return "addtaocan";
	}
	//添加套餐
	public String addtaocan3(){
		if(courseids==null||courseids.size()==0){
			msg="请选择套餐内容";
			return addtaocan2();
		}
		courses = new ArrayList<Course>();
		Double twomoney=0.0;
		Course course;
		
		taocan.setCourseids(courseids.toString().replaceAll("\\s*", "").replaceAll("\\[", "").replaceAll("\\]", ""));
		
		System.err.println(taocan.getCourseids());
		
		for(Integer id:courseids){
			course = DAO.findbyid(Course.class, id);
			if(course!=null){
				twomoney = Math.round(twomoney*100 + course.getMoney()*100)/100.0;
				courses.add(course);
			}
		}
		taocan.setTwomoney(twomoney);
		if(file != null){//上架图
			taocan.setImg(ImageUploadUtil.upload(file, fileFileName));
		}
		
		
		DAO.save(taocan);
		
		return alltaocan();
	}
	//删除套餐
	public String deletetaocan(){
		for(Integer i:courseids){
			try {
				DAO.deletebyid(Taocan.class,i);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		return alltaocan();
	}
	//去修改套餐
	public String toupdatetaocan(){
		taocan = DAO.findbyid(Taocan.class,taocan.getId());
		
		String[] ids = taocan.getCourseids().split(",");
		courses = new ArrayList<Course>();
		for(int i = 0;i<ids.length;i++){
			courses.add(DAO.findbyid(Course.class,Integer.valueOf(ids[i])));
		}
		taocan.setTaocancourses(courses);
		
		return "updatetaocan";
	}

	//修改套餐
	public String updatetaocan(){
		if(courseids==null||courseids.size()==0){
			msg="请选择套餐内容";
			return addtaocan2();
		}
		
		Taocan taocan2 = DAO.findbyid(Taocan.class,taocan.getId());
		courses = new ArrayList<Course>();
		Double twomoney=0.0;
		Course course;
		
		taocan.setCourseids(courseids.toString().replaceAll("\\s*", "").replaceAll("\\[", "").replaceAll("\\]", ""));
		
		System.err.println(taocan.getCourseids());
		
		for(Integer id:courseids){
			course = DAO.findbyid(Course.class, id);
			if(course!=null){
				twomoney = Math.round(twomoney*100 + course.getMoney()*100)/100.0;
				courses.add(course);
			}
		}
		taocan.setTwomoney(twomoney);
		if(file != null){//上架图
			taocan.setImg(ImageUploadUtil.upload(file, fileFileName));
		}else{
			taocan.setImg(taocan2.getImg());
		}
		taocan.setPayNum(taocan2.getPayNum());
		DAO.update(taocan);
		return alltaocan();
	}
	
	
	
	
	/**
	 * 导出课程订单到Excel
	 */
	public String exportorder1() throws Exception {
		if("".equals(time1)){
			time1 = "2010-01-01";
		}
		if("".equals(time2)){
			time2 = TimeUtil.getStringShort();
		}
		if(order1.getStatus()<0){
			order1s = null;
		}else{
			order1s = null;
		}
		
		
		String[] tableHeader = { "订单号", "价格", "课程名称", "用户昵称", "手机号", "下单时间", "订单状态"};
		short cellNumber = (short) tableHeader.length;// 表的列数
		HSSFWorkbook workbook = new HSSFWorkbook(); // 创建一个excel
		HSSFCell cell = null; // Excel的列
		HSSFRow row = null; // Excel的行
		HSSFCellStyle style = workbook.createCellStyle(); // 设置表头的类型
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		HSSFCellStyle style1 = workbook.createCellStyle(); // 设置数据类型
		style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		HSSFFont font = workbook.createFont(); // 设置字体
		HSSFSheet sheet = workbook.createSheet("sheet1"); // 创建一个sheet
		HSSFHeader header = sheet.getHeader();// 设置sheet的头
		try {
			if (order1s.size() < 1) {
				header.setCenter("无课程订单信息");
			} else {
				team = DAO.findbyid(Team.class, order1s.get(0).getTeamid());
				header.setCenter("课程订单列表");
				row = sheet.createRow(0);
				row.setHeight((short) 400);
				for (int k = 0; k < cellNumber; k++) {
					cell = row.createCell((short) k);// 创建第0行第k列
					cell.setEncoding(HSSFCell.ENCODING_UTF_16);
					cell.setCellValue(tableHeader[k]);// 设置第0行第k列的值
					short y = (short) 6000;
					sheet.setColumnWidth((short) k, y);// 设置列的宽度
					font.setColor(HSSFFont.COLOR_NORMAL); // 设置单元格字体的颜色.
					font.setFontHeight((short) 250); // 设置单元字体高度
					style1.setFont(font);// 设置字体风格
					cell.setCellStyle(style1);
				}
				// 开始循环写入
				for (int i = 0; i < order1s.size(); i++) {
					order1 = (Order1) order1s.get(i);// 获取会员对象
					row = sheet.createRow((short) (i + 1));// 创建第i+1行
					row.setHeight((short) 400);// 设置行高

						cell = row.createCell((short) 0); // 创建第i+1行第0列
						cell.setEncoding(HSSFCell.ENCODING_UTF_16);
						cell.setCellValue(order1.getOid());// 设置第i+1行第1列的值
						cell.setCellStyle(style); // 设置风格
						
						cell = row.createCell((short) 1);
						cell.setEncoding(HSSFCell.ENCODING_UTF_16);
						cell.setCellValue(order1.getPrice());
						cell.setCellStyle(style);
						
						cell = row.createCell((short)2);
						cell.setEncoding(HSSFCell.ENCODING_UTF_16);
						cell.setCellValue(order1.getCoursetitle());
						cell.setCellStyle(style);
						
						cell = row.createCell((short) 3);
						cell.setEncoding(HSSFCell.ENCODING_UTF_16);
						cell.setCellValue(team.getNickName());
						cell.setCellStyle(style);

					
						cell = row.createCell((short)4);
						cell.setEncoding(HSSFCell.ENCODING_UTF_16);
						cell.setCellValue(order1.getPhone());
						cell.setCellStyle(style);
					

						cell = row.createCell((short) 5);
						cell.setEncoding(HSSFCell.ENCODING_UTF_16);
						cell.setCellValue(order1.getTime());
						cell.setCellStyle(style);
						

						cell = row.createCell((short) 6);
						cell.setEncoding(HSSFCell.ENCODING_UTF_16);
						if(order1.getStatus()==0){
							cell.setCellValue("待付款");
						} else {
							cell.setCellValue("已付款");
						}
						cell.setCellStyle(style);
						
						
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		HttpServletResponse response = null;// 创建一个HttpServletResponse对象
		OutputStream out = null;// 创建一个输出流对象
		try {
			response = ServletActionContext.getResponse();// 初始化HttpServletResponse对象
			out = response.getOutputStream();//

			String headerStr = "课程订单列表";
			headerStr = new String(headerStr.getBytes("utf-8"), "ISO8859-1");// headerString为中文时转码
			response.setHeader("Content-disposition", "attachment; filename="
					+ headerStr + ".xls");// filename是下载的xls的名，建议最好用英文
			response.setContentType("application/msexcel;charset=UTF-8");// 设置类型
			response.setHeader("Pragma", "No-cache");// 设置头
			response.setHeader("Cache-Control", "no-cache");// 设置头
			response.setDateHeader("Expires", 0);// 设置日期头
			workbook.write(out);
			out.flush();
			workbook.write(out);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {

				if (out != null) {
					out.close();
				}

			} catch (IOException e) {
				e.printStackTrace();
			}

		}

		return null;
	}
	
	


//--------------------------------------------------------------------------------


	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}


	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	
	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}


	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}




	public List<Admin> getTeachers() {
		return teachers;
	}

	public void setTeachers(List<Admin> teachers) {
		this.teachers = teachers;
	}

	public Content getContent() {
		return content;
	}

	public void setContent(Content content) {
		this.content = content;
	}

	public List<Content> getContents() {
		return contents;
	}

	public void setContents(List<Content> contents) {
		this.contents = contents;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public List<Post> getPosts() {
		return posts;
	}

	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}


	public Order1 getOrder1() {
		return order1;
	}

	public List<Order1> getOrder1s() {
		return order1s;
	}

	public void setOrder1(Order1 order1) {
		this.order1 = order1;
	}

	public void setOrder1s(List<Order1> order1s) {
		this.order1s = order1s;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}


	public Integer getCollectid() {
		return collectid;
	}

	public void setCollectid(Integer collectid) {
		this.collectid = collectid;
	}

	public int getId1() {
		return id1;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public void setId1(int id1) {
		this.id1 = id1;
	}



	public String getTime1() {
		return time1;
	}

	public void setTime1(String time1) {
		this.time1 = time1;
	}

	public String getTime2() {
		return time2;
	}

	public void setTime2(String time2) {
		this.time2 = time2;
	}



	public Classify2 getClassify2() {
		return classify2;
	}

	public List<Classify2> getClassify2s() {
		return classify2s;
	}

	public void setClassify2(Classify2 classify2) {
		this.classify2 = classify2;
	}

	public void setClassify2s(List<Classify2> classify2s) {
		this.classify2s = classify2s;
	}

	public Admin getTeacher() {
		return teacher;
	}

	public void setTeacher(Admin teacher) {
		this.teacher = teacher;
	}

	public Integer getTeacherid() {
		return teacherid;
	}

	public Integer getClassify2id() {
		return classify2id;
	}

	public void setTeacherid(Integer teacherid) {
		this.teacherid = teacherid;
	}

	public void setClassify2id(Integer classify2id) {
		this.classify2id = classify2id;
	}

	public List<Integer> getCourseids() {
		return courseids;
	}

	public void setCourseids(List<Integer> courseids) {
		this.courseids = courseids;
	}

	public List<Taocan> getTaocans() {
		return taocans;
	}

	public Taocan getTaocan() {
		return taocan;
	}

	public void setTaocans(List<Taocan> taocans) {
		this.taocans = taocans;
	}

	public void setTaocan(Taocan taocan) {
		this.taocan = taocan;
	}

	public Integer getHuifu() {
		return huifu;
	}
	public void setHuifu(Integer huifu) {
		this.huifu = huifu;
	}
	public List<Course> getCourse0s() {
		return course0s;
	}
	public List<Course> getCourse1s() {
		return course1s;
	}
	public List<Course> getCourse2s() {
		return course2s;
	}
	public void setCourse0s(List<Course> course0s) {
		this.course0s = course0s;
	}
	public void setCourse1s(List<Course> course1s) {
		this.course1s = course1s;
	}
	public void setCourse2s(List<Course> course2s) {
		this.course2s = course2s;
	}

	public String getJsapi_ticket() {
		return jsapi_ticket;
	}

	public void setJsapi_ticket(String jsapiTicket) {
		jsapi_ticket = jsapiTicket;
	}

	public Map<String, String> getRet() {
		return ret;
	}

	public void setRet(Map<String, String> ret) {
		this.ret = ret;
	}

	public Peizhi getPeizhi() {
		return peizhi;
	}

	public void setPeizhi(Peizhi peizhi) {
		this.peizhi = peizhi;
	}


	





}
