package action;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.rmi.ServerException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import moban.WeixinPushMassage;
import net.sf.json.JSONObject;

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
import pojo.Article;
import pojo.Award;
import pojo.Banner;
import pojo.Collect;
import pojo.Comment;
import pojo.Content;
import pojo.Course;
import pojo.Fenxiao;
import pojo.JsonResult;
import pojo.Nongli;
import pojo.Order1;
import pojo.Order2;
import pojo.PayRecord;
import pojo.Peizhi;
import pojo.Post;
import pojo.Sb;
import pojo.Sbfenlei;
import pojo.Yewu;

import pojo.Team;
import pojo.TeamAward;
import pojo.TimeUtil;
import util.Delemoji;
import util.ImageUploadUtil;
import util.ImgCompose;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import com.taobao.api.ApiException;
import com.utils.CommonUtil;
import com.yx.pojo.AccessToken;
import com.yx.util.WeixinUtil;

import dao.CollectDAO;
import dao.CourseDao;
import dao.DAO;
import dao.MylikeDAO;
import dao.PayRecordDAO;
import dao.TeamAwardDAO;
import dao.TeamDAO;

public class TeamAction extends BaseAction{
	private List<Team> teams;
	private File file;
	private String fileFileName;
	private String keyName;
	private String keyContent;
	private String userName;
	private String nickName;
	private String pwd;
	private String opwd;
	private String xuanze;
	private Team team1; //上级对象
	private Integer status;//判断查询的是否是会员，
	private Integer memberdj;//会员
	private Integer id;	//对象id
	private String keyword;//收索内容
	private Integer num;
	private List<Order1> order3s ; //个人课程订单集合
	private List<Course> courses; //订单集合对应的课程集合
	private List<Order2> order2s; //个人商品订单集合
	private List<Order1> order1s; //个人订单的商品集合
	private Integer number1;
	private Integer number2;
	private Integer number3;
	private List<PayRecord> payRecords;
	private PayRecord payRecord;
	private List<Collect> collects;
	private Post post;
	private Integer id1;
	private Integer id2;
	private Integer pid;
	private Order2 order2; //订单商品
	private Integer type;
	private Course course;
	private Order1 order3;
	private Comment comment;
	private Integer collectis;
	private List<Comment> comments;//评论
	private Content content;//课程内容对象
	private List<Content> contents;//课程内容集合
	private Map<String,String> datas;
	private List<TeamAward> teamAwards;//会员积分奖励
	private String key;
	private String time1;
	private String time2;
	private String imgUrl;
	private String nickname;
	
	private Nongli nongli;
	private Peizhi peizhi;
	private Fenxiao fenxiao;
	//商标项目
	private JsonResult jsonresult;
	private List<Banner> banners;
	private List<Yewu> yewus;
	private List<Sb> sbs;
	private List<Sbfenlei> sbfenleis;
	private List<Article> articles;
	private Article article;
	private Integer teamid;
	private String openid;
	private Double tixiannum;
	private String inputname;
	private String inputka;
	private String inputhang;
	private String msgjsonresult;
	//二微码参数
	private String a;
	
	private String scene;
	
	
	private Team teamyiji;//查找出上一级
	private Team teamerji;//查找出上二级
	
	private String appid;
	private String appsecret;
	
	//查找出所有下级
	private List<Team> allyiji;
	private List<Team> allerji;
	//收藏
	private Collect collect;
	//注册
	private String jsapi_ticket;
 	private Map<String, String> ret;
	
	//临时字段
	private String realphone;  //判断注册时号码是否相同

	//====================================前端部分=====================================
	
	
	//进入首页，
	public String tohomepage(){
		jsonresult = new JsonResult();
		
	    session.remove("teamididid");
		session.put("teamididid", 1);//测试用
		
		
		
		banners=DAO.findall(Banner.class);
		yewus=DAO.findall(Yewu.class);
		sbs=DAO.findall(Sb.class);
		sbfenleis=DAO.findall(Sbfenlei.class);
		
		
		jsonresult.setObjs(banners);
		jsonresult.setObjs2(yewus);
		jsonresult.setObjs3(sbs);
		jsonresult.setObjs4(sbfenleis);
		
		return "jsonresult";
	}
	
	
	
	// 用户登录app开始执行(小程序b)
	public String getuserinfo() {
		System.out.println("scene==========="+scene);
		//System.out.println("code:"+code+"appid:"+appid+"appsecret:"+appsecret);
		String URL = "https://api.weixin.qq.com/sns/jscode2session?appid="
				+ appid + "&secret=" + appsecret + "&js_code=" + code
				+ "&grant_type=authorization_code";
		JSONObject jsonObject = CommonUtil.httpsRequest(URL, "GET", null);
		System.out.println("jsonObject11111:"+jsonObject);
		String openid = null;
		openid = jsonObject.getString("openid");
		team = TeamDAO.findbysellerid(openid);
		System.out.println("team===="+team);
		//确定不是自己扫描自己
		if (team == null) {
			team = new Team();
			SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time = d.format(new Date());
			team.setNickName(Delemoji.emojiChange(nickname));
			team.setImg(imgUrl);
			team.setOpenId(openid);
			team.setRegTime(time);
			team.setAppid(appid);
			
			if ("wu".equals(scene)) {
				System.out.println("没进入上级");
				
			}else {
				System.out.println("进入上级");
				Team team1=DAO.findbystringone(Team.class, "openId", scene);
				team.setYijiId(team1.getId());
				team.setYijiname(team1.getNickName());
			}
			
			DAO.save(team);
		}
		
		//System.err.println("getuserinfo进:");
		//System.err.println("openid:"+openid);
		return "resMsg";
	}
	
