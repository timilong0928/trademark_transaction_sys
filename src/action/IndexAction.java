package action;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;

import moban.WeixinPushMassage;
import net.sf.json.JSONObject;

import com.yx.pojo.AccessToken;
import com.yx.util.WeixinUtil;

import pojo.Award;
import pojo.Banner;
import pojo.Classify2;
import pojo.Course;
import pojo.Peizhi;
import pojo.Taocan;
import pojo.Team;
import pojo.TeamAward;
import pojo.TimeUtil;
import dao.CourseDao;
import dao.DAO;

public class IndexAction extends BaseAction {
	
	private List<Banner> banners;
	private List<Banner> huodongs;
 	private Team team;
 	private List<Course> course0s;//活动课程
 	private List<Course> course1s;//免费课程
 	private List<Course> course2s;//付费课程
 	private List<Classify2> classify2s;
 	private List<Taocan> taocans;
 	
	private String jsapi_ticket;
 	private Map<String, String> ret;
 	private Peizhi peizhi;
 	private int id1=0;
 	
 	
 	
	/**
	 * 主页
	 * @return
	 */
 	public void index(){
 		
 		
 	}
 	//去首页
	/*public String index(){
		peizhi = DAO.findbyid(Peizhi.class, 1);
		ret = new HashedMap();
		team = (Team)session.get("team");
		//测试用
		if(min!=null){
			System.err.println(min);
			team = DAO.findbyid(Team.class,min);
			
			System.err.println(team);
			session.put("team",team);
		}
		
		if(team==null){
			try {
				session.put("id1", id1);
				response.sendRedirect(wx_index_url);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "index";
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
						team.setErjiId(shangji.getYijiId());
						team.setYijiname(shangji.getNickName());
						team.setErjiname(shangji.getYijiname());
						DAO.update(team);
						session.put("team",team);
						//查询上级用户
						Team shangji1=DAO.findbyid(Team.class,team.getYijiId());
						Team shangji2=DAO.findbyid(Team.class,team.getErjiId());
						if(shangji1!=null){
							try {
								WeixinPushMassage.zhuce(shangji1.getOpenId(), team.getNickName()+"（下级）");
							} catch (Exception e) {
								// TODO: handle exception
							}
						}
						if(shangji2!=null){
							try {
								WeixinPushMassage.zhuce(shangji2.getOpenId(), team.getNickName()+"（下二级）");
							} catch (Exception e) {
								// TODO: handle exception
							}
						}
					}
				}
				
			}
		}
		team = DAO.findbyid(Team.class,team.getId());
		
		
		
		
		huodongs = DAO.findbyinteger(Banner.class, "orderid",1);
		banners = DAO.findbyinteger(Banner.class, "orderid",0);
		classify2s=DAO.findall(Classify2.class,null,"orderid");
		taocans = DAO.findall(Taocan.class);
		
		course0s = CourseDao.findbyfufei(-1,null, null, null);
		course1s = CourseDao.findbyfufei(0,null, null, null);
		course2s = CourseDao.findbyfufei(1,null, null, null);
		
		//fenxiang("http://shangbiao18.xmyunxin.com/index!index.action?id1="+team.getId());
		
		return "index";
	}*/
	
	/*void fenxiang(String url){
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
	}*/
	
	//微信接口
	/*public String goindex(){
		System.err.println("进入主页");
		loadOpenId();
		msg = null;
		return index();
	}*/
	
	
	
	
	
	
	public List<Banner> getHuodongs() {
		return huodongs;
	}



	public void setHuodongs(List<Banner> huodongs) {
		this.huodongs = huodongs;
	}



	public List<Banner> getBanners() {
		return banners;
	}

	public Team getTeam() {
		return team;
	}


	public void setBanners(List<Banner> banners) {
		this.banners = banners;
	}



	public void setTeam(Team team) {
		this.team = team;
	}

	public List<Classify2> getClassify2s() {
		return classify2s;
	}

	public void setClassify2s(List<Classify2> classify2s) {
		this.classify2s = classify2s;
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

	public List<Taocan> getTaocans() {
		return taocans;
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

	public void setTaocans(List<Taocan> taocans) {
		this.taocans = taocans;
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

	public int getId1() {
		return id1;
	}

	public void setId1(int id1) {
		this.id1 = id1;
	}






}
