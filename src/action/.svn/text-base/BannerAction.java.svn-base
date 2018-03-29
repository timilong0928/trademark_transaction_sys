package action;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import moban.WeixinPushMassage;
import net.sf.json.JSONObject;

import org.apache.commons.collections.map.HashedMap;

import com.yx.pojo.AccessToken;
import com.yx.util.WeixinUtil;

import pojo.Banner;
import pojo.Peizhi;
import pojo.Taocan;
import pojo.Team;
import pojo.TimeUtil;
import util.ImageUploadUtil;
import dao.DAO;
public class BannerAction extends BaseAction {

	private Banner banner;
	private List<Banner> banners;
	private int[]id;
	private File file;
	private String fileFileName;
	
	private String jsapi_ticket;
 	private Map<String, String> ret;
 	private Peizhi peizhi;
 	private int id1=0;
	
	
	
	//======================================前端服务========================================
	//查看这个活动
	public String thehuodong(){
		
		peizhi = DAO.findbyid(Peizhi.class, 1);
		ret = new HashedMap();
		team = (Team) session.get("team");
		if(team==null){
				session.put("id1",id1);
				session.put("banner", banner);
			try {
				response.sendRedirect(wx_thehuodong_url);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "banner";
		}
		try {
			if(id1==0)
				id1=(Integer) session.get("id1");
			if(banner==null)
				banner = (Banner) session.get("banner");
		} catch (Exception e) {
			// TODO: handle exception
		}
		team = DAO.findbyid(Team.class,team.getId());
		
		//如果用户是通过他人分享来的。
		if(id1>0&&!team.getId().equals(id1)){
			Team shangji = DAO.findbyid(Team.class, id1);
			if(shangji!=null){
				//如果上级未注册则推荐无效，如果是自己推荐自己则无效
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
		if(banner==null)
			banner = (Banner) session.get("banner");
		banner = DAO.findbyid(Banner.class,banner.getId());
		
		fenxiang("http://shangbiao18.xmyunxin.com/banner!thehuodong.action?banner.id="+banner.getId()+"&id1="+team.getId());
		
		return "thehuodong";
	}
	public String gothehuodong(){
		loadOpenId();
		return thehuodong();
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//======================================后台服务========================================
	
	
	//查询所有首页轮播
	public String findall(){
			banners=DAO.findall(Banner.class);
			return "banner";
	}
	
	
	
	//修改活动轮播
	public String xiugai(){
			banners=DAO.findbyinteger(Banner.class,"id", banner.getId());
			banner=banners.get(0);
			System.out.println(banner);
			return "xiugai";
	}
	//删除
	public String delete(){
			banner=DAO.findbyid(Banner.class, banner.getId());
			if (banner!=null) {
				DAO.delete(banner);
			}
			
			return findall();
	}
	
	//更新
	public String update() throws IOException{
		Banner banner1=DAO.findbyid(Banner.class, banner.getId());
		if(file!=null){
			String imgName=ImageUploadUtil.upload(file, fileFileName);       
			banner1.setImg(imgName);
		}
		banner1.setLink(banner.getLink());
		try {
			DAO.update(banner1);
			msg="更新成功";
		} catch (Exception e) {
			e.printStackTrace();
			msg="更新失败";
		}
		return findall();
	}
	

	
	
	
	//添加首页轮播
	public String add(){
		try {
			String imgName=ImageUploadUtil.upload(file, fileFileName);       
			banner.setImg(imgName);
			DAO.save(banner);
			msg="添加成功";
		} catch (Exception e) {
			e.printStackTrace();
			msg="添加失败";
		}
		return findall();
	}



	public Banner getBanner() {
		return banner;
	}

	public void setBanner(Banner banner) {
		this.banner = banner;
	}

	public List<Banner> getBanners() {
		return banners;
	}

	public void setBanners(List<Banner> banners) {
		this.banners = banners;
	}

	public int[] getId() {
		return id;
	}

	public void setId(int[] id) {
		this.id = id;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
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