	public String getadmin(){
		admin = DAO.findbykey("appid", appid, Admin.class);
		
		return "json_getadmin";
	}
	//二微码
	public String erweima1(){
		System.out.println("jinglai");
		jsonresult = new JsonResult();
		
		team=DAO.findbystringone(Team.class, "openId", openid);
		System.out.println("team"+team);
		if ("".equals(team.getErweimapath())) {
			System.out.println("没进来");
			erweima(openid);
			team.setErweimapath("upload/erweima/"+openid+".png");
			DAO.update(team);
			System.out.println("生成完二微码");
		}
		
		
		jsonresult.setObject(team);
		//erweima(openid);
		return "jsonresult";
		
	}
	//察看去权利密码
	public String chakantj(){
		jsonresult = new JsonResult();
		
		team=DAO.findbystringone(Team.class, "openId", openid);
		articles=DAO.findbyinteger(Article.class, "teamid", team.getId());
		//System.out.println("9999999"+articles);
		jsonresult.setObjs(articles);
		jsonresult.setObject(team);
		return "jsonresult";
	}
	
	
	//提现
	public String tixian(){
		jsonresult = new JsonResult();
		team=DAO.findbystringone(Team.class, "openId", openid);
		
		award = DAO.findbyid(Award.class,1);
		payRecord=new PayRecord();
		
		if(tixiannum==null||tixiannum==0.0)
			msgjsonresult="请输入提现金额";
		else if(tixiannum>team.getYongjin())
			msgjsonresult="可提现金额不足";
		else if(tixiannum<award.getMinmoney())
			msgjsonresult="低于最低提现额度，请重试";
		else if(inputname==null)
			msgjsonresult="请输入银行卡开户姓名";
		else if(inputka==null)
			msgjsonresult="请输入银行卡号";
		else if(inputhang==null)
			msgjsonresult="请输入开户银行";
		else{
			try {
			
			payRecord.setTeamid(team.getId());
			payRecord.setStyle(2);
			payRecord.setStatus(0);
			payRecord.setName(inputname);
			payRecord.setKahao(inputka);
			payRecord.setYinghang(inputhang);
			payRecord.setYjpay(tixiannum);
			//payRecord.setYjcontent(team.getPhone());
			
			team.setYongjin(Math.round(team.getYongjin()*100-payRecord.getYjpay()*100)/100.0);
			
			DAO.update(team);
			DAO.save(payRecord);
			msgjsonresult="提交成功，稍后服务人员将进行转账处理";
			} catch (Exception e) {
				msgjsonresult="提交失败，请稍后重试";
			}
		}
	jsonresult.setRes1(msgjsonresult);
		return "jsonresult";
	}
	
	
	//我的佣金
	public String yongjin(){
		jsonresult=new JsonResult();
		
		team=DAO.findbystringone(Team.class, "openId", openid);
		
		award = DAO.findbyid(Award.class,1);
		
		teamAwards = TeamAwardDAO.myTeamAward(team.getId(), 4);
		
		payRecords = TeamAwardDAO.myPayRecord(team.getId(), 2);
		
		jsonresult.setObjs(teamAwards);
		
		jsonresult.setObjs2(payRecords);
		
		jsonresult.setObject(award);
		
		jsonresult.setObject2(team);
		
		
		System.out.println("team==="+team+"award=="+award+"teamAwards=="+teamAwards);
		return "jsonresult";
	}
	
	//我的团队下一级
	public String group(){
		jsonresult = new JsonResult();
		
		team=DAO.findbystringone(Team.class, "openId", openid);
		allyiji=DAO.findbyinteger(Team.class , "yijiId", team.getId());
		jsonresult.setObjs(allyiji);
		jsonresult.setObject(team);
		System.out.println(allyiji);
		return "jsonresult";
	}
	
	
	
	
	
	

	
	//发送验证码 
	/*public String yanzhengma() throws ApiException {
		Team team2 = TeamDAO.findByPhone(team.getPhone());
		
		session.put("realphone",team.getPhone());
		
		if(team2!=null){
			msg="该手机号已被注册";
			return "json_msg";
		}
		session.remove("num");
		num=(int)Math.round(1000+(Math.random()*8999));//获取1000到9999的随机数
		session.put("num",num);
		
		//System.err.println(team.getPhone());
		//System.err.println(num);
		
		
		try {
			send(num,team.getPhone());
		} catch (ServerException e) {
			msg="发送短信失败";
			e.printStackTrace();
		}
		msg="1";
		return "json_msg";
	}*/
	
	//发送短信方法
	public void send(int num ,String phone) throws ServerException{
		String n = ""+num;
	    //设置超时时间-可自行调整
	    System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
	    System.setProperty("sun.net.client.defaultReadTimeout", "10000");
	    //初始化ascClient需要的几个参数
	    final String product = "Dysmsapi";//短信API产品名称
	    final String domain = "dysmsapi.aliyuncs.com";//短信API产品域名
	    //替换成你的AK
	    final String accessKeyId = "LTAIFRr7fNLo8UHo";//你的accessKeyId,参考本文档步骤2
	    final String accessKeySecret = "4kcjTfq1CBk1lfYTmsDhPfzbRoTDqq";//你的accessKeySecret，参考本文档步骤2
	    //初始化ascClient,暂时不支持多region
	    IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId,
	    accessKeySecret);
	    try {
			DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
		} catch (ClientException e) {
			e.printStackTrace();
		}
	    IAcsClient acsClient = new DefaultAcsClient(profile);
	     //组装请求对象
	     SendSmsRequest request = new SendSmsRequest();
	     //必填:待发送手机号。支持以逗号分隔的形式进行批量调用，批量上限为20个手机号码,批量调用相对于单条调用及时性稍有延迟,验证码类型的短信推荐使用单条调用的方式
	     request.setPhoneNumbers(phone);
	     //必填:短信签名-可在短信控制台中找到
	     request.setSignName("阿里云短信测试专用");
	     //必填:短信模板-可在短信控制台中找到
	     request.setTemplateCode("SMS_80290028");
	     //可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
	     request.setTemplateParam("{\"code\":\""+n+"\",\"product\":\"阿里云短信测试专用\"}");
	     
	    //请求失败这里会抛ClientException异常
	    SendSmsResponse sendSmsResponse = null;
		try {
			sendSmsResponse = acsClient.getAcsResponse(request);
		} catch (ClientException e) {
			e.printStackTrace();
		}
	    if(sendSmsResponse.getCode() != null && sendSmsResponse.getCode().equals("OK")) {
	    	System.err.println("短信发送成功");
	    }
		
	}
	//注册
	public String zhuce() {
		
		team = (Team) session.get("team");
		if(team==null){
			try {
				response.sendRedirect(wx_index_url);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "realzhuce";
		}
		team = DAO.findbyid(Team.class,team.getId());
		Integer num2 = (Integer) session.get("num");
		
		System.out.println(num+"phone========"+team1.getPhone()+"num2="+num2);
		List<Team> team2s=DAO.findbystring(Team.class,"phone",team1.getPhone());
		
		if (team2s.size()>0) {
			msg="2";
			return "json_msg";
		}
		if(!num.equals(num2)){
			msg="1";
			System.out.println(11);
			return "json_msg";
		}
		realphone=(String) session.get("realphone");
		if (!realphone.equals(team1.getPhone())) {
			
			msg="3";
			return "json_msg";
		}
		
		session.remove("num");
		session.remove("realphone");
		team.setPhone(team1.getPhone());
		DAO.update(team);
		
		
		
		
		session.put("team", team);
		msg="0";
		return "json_msg";
	}
	
	//前往个人页面
	public String toCenter(){
		
		team = (Team) session.get("team");
		if(team==null){
			try {
				response.sendRedirect(wx_index_url);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "toCenter";
		}
		team=DAO.findbyid(Team.class, team.getId());
		//System.out.println(team);
		session.put("team", team);
		award = DAO.findbyid(Award.class, 1);
		System.out.println(award);
		return "toCenter";
	}
	
	
	
	/**
	 * 修改个人信息页面
	 */
	public String gerenziliaoupdate(){
		team = (Team)session.get("team");
		award = DAO.findbyid(Award.class, 1);
		if(team==null){
			return "login";
		} 
		
		return "gerenziliaoupdate";
	}
	
	



	/**
	 * 修改个人信息
	 */
	public String gerenziliao(){
		Team t = DAO.findbyid(Team.class, team.getId());
		if(file!=null){
			t.setImg(ImageUploadUtil.upload(file, fileFileName));
		}
		t.setNickName(team.getNickName());
		
		t.setPwd(team.getPwd());
		
		try{
			DAO.update(t);
			msg = "success";
		}catch(Exception e){
			e.printStackTrace();
			msg = "修改失败";
		} 
		
		return "json_msg";
	}
	
	




	


	public String getA() {
		return a;
	}



	public void setA(String a) {
		this.a = a;
	}



	//下拉获取消费数据
	public String findPayRecordByPage(){
		size = 10;
		team = (Team)session.get("team");
		if(team==null){
			return "login";
		} 
		allpage = (PayRecordDAO.findnumbyteamid(team.getId())+size-1)/size;
		checkpage();
		payRecords = PayRecordDAO.findpagebyteamid(page, size,team.getId());
		return "payRecords";
	}
	
	
	
	
	//----------------------------------------------------------------------------------------我的收藏
	public String teamCollect(){
		size = 10;
		team = (Team)session.get("team");
		if(team==null){
			return "login";
		} 
		number1 = CollectDAO.findnumbyteamid(team.getId());
		allpage = (number1+size-1)/size;
		checkpage();
		collects = CollectDAO.findpagebyteamid(page, size,team.getId());
		if(number1==0){
			type=0;
		}else {
			type=1;
		}
		return "teamCollect";
	}
	
	
	
	public String getScene() {
		return scene;
	}



	public void setScene(String scene) {
		this.scene = scene;
	}



	//下拉获取收藏数据
	public String findCollectByPage(){
		size = 10;
		team = (Team)session.get("team");
		if(team==null){
			return "login";
		} 
		allpage = (CollectDAO.findnumbyteamid(team.getId())+size-1)/size;
		checkpage();
		collects = CollectDAO.findpagebyteamid(page, size,team.getId());
		return "teamCollects";
	}
	
	
	//查看资讯
	public String thezixun(){
		team = (Team) session.get("team");
		if(team==null){
			return "login";
		}
		if(type==0){
			post = DAO.findbyid(Post.class,pid);
			//收藏的资讯不存在
			if(post==null){
				CollectDAO.delete(pid, team.getId(),type);
				msg = "该资讯已消失";
				return teamCollect();
			}
			post.setReadnum(post.getReadnum()+1);
			DAO.update(post);
			
			//判断自己是否点赞
			id1 = MylikeDAO.findmylike(team.getId(), 0, post.getId());
			//判断自己是否收藏
			id2 = CollectDAO.findmyCollect(team.getId(), post.getId());
			//comments = CommentDAO.findbyinteger(0,post.getId());
			return "thezixun";
		} else {
			return thezixun1(pid,type);
		}
		
	}
	public Double getTixiannum() {
		return tixiannum;
	}



	public void setTixiannum(Double tixiannum) {
		this.tixiannum = tixiannum;
	}



	public String getInputname() {
		return inputname;
	}



	public void setInputname(String inputname) {
		this.inputname = inputname;
	}



	public String getInputka() {
		return inputka;
	}



	public void setInputka(String inputka) {
		this.inputka = inputka;
	}



	public String getInputhang() {
		return inputhang;
	}



	



	//收藏为课程
	public String thezixun1(Integer pid,Integer type){
		team=(Team) session.get("team");
		course = DAO.findbyid(Course.class,pid);
		if(course==null){
			msg = "该资讯已消失";
			CollectDAO.delete(pid, team.getId(),type);
			return teamCollect();
		}
		course.setReadNum(course.getReadNum()+1);
		DAO.update(course);
		//如果视频不可播放，则提示
		if(course.getStatus()==1){
			msg="该商品已临时下架";
		}
		if(course.getStatus()==2){
			msg="该商品已下架";
		}
		//获取购买记录
		
		//是否收藏
		collectis =CollectDAO.findmyCollect(team.getId(),pid);
		
		//获取当前显示的视频
		contents = CourseDao.thecontent1(pid);
		
		if(order3==null){
			//试看
			content = CourseDao.thecontent(pid);
		}else{
			//正式版。如果观看记录的ID无视频，则自动选择第一条正式版
			content = DAO.findbyid(Content.class,order3.getContentid());
			if(content==null){
				if(contents.size()>0){
					content=contents.get(0);
				}
			}
		}
		
		//comments = CommentDAO.findbyinteger(1,course.getId());
		
		msg="1";
		
		return "kcthecourse";
	}
	
	
	//----------------------------------------------------------------------------------------我的分销
	public String toupdatefenxiao(){
		fenxiao = DAO.findbyid(Fenxiao.class, 1);
		return "updatefenxiao";
	}
	public String updatefenxiao(){
		Fenxiao fenxiao2 = DAO.findbyid(Fenxiao.class, 1);
		if(file!=null)
			fenxiao.setImg(ImageUploadUtil.upload(file, fileFileName));
		else 
			fenxiao.setImg(fenxiao2.getImg());
		DAO.update(fenxiao);
		
		return "updatefenxiao";
	}
	
	public String fenxiao(){
		team = (Team) session.get("team");
		peizhi = DAO.findbyid(Peizhi.class, 1);
		ret = new HashedMap();
		if(team==null){
			try {
				if(id1==null)
					id1=0;
				session.put("id1", id1);
				response.sendRedirect(wx_index_url);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "toCenter";
		}
		try {
			if(id1==0||id1==null)
				id1=(Integer) session.get("id1");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
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
		fenxiang("http://shangbiao18.xmyunxin.com/team!fenxiao.action?id1="+team.getId());
		fenxiao = DAO.findbyid(Fenxiao.class, 1);
		
		return "fenxiao";
	}
	//微信接口
	public String gofenxiao(){
		loadOpenId();
		return fenxiao();
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
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 二维码
	 */
	public String teamErWeiMa(){
		team = (Team)session.get("team");
		if(team==null){
			return "login";
		} 
		//处理合成图片
		try {
			List<Banner> banners = DAO.findbystring(Banner.class,"title","二维码背景");
			String sourceFilePath = "C:\\shangbiao18\\hb.jpg";
			if(banners.size()>0){
				sourceFilePath = "C:"+banners.get(0).getImg().replace("upload","shangbiao18");
			}
			
			ImgCompose.hecheng("C:\\shangbiao18\\erweima\\"+team.getId()+".jpg", "C:\\shangbiao18\\erweimabj\\"+team.getId()+".jpg" ,new File(sourceFilePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "erweima";
	}
	
	/**
	 * 上下级
	 */
	public String teamCompany(){
		award = DAO.findbyid(Award.class, 1);
		team = (Team)session.get("team");
		if(team==null){
			return "login";
		} 
		teams = TeamDAO.findBycompanyId(team.getId());
		if(team.getCompanyId()!=null){
			number1 = 1;
		}
		
		number2 = teams.size();
		
		return "teamCompany";
	}
	
	/**
	 * 积分奖励 
	 */
	public String teamAwards(){
		size = 10;
		team = (Team)session.get("team");
		if(team==null){
			return "login";
		} 
		allpage = (PayRecordDAO.findnumbyteamid(team.getId())+size-1)/size;
		checkpage();
		teamAwards = TeamAwardDAO.findpagebyteamid(page, size,team.getId());
		
		return "teamAward";
	}
	
	


	//下拉获取奖励积分数据
	public String findTeamAwardByPage(){
		size = 10;
		team = (Team)session.get("team");
		if(team==null){
			return "login";
		} 
		allpage = (PayRecordDAO.findnumbyteamid(team.getId())+size-1)/size;
		checkpage();
		teamAwards = TeamAwardDAO.findpagebyteamid(page, size,team.getId());
		return "teamAwards";
	}
	
	
//-----------------------------------------------------------------------------------------------------------------

	public List<Yewu> getYewus() {
		return yewus;
	}

	public void setYewus(List<Yewu> yewus) {
		this.yewus = yewus;
	}
	public List<Sb> getSbs() {
		return sbs;
	}

	public List<Sbfenlei> getSbfenleis() {
		return sbfenleis;
	}

	public void setSbfenleis(List<Sbfenlei> sbfenleis) {
		this.sbfenleis = sbfenleis;
	}

	public void setSbs(List<Sb> sbs) {
		this.sbs = sbs;
	}
	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public Integer getTeamid() {
		return teamid;
	}



	public void setTeamid(Integer teamid) {
		this.teamid = teamid;
	}

	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAppid() {
		return appid;
	}
	public void setAppid(String appid) {
		this.appid = appid;
	}
	public String getAppsecret() {
		return appsecret;
	}
	public void setAppsecret(String appsecret) {
		this.appsecret = appsecret;
	}
	public String getMsgjsonresult() {
		return msgjsonresult;
	}



	public void setMsgjsonresult(String msgjsonresult) {
		this.msgjsonresult = msgjsonresult;
	}



	public void setInputhang(String inputhang) {
		this.inputhang = inputhang;
	}



	public String checkNickName(){
		team=(Team) session.get("team");
		if(team==null)
			msg="login";
		Team t=TeamDAO.findByNickName(nickName);
		if(t==null||team.getNickName().equals(t.getNickName()))
			msg="success";
		else
			msg="该昵称已被使用";
		if("".equals(nickName))
			msg="请输入昵称";
		return "json_msg";
	}





	public String checkUserName() {
		try {
			team = TeamDAO.findByUserName(userName);
			if (team == null) {
				msg = "success";
			} else {
				msg = "该用户名已存在";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "json_msg";
	}
	public String register() {
		try {
			team = TeamDAO.findByUserName(userName);			
			if (team == null) {
				team = new Team();
				team.setUserName(userName);
				team.setNickName("");
				team.setPwd(pwd);
				team.setPhone(userName);
				if(file!=null){
					String headImage=ImageUploadUtil.upload(file, fileFileName);
					team.setImg(headImage);
				}
				DAO.save(team);
				msg = "success";
			} else {
				msg = "该用户名已存在";
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "注册失败，请重试";
		}
		return "json_msg";
	}

	

	public String loginOut() {
		try {
			session.remove("team");
			Cookie c1=new Cookie("username", null);
			Cookie c2=new Cookie("pwd", null);
			c1.setMaxAge(0);
			c2.setMaxAge(0);
			c1.setPath("/");
			c2.setPath("/");
			response.addCookie(c1);
			response.addCookie(c2);
			msg = "success";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "退出失败,请稍后重试";
		}
		return "json_msg";
	}



	
	

	
	
	
	
	
	


	public String ziliao(){
		team=DAO.findbyid(Team.class,team.getId());
		return "ziliao";
	}




	public String getRealphone() {
		return realphone;
	}

	public void setRealphone(String realphone) {
		this.realphone = realphone;
	}

	public String findInfo(){

		return "toInfo";
	}




	public String changePWD(){
		team=TeamDAO.findByUserName(userName);
		if(team==null){
			msg="用户不存在";
		}else{
			team.setPwd(pwd);
			DAO.update(team);
			session.put("team", team);
			msg="success";
		}

		return "json_msg";

	}


	
	public String updateTeam(){
		Team temp=DAO.findbyid(Team.class,team.getId());
		if(temp==null){
			msg="更新失败";
			return "json_msg";
		}
		if(file!=null){
			String headImage=ImageUploadUtil.upload(file, fileFileName);
			temp.setImg(headImage);
		}

		temp.setRname(team.getRname());
		temp.setNickName(team.getNickName());
		temp.setPhone(team.getPhone());
		temp.setEmail(team.getEmail());
		temp.setProvince(team.getProvince());
		temp.setCity(team.getCity());
		temp.setArea(team.getArea());
		temp.setAddress(team.getAddress());
		temp.setIsJudge(1);//需要审核
		temp.setIsReject(0);
		DAO.update(temp);
		session.put("team",temp);
		msg="success";
		return "json_msg";

	}

	//================================================后台部分===============================================
	
	//所有提现
	public String findalltixian(){
		allpage =1;
		page=1;
		payRecords = TeamAwardDAO.myPayRecord(null, 2);
		
		return "alltixian";
	}
	//同意提现
	public String tongyitixian(){
		payRecord = DAO.findbyid(PayRecord.class, payRecord.getId());
		if(payRecord.getStatus()==0){
			payRecord.setStatus(1);
			DAO.update(payRecord);
			msg ="提现成功";
		}else{
			msg="该提现订单已处理，请勿重复提交";
		}
		
		return findalltixian();
	}
	//拒绝提现
	public String jujuetixian(){
		payRecord = DAO.findbyid(PayRecord.class, payRecord.getId());
		if(payRecord.getStatus()==0){
			payRecord.setStatus(2);
			team = DAO.findbyid(Team.class,payRecord.getTeamid());
			team.setYongjin(Math.round(team.getYongjin()*100+payRecord.getYjpay()*100)/100.0);
			DAO.update(team);
			DAO.update(payRecord);
			msg ="提现已拒绝";
		}else{
			msg="该提现订单已处理，请勿重复提交";
		}
		
		return findalltixian();
	}
	
	
	
	//查询所有会员
	public String findAll(){
		size=10;
		allpage = (DAO.findnum(Team.class)+size-1)/size;
		checkpage();
		teams=TeamDAO.findByPageOrderByIdStatus(Team.class, page, size);
	    
		return "all";
	}

	
	

	//修改会员和积分方法，
	public String updateMemberdj(){
		team=DAO.findbyid(Team.class, id);
		datas = new HashMap<String, String>();
		datas.put("memberdj", memberdj.toString());
		String t = "";
		if(memberdj==0){
			
		}else{
			Calendar calendar = Calendar.getInstance();
	        Date date = new Date(System.currentTimeMillis());
	        calendar.setTime(date);
	        calendar.add(Calendar.YEAR, +1);
	        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	        t = sdf.format(calendar.getTime());
			
		}
		datas.put("t", t);
		
		datas.put("point",num.toString() );
		TeamDAO.update(team);
		team=DAO.findbyid(Team.class, id);
		//System.out.println(team);
		return "json_datas";
	}
	
	//查找用户的两个上下级
	public String findxiaji(){
		size=10;
		allpage = (DAO.findnum(Team.class)+size-1)/size;
		checkpage();
		
		team=DAO.findbyid(Team.class, team.getId());
	    teams=TeamDAO.findallxiaji(Team.class, team.getId());//查出所有下级
	   
	    award = DAO.findbyid(Award.class, 1);
		return "all";
	}
	
	//添加权利密码
	public String addql(){
		
		String imgname=ImageUploadUtil.upload1(file, fileFileName);
		article.setImg(imgname);
		Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String nowtime = dateFormat.format(now); 
        article.setTime(nowtime);
        article.setState(1);
        Integer a;
        a= (Integer) session.get("teamidid");
       
        article.setTeamid(a);
        DAO.save(article);
        
        
        team=DAO.findbyid(Team.class, a);
		teamyiji=DAO.findbyid(Team.class, team.getYijiId());
		award = DAO.findbyid(Award.class, 1);
		articles=DAO.findbytwo(Article.class, "state", "teamid",1, team.getId());
		
        
		
        return "toUser";
	}
	
	
	
	//查询上一级或者自己的详情
	public String toUser(){
		
		team=DAO.findbyid(Team.class, team.getId());
		teamyiji=DAO.findbyid(Team.class, team.getYijiId());
		award = DAO.findbyid(Award.class, 1);
		articles=DAO.findbytwo(Article.class, "state", "teamid",1, team.getId());
		//System.out.println(articles);
		session.remove("teamidid");
		session.put("teamidid", team.getId());
		
		return "toUser";
	}
	
	//搜索查询会员
	public String searchKeyword(){
		keyword = "%"+keyword+"%";
		allpage=1 ;
		if(key.equals("user")){
			//System.out.println(11);
			teams = TeamDAO.searchnickName(keyword);
		} else {
			
			teams = TeamDAO.searchPhone(keyword);
		}
		
		return "all";
	}
	

	


	//会员佣金获取和消费记录
	public String yongjinAward(){
		
		teamAwards = DAO.findbyinteger(TeamAward.class,"teamId",team.getId());
		payRecords = DAO.findbyinteger(PayRecord.class,"teamid", team.getId());
		//System.out.println(teamAwards+"222222222"+payRecords);
		team=DAO.findbyid(Team.class, team.getId());
		return "yongjinaward";
	}
	
	
	//删除会员
	public String deletebyid() {
		if(ids!=null&&ids.length>0){
			for (int i = 0,len=ids.length; i < len; i++) {
				DAO.deletebyid(Team.class, ids[i]);
			}
			msg ="删除成功";
		}else{
			msg="未选中,删除失败";
		}
		return findAll();
	}

	
	public String Forbid(){
		team=DAO.findbyid(Team.class, team.getId());

		if(team.getIsForbid()==0){
			team.setIsForbid(1);
			DAO.update(team);
		}else{
			team.setIsForbid(0);
			DAO.update(team);
		}
		return findAll();
	}
	
	public String search(){
		size=10;
		allpage=(TeamDAO.findByKey(keyName,keyContent).size()-1)/size;
		checkpage();
		keyContent="%"+keyContent+"%";
		teams=TeamDAO.findByKeyPage(keyName,keyContent,page,size);
		return "all";
	}




	public String add() throws IOException {
		try {
			if (file != null) {
				String imgName = ImageUploadUtil.upload(file, fileFileName);
				team.setImg(imgName);
			}
			TeamDAO.save(team);
			msg = "添加成功";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "添加失败";
		}
		return findAll();
	}



	public String updateBeiZhuById(){
		Team temp=DAO.findbyid(Team.class, team.getId());
		DAO.update(temp);
		return findAll();
	}



	public String toJudge(){

		team=DAO.findbyid(Team.class, team.getId());
		return "toJudge";

	}


	public String updateById() {
		Team t2 = TeamDAO.findbyid(Team.class, team.getId());
		if (file != null) {
			String imgName = ImageUploadUtil.upload(file, fileFileName);
			t2.setImg(imgName);
		} 
		t2.setAddress(team.getAddress());
		t2.setEmail(team.getEmail());
		t2.setPhone(team.getPhone());
		t2.setSex(team.getSex());
		t2.setRname(team.getRname());
		t2.setPwd(team.getPwd());

		try {
			TeamDAO.update(t2);
			msg = "更新成功";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "更新失败";
		}
		return findAll();
	}

	public String checkzhanghao(){
		if(TeamDAO.findByUserName(team.getUserName())!=null){
			msg="账号已存在";
		}else{
			msg="账号可以使用";
		}
		return "json_msg";
	}
	//添加更新推荐
	public String addtj(){
		
		team1=DAO.findbyid(Team.class, team.getId());
		if(team1.getIstj()==1){
			team1.setTuijian(team.getTuijian());
			team1.setIstj(0);
			DAO.update(team1);
		}else if (team1.getIstj()==0) {
			team1.setTuijian(team.getTuijian());
			team1.setIstj(0);
			DAO.update(team1);
			
		}
		
		return toUser();
	}
	//删除推荐
	public String deletetj(){
		
		//System.out.println("article.getId()"+article.getId());
		article=DAO.findbyid(Article.class, article.getId());
		DAO.delete(article);
		
		Integer a;
        a= (Integer) session.get("teamidid");
       
        team=DAO.findbyid(Team.class, a);
		teamyiji=DAO.findbyid(Team.class, team.getYijiId());
		award = DAO.findbyid(Award.class, 1);
		articles=DAO.findbytwo(Article.class, "state", "teamid",1, team.getId());
		return "toUser";
	}
	//察看推荐
	public String looktj(){
		
		
		article=DAO.findbyid(Article.class, article.getId());
		
		
		Integer a;
        a= (Integer) session.get("teamidid");
       
        team=DAO.findbyid(Team.class, a);
		teamyiji=DAO.findbyid(Team.class, team.getYijiId());
		award = DAO.findbyid(Award.class, 1);
		articles=DAO.findbytwo(Article.class, "state", "teamid",1, team.getId());
		return "looktj";
	}
	//跳修改界面
	public String xiugaitj1(){
		
		
		article=DAO.findbyid(Article.class, article.getId());
		
		
		return "xiugaitj";
	}
	//修改推荐
	public String xiugaitj(){
		
		
		Article article1=new Article();
		article1=DAO.findbyid(Article.class, article.getId());
		try {
			if (file!=null) {
				String imgname=ImageUploadUtil.upload1(file, fileFileName);
				article1.setImg(imgname);
				
			}
			article1.setTitle(article.getTitle());
			article1.setContent(article.getContent());
			DAO.update(article1);
			msg="更新成功";
			
		} catch (Exception e) {
			msg="更新失败";
		}
		
		
		
		Integer a;
        a= (Integer) session.get("teamidid");
       
        team=DAO.findbyid(Team.class, a);
		teamyiji=DAO.findbyid(Team.class, team.getYijiId());
		award = DAO.findbyid(Award.class, 1);
		articles=DAO.findbytwo(Article.class, "state", "teamid",1, team.getId());
		return "toUser";
	}
	
	

	public Team getTeam1() {
		return team1;
	}


	public void setTeam1(Team team1) {
		this.team1 = team1;
	}

	public List<Team> getTeams() {
		return teams;
	}

	public void setTeams(List<Team> teams) {
		this.teams = teams;
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
	public String getKeyName() {
		return keyName;
	}

	public void setKeyName(String keyName) {
		this.keyName = keyName;
	}

	public String getKeyContent() {
		return keyContent;
	}

	public void setKeyContent(String keyContent) {
		this.keyContent = keyContent;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public List<Article> getArticles() {
		return articles;
	}

	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}

	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getOpwd() {
		return opwd;
	}


	public String getXuanze() {
		return xuanze;
	}


	public void setXuanze(String xuanze) {
		this.xuanze = xuanze;
	}


	public void setOpwd(String opwd) {
		this.opwd = opwd;
	}



	public Integer getMemberdj() {
		return memberdj;
	}


	public void setMemberdj(Integer memberdj) {
		this.memberdj = memberdj;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public List<Order1> getOrder3s() {
		return order3s;
	}

	public Integer getNumber1() {
		return number1;
	}

	public void setNumber1(Integer number1) {
		this.number1 = number1;
	}

	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}

	public List<Order2> getOrder2s() {
		return order2s;
	}

	public void setOrder2s(List<Order2> order2s) {
		this.order2s = order2s;
	}

	public Integer getNumber2() {
		return number2;
	}
    
	public Integer getNumber3() {
		return number3;
	}

	public void setNumber3(Integer number3) {
		this.number3 = number3;
	}

	public void setNumber2(Integer number2) {
		this.number2 = number2;
	}

	public void setOrder3s(List<Order1> order3s) {
		this.order3s = order3s;
	}

	public List<PayRecord> getPayRecords() {
		return payRecords;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}


	public Map<String, String> getDatas() {
		return datas;
	}

	public void setDatas(Map<String, String> datas) {
		this.datas = datas;
	}

	public Integer getId1() {
		return id1;
	}

	public void setId1(Integer id1) {
		this.id1 = id1;
	}

	public Integer getId2() {
		return id2;
	}

	public void setId2(Integer id2) {
		this.id2 = id2;
	}


	public void setPayRecords(List<PayRecord> payRecords) {
		this.payRecords = payRecords;
	}

	public List<Collect> getCollects() {
		return collects;
	}

	public Order2 getOrder2() {
		return order2;
	}

	public void setOrder2(Order2 order2) {
		this.order2 = order2;
	}

	public void setCollects(List<Collect> collects) {
		this.collects = collects;
	}

	public List<Order1> getOrder1s() {
		return order1s;
	}

	public void setOrder1s(List<Order1> order1s) {
		this.order1s = order1s;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Integer getType() {
		return type;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Order1 getOrder3() {
		return order3;
	}

	public void setOrder3(Order1 order3) {
		this.order3 = order3;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public Integer getCollectis() {
		return collectis;
	}

	public void setCollectis(Integer collectis) {
		this.collectis = collectis;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public void setType(Integer type) {
		this.type = type;
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

	public List<TeamAward> getTeamAwards() {
		return teamAwards;
	}

	public void setTeamAwards(List<TeamAward> teamAwards) {
		this.teamAwards = teamAwards;
	}

	public Peizhi getPeizhi() {
		return peizhi;
	}



	public void setPeizhi(Peizhi peizhi) {
		this.peizhi = peizhi;
	}


	public void setContents(List<Content> contents) {
		this.contents = contents;
	}

	public Nongli getNongli() {
		return nongli;
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



	public Collect getCollect() {
		return collect;
	}

	public void setCollect(Collect collect) {
		this.collect = collect;
	}

	public void setNongli(Nongli nongli) {
		this.nongli = nongli;
	}
	public List<Team> getAllyiji() {
		return allyiji;
	}

	public void setAllyiji(List<Team> allyiji) {
		this.allyiji = allyiji;
	}

	public List<Team> getAllerji() {
		return allerji;
	}

	public void setAllerji(List<Team> allerji) {
		this.allerji = allerji;
	}
	public Team getTeamyiji() {
		return teamyiji;
	}



	public void setTeamyiji(Team teamyiji) {
		this.teamyiji = teamyiji;
	}

	public Team getTeamerji() {
		return teamerji;
	}

	public void setTeamerji(Team teamerji) {
		this.teamerji = teamerji;
	}

	public PayRecord getPayRecord() {
		return payRecord;
	}

	public void setPayRecord(PayRecord payRecord) {
		this.payRecord = payRecord;
	}

	public Fenxiao getFenxiao() {
		return fenxiao;
	}

	public void setFenxiao(Fenxiao fenxiao) {
		this.fenxiao = fenxiao;
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

	public JsonResult getJsonresult() {
		return jsonresult;
	}

	public void setJsonresult(JsonResult jsonresult) {
		this.jsonresult = jsonresult;
	}

	public List<Banner> getBanners() {
		return banners;
	}

	public void setBanners(List<Banner> banners) {
		this.banners = banners;
	}



	public String getOpenid() {
		return openid;
	}



	public void setOpenid(String openid) {
		this.openid = openid;
	}
	
	
}