package action;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import pojo.Banner;
import pojo.Course;

import pojo.JsonResult;


import pojo.Order1;
import pojo.Order2;
import pojo.Peizhi;
import pojo.Product;
import pojo.Sb;
import pojo.Taocan;
import pojo.Team;
import pojo.TimeUtil;
import pojo.Yewu;

import util.Sendmoney;

import com.utils.GetWxOrderno;
import com.utils.RequestHandler;
import com.utils.Sha1Util;
import com.utils.TenpayUtil;

import dao.DAO;
import dao.Order1DAO;
import dao.Order2DAO;
import dao.TeamDAO;
/**
 * 订单
 * 
 * @author Administrator
 * 
 */
public class OrderAction extends BaseAction {
	private static final HttpServletRequest HttpServletRequest = null;
	private Order2 order2;
	private Order1 order1;
	
	private Integer deid;//选择
	
	private List<Order2> order2s;
	private List<Order1> order1s;
	
	private Peizhi peizhi;
	private String time1;
	private String time2;
	private Product product;
	private String keyword;
	
	private Integer allpoint;
	private double allprice;//商品的价格
	
	private Course course;
	private List<Course> courses;
	
	private Taocan taocan;
	private List<Taocan> taocans;
	
	private Integer xuanze;//选择
	private Banner banner;
	
	private Integer type;
	private String openid;
	private JsonResult jsonresult;
	private Integer orderid;
	private Sb shangbiaoSb;
	
	//点击购买时
	private Integer num;
	private Integer xiaoxiangnum;
	private Integer pruductid;
	private Yewu yewu;
	private String title;
	private double totleprice;
	//支付参数
	private String appsecret;
	private String partner;
	private String partnerkey;
	private String appid;
	private String oid;
	private double tuikuan;
	//=====================================前端=====================================
	
	
	//查询我的所有订单
	public String alldingdan(){
        jsonresult = new JsonResult();
		
		team=DAO.findbystringone(Team.class, "openId", openid);
		
		order2s=Order2DAO.findall(Order2.class);
		
		jsonresult.setObjs(order2s);
		jsonresult.setObject(team);
		System.out.println("order2s==="+order2s);
		return "jsonresult";
	}
	public Integer getOrderid() {
		return orderid;
	}
	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}
	public String waitdingdan(){
		
		jsonresult = new JsonResult();
		
		team=DAO.findbystringone(Team.class, "openId", openid);
		//System.out.println("=========="+type);
		order2s=Order2DAO.findbytwo(Order2.class, "teamid", "status", team.getId(), type);
		
		jsonresult.setObjs(order2s);
		jsonresult.setObject(team);
		
		return "jsonresult";
		
		
		
	}
	//准备提交订单
	public String zbtijiao(){
		
		double allprice=0;
		jsonresult = new JsonResult();
		
		if (type==0) {
			yewu=DAO.findbyid(Yewu.class, pruductid);
			
			title=yewu.getBiaoti();
			
			jsonresult.setObject(yewu);
			jsonresult.setIntint(totleprice);
			jsonresult.setRes1(title);
			
	     }else if (type==1) {
	    	 System.out.println("pruductid======"+pruductid);
	    	 shangbiaoSb=DAO.findbyid(Sb.class, pruductid);
				allprice=shangbiaoSb.getPrice();
				title=shangbiaoSb.getTitle();
				
				jsonresult.setObject(shangbiaoSb);
				jsonresult.setIntint(allprice);
				jsonresult.setRes1(title);
			
		}
		
		
		return "jsonresult";
	}
	//查看订单
	public String lookdingdan(){
		
		jsonresult = new JsonResult();
		
		order2=DAO.findbyid(Order2.class, orderid);
		
		jsonresult.setObject(order2);
		
		
		return "jsonresult";
	}
	//提交订单
	public String tijiaodingdan(){
		System.out.println("==============="+"xiaoxiangnum=="+xiaoxiangnum);
		jsonresult = new JsonResult();
		order2=new Order2();
		team=DAO.findbystringone(Team.class, "openId", openid);
		
		String orderId = TimeUtil.getOrderId();
		orderId+=(int)(Math.random()*1000);
		//业务
		if(type==0){
			yewu=DAO.findbyid(Yewu.class, pruductid);
			order2.setCoursetitle(yewu.getBiaoti());
			order2.setCourseimg(yewu.getImg());
			order2.setPrice((double)yewu.getPrice());
			allprice=num*yewu.getPrice()*100.0+xiaoxiangnum*yewu.getXiaoxiang()*100.0;
			allprice=allprice/100.0;
			order2.setAllprice(allprice);
			//判断订单状态
			order2.setStatus(0);
		//商标
		}else if (type==1) {
			shangbiaoSb=DAO.findbyid(Sb.class, pruductid);
			order2.setCoursetitle(shangbiaoSb.getTitle());
			order2.setCourseimg(shangbiaoSb.getImg());
			order2.setPrice((double)shangbiaoSb.getPrice());
			allprice=num*shangbiaoSb.getPrice();
			order2.setAllprice(allprice);
			//判断订单状态
			order2.setStatus(0);
			
		}
		
		order2.setTeam(team.getNickName());
		order2.setTeamid(team.getId());
		order2.setCourseid(pruductid);
		order2.setType(type);
		order2.setOid(orderId);
		order2.setNum(num);
		
		DAO.save(order2);
		//下单是否成功
		jsonresult.setIntint(0.0);
		
		return "jsonresult";
	}
	//取消订单
	public String quxiao(){
		jsonresult=new JsonResult();
		if (orderid!=0) {
			
			order2=DAO.findbyid(Order2.class, orderid);
			
			
			System.out.println("order2=="+order2);
			
			DAO.delete(DAO.findbyid(Order2.class, orderid));
			jsonresult.setRes1("取消订单成功");
		}else {
			jsonresult.setRes1("取消订单失败");
		}
		
		
		return "jsonresult";
		
	}
	public boolean isLatestWeek(Date addtime,Date now){  
	    Calendar calendar = Calendar.getInstance();  //得到日历  
	    calendar.setTime(now);//把当前时间赋给日历  
	    calendar.add(Calendar.DAY_OF_MONTH, -7);  //设置为7天前  
	    Date before7days = calendar.getTime();   //得到7天前的时间  
	    if(before7days.getTime() < addtime.getTime()){  
	        return true;  
	    }else{  
	        return false;  
	    }  
	}
	//退款
	public String tuikuan(){
		jsonresult=new JsonResult();
		order2=DAO.findbyid(Order2.class, orderid);
		if (order2!=null) {
			
			
			
			Date now = new Date(); 
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date datetime = null;
			
			try {
				datetime = dateFormat.parse(order2.getTime());
				if (isLatestWeek(datetime,now)) {
					
					order2.setStatus(2);
					order2.setTuikuanstatus(3);
					order2.setIsfanyong(1);
					DAO.update(order2);
					jsonresult.setRes1("订单退款交由管理审核");
				}else {
					jsonresult.setRes1("申请失败，订单超过7天退款时间");
				}
				
			} catch (ParseException e) {
				
				e.printStackTrace();
			}
	        
	        
		}else {
			jsonresult.setRes1("退款失败");
		}
		
		
		return "jsonresult";
		
	}
	
	//支付判断库存
	public String findorer(){
		jsonresult=new JsonResult();
		//SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//String time = d.format(new Date());
		
		order2=DAO.findbyid(Order2.class, orderid);
		if (order2.getType()==1) {
			shangbiaoSb=DAO.findbyid(Sb.class, order2.getCourseid());
			if (shangbiaoSb.getState()==1) {
				jsonresult.setRes1("不足");
			}
			
		}
		
		jsonresult.setObject(order2);
		return "jsonresult";
	}
	//预支付 
	public String zhifu(){
		
		order2=DAO.findbystringone(Order2.class, "oid", oid);
		//总金额以分为单位，不带小数点
		String finalmoney = (int)(order2.getAllprice()*100)+"";
		//String finalmoney = (int)(0.01*100)+"";
		String out_trade_no = order2.getOid();
		// 获取openId后调用统一支付接口https://api.mch.weixin.qq.com/pay/unifiedorder
		String currTime = TenpayUtil.getCurrTime();
		// 8位日期
		String strTime = currTime.substring(8, currTime.length());
		// 四位随机数
		String strRandom = TenpayUtil.buildRandom(4) + "";
		// 10位序列号,可以自行调整。
		String strReq = strTime + strRandom;
		// 商户号
		String mch_id = "1230199602";

		String nonce_str = strReq;
		// 商品描述根据情况修改(无要求就暂用公众号名称)
		String body = "商标小程序";
		// 商户订单号
		// 订单生成的机器 IP
		String spbill_create_ip = org.apache.struts2.ServletActionContext
				.getRequest().getRemoteAddr();
		// = ((ServletRequest) request).getRemoteAddr();
		// 这里notify_url是 支付完成后微信发给该链接信息，可以判断会员是否支付成功，改变订单状态等。
		String notify_url = "https://shangbiao.xmyunxin.com/notify1!notify1.action";
		String trade_type = "JSAPI";
		appid = "wx4762347a01c410da";
		SortedMap<String, String> packageParams = new TreeMap<String, String>();
		packageParams.put("appid", "wx4762347a01c410da");
		packageParams.put("mch_id", mch_id);
		packageParams.put("nonce_str", nonce_str);
		packageParams.put("body", body);
		packageParams.put("out_trade_no", out_trade_no);
		packageParams.put("total_fee", finalmoney);//finalmoney
		packageParams.put("spbill_create_ip", spbill_create_ip);
		packageParams.put("notify_url", notify_url);
		packageParams.put("trade_type", trade_type);
		packageParams.put("openid", openid);

		HttpServletResponse HttpServletResponse = null;
		RequestHandler reqHandler = new RequestHandler(HttpServletRequest,
				HttpServletResponse);
		reqHandler.init("wx4762347a01c410da", "121a7932fb06791ee86a017d502a6639", "liu776392liu776392liu776392liu77");

		String sign = reqHandler.createSign(packageParams);
		String xml = "<xml>" + "<appid>" + appid + "</appid>" + "<mch_id>"
				+ mch_id + "</mch_id>" + "<nonce_str>" + nonce_str
				+ "</nonce_str>" + "<sign>" + sign + "</sign>"
				+ "<body><![CDATA[" + body + "]]></body>"
				+ "<out_trade_no>" + out_trade_no + "</out_trade_no>"
				+ "<total_fee>" + finalmoney + "</total_fee>"//finalmoney
				+ "<spbill_create_ip>" + spbill_create_ip
				+ "</spbill_create_ip>" + "<notify_url>" + notify_url
				+ "</notify_url>" + "<trade_type>" + trade_type
				+ "</trade_type>" + "<openid>" + openid + "</openid>"
				+ "</xml>";
		String createOrderURL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
		String prepay_id = "";
		try {
			prepay_id = new GetWxOrderno().getPayNo(createOrderURL, xml);
			if (prepay_id.equals("")) {
				msg = "统一支付接口获取预支付订单出错";
			}
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.err.println("统一支付接口获取预支付订单出错:"+e1);
		}
		SortedMap<String, String> finalpackage = new TreeMap<String, String>();
		String timestamp = Sha1Util.getTimeStamp();
		String nonceStr2 = nonce_str;
		String prepay_id2 = "prepay_id=" + prepay_id;
		String packages = prepay_id2;

		finalpackage.put("appId", appid);
		finalpackage.put("timeStamp", timestamp);
		finalpackage.put("nonceStr", nonceStr2);
		finalpackage.put("package", packages);
		finalpackage.put("signType", "MD5");
		String finalsign = reqHandler.createSign(finalpackage);

		/*session.put("package", packages);
		session.put("sign", finalsign);
		session.put("appid", appid);
		session.put("timeStamp", timestamp);
		session.put("nonceStr", nonceStr2);*/
		jsonresult = new JsonResult();
		jsonresult.setRes1(packages);
		jsonresult.setRes2(finalsign);
		jsonresult.setRes3(timestamp);
		jsonresult.setRes4(nonceStr2);
		jsonresult.setRes5(out_trade_no);
		System.out.println("到这了");
		return "jsonresult";
	}
	
	
	//==============================报名===========================
	//立即报名活动内容
	public String baoming(){
		team = (Team)session.get("team");
		if(team==null){
			try {
				response.sendRedirect(wx_index_url);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "kcorder";
		}
		if(team.getPhone()==null||"".equals(team.getPhone()))
			return "realzhuce";
		
		String orderId = TimeUtil.getOrderId();
		orderId+=(int)(Math.random()*1000);
		
		
		banner = DAO.findbyid(Banner.class,banner.getId());
		
		Order1 or1 = new Order1();
		or1.setTeamid(team.getId());
		or1.setCourseid(0);
		or1.setOid(orderId);
		or1.setCoursetitle(banner.getHdtitle());
		or1.setCourseimg(banner.getImg());
		or1.setPrice(banner.getHdMoney());
		
		or1.setTeam(team.getNickName());
		or1.setPhone(team.getPhone());
		
		award = DAO.findbyid(Award.class,1);
		
		
			
		session.put("price",banner.getHdMoney());//商品的总价
		session.put("title",banner.getHdtitle());
		session.put("img",banner.getImg());
		session.put("typeid",banner.getId());
		session.put("type",2);
		session.put("orderId",orderId);
		session.put("allpoint", allpoint);
		session.put("teacherid", 0);
		return "kcorder";
	}
	
	
	
	//====================================================套餐====================================================
	//立即购买套餐
	public String buytaocan() {
		team = (Team)session.get("team");
		if(team==null){
			try {
				response.sendRedirect(wx_index_url);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "kcorder";
		}
		
		if(team.getPhone()==null||"".equals(team.getPhone()))
			return "realzhuce";
		
		String orderId = TimeUtil.getOrderId();
		orderId+=(int)(Math.random()*1000);
		
		
		taocan = DAO.findbyid(Taocan.class,taocan.getId());
		
		order2 = Order1DAO.findmyorder2(team.getId(),1, taocan.getId());
		if(order2!=null){
			return myorder();
		}
		
		String[] ids = taocan.getCourseids().split(",");
		System.err.println(ids.length);
		courses = new ArrayList<Course>();
		for(int i = 0;i<ids.length;i++){
			System.err.println(ids[i]);
			courses.add(DAO.findbyid(Course.class,Integer.valueOf(ids[i])));
		}
		
		Order1 or1;
		for(Course course :courses){
			or1= new Order1();
			or1.setTeamid(team.getId());
			or1.setCourseid(course.getId());
			or1.setOid(orderId);
			or1.setCoursetitle(course.getTitle());
			or1.setCourseimg(course.getImg());
			or1.setPrice(course.getMoney());
			or1.setTeam(team.getNickName());
			or1.setCourse(course.getTitle());
			or1.setPhone(team.getPhone());
			if(course.getMoney()==0){
				or1.setStatus(1);
			}
			or1.setTeacherid(course.getTeacherId());
			DAO.save(or1);
		}
		
		award = DAO.findbyid(Award.class,1);
		
			
		session.put("price",taocan.getMoney());//商品的总价
		session.put("title",taocan.getName());
		session.put("img",taocan.getImg());
		session.put("typeid",taocan.getId());
		session.put("type",1);
		session.put("orderId",orderId);
		session.put("allpoint", allpoint);
		session.put("teacherid", 0);
		return "kcorder";
	}
	
	
	//==============================课程==========================
	//立即购买结算
	public String buy() {
		team = (Team)session.get("team");
		if(team==null){
			try {
				response.sendRedirect(wx_index_url);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "pay";
		}
		if(team.getPhone()==null||"".equals(team.getPhone()))
			return "realzhuce";
		
		course = DAO.findbyid(Course.class,course.getId());
		//获取购买记录
		order2 = Order1DAO.findmyorder2(team.getId(),0, course.getId());
		if(order1!=null){
			session.put("course",course);
			return "thecourse";
		}
		
		String orderId = TimeUtil.getOrderId();
		orderId+=(int)(Math.random()*1000);
		Order1 or1 = new Order1();
		or1.setTeamid(team.getId());
		or1.setCourseid(course.getId());
		or1.setOid(orderId);
		or1.setCoursetitle(course.getTitle());
		or1.setCourseimg(course.getImg());
		or1.setPrice(course.getMoney());
		or1.setTeam(team.getNickName());
		or1.setCourse(course.getTitle());
		or1.setPhone(team.getPhone());
		
		or1.setTeacherid(course.getTeacherId());
		
		if(course.getMoney()==0){
			or1.setStatus(1);
		}
		
		DAO.save(or1);
		
		if(course.getMoney()==0){
			order2 = new Order2();
			/*order2.setTeamId(team.getId());
			order2.setOid(orderId);
			order2.setType(0);
			order2.setTypeid(course.getId());
			order2.setFhStatus(1);
			order2.setPrice(0.0);
			order2.setPoint(0);
			order2.setPrice2(0.0);
			order2.setPhone(team.getPhone());
			order2.setName(team.getNickName());
			order2.setBeizhu("免费课程");
			order2.setTitle(course.getTitle());
			order2.setImg(course.getImg());
			order2.setTeacherid(course.getTeacherId());*/
			DAO.save(order2);
			session.put("course",course);
			return "thecourse";
		}
		award = DAO.findbyid(Award.class,1);
		
		
		courses = new ArrayList<Course>();
		courses.add(course);
		
		
		
		session.put("price",course.getMoney());//商品的总价
		session.put("typeid",course.getId());
		session.put("title",course.getTitle());
		session.put("img",course.getImg());
		session.put("type",0);
		session.put("orderId",orderId);
		session.put("allpoint", allpoint);
		session.put("teacherid", course.getTeacherId());
		return "kcorder";
	}
	
	//确认订单，去付款
	public String tijiaoorder() {
		team = (Team)session.get("team");
		if(team==null){
			try {
				response.sendRedirect(wx_index_url);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "pay";
		}
		String orderId;
		try {
			orderId = (String)session.get("orderId");
			if(orderId==null)
				return "index";
		} catch (Exception e) {
			return "index";
		}
		Integer teacherid = (Integer) session.get("teacherid");
		Integer typeid = (Integer) session.get("typeid");
		award = DAO.findbyid(Award.class,1);
		Double price = (Double) session.get("price");
		Integer type = (Integer) session.get("type");
		team = DAO.findbyid(Team.class,team.getId());
		
		/*order2 = new Order2();
		order2.setTeamId(team.getId());
		order2.setOid(orderId);
		order2.setType(type);
		order2.setTypeid(typeid);
		order2.setTitle((String)session.get("title"));
		order2.setImg((String)session.get("img"));*/
		
		allpoint=0;
		price = (Double) session.get("price");
		Double price2 = 0.0;
		//order2.setBeizhu("无");
		//使用所有积分
		if(xuanze==1){
			allpoint = (Integer) session.get("allpoint");
			//price2 = Math.round(allpoint*100/award.getAward())/100.0;
			price =Math.round(price*100 -price2*100)/100.0;
			if(price<0.01){
				price=0.01;
			}
			/*order2.setBeizhu("使用"+allpoint+"积分抵扣"+price2+"元");*/
		}
		
		order2.setPrice(price);
		/*order2.setPoint(allpoint);
		order2.setPrice2(price2);
		order2.setPhone(team.getPhone());
		order2.setName(team.getNickName());
		
		order2.setTeacherid(teacherid);*/
		
		DAO.save(order2);
		yuzhifu(team.getOpenId(), order2.getPrice(),order2.getOid());
		
		session.remove("orderId");
		session.remove("price");
		session.remove("type");
		session.remove("allpoint");
		session.remove("typeid");
		session.remove("title");
		session.remove("img");
		
		return "pay";
	}
	
	
	public Integer getXiaoxiangnum() {
		return xiaoxiangnum;
	}
	public void setXiaoxiangnum(Integer xiaoxiangnum) {
		this.xiaoxiangnum = xiaoxiangnum;
	}
	//查询我的所有订单
	public String myorder(){
		team = (Team)session.get("team");
		if(team==null){
			try {
				response.sendRedirect(wx_index_url);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "pay";
		}
		
		order2s=Order2DAO.findmyorder(team.getId());
		
		for(Order2 order2 : order2s){
			courses = new ArrayList<Course>();
			if(order2.getType()<2){
				order1s=DAO.findbystring(Order1.class, "oid", order2.getOid());
				for(Order1 o1 : order1s){
					course = DAO.findbyid(Course.class,o1.getCourseid());
					course.setCollectid(o1.getPingfen());//临时保存order1评分
					course.setOrder1id(o1.getId());//临时保存order1id
					courses.add(course);
				}
				//order2.setCourses(courses);
			}else{
				//banner = DAO.findbyid(Banner.class,order2.getTypeid());
			}
		}
		
		return "myorder";
	}
	
	
	//为课程打分
	public String pingfen(){
		team = (Team)session.get("team");
		if(team==null){
			try {
				response.sendRedirect(wx_index_url);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "pay";
		}
		try {
			Order1 pingfen = DAO.findbyid(Order1.class,order1.getId());
			if(pingfen!=null&&order1.getPingfen()>0)
				pingfen.setPingfen(order1.getPingfen());
			
			DAO.update(pingfen);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return  myorder();
	}
	
	public String theorder(){
		order2=DAO.findbyid(Order2.class, order2.getId());
		order1s=DAO.findbystring(Order1.class, "oid", order2.getOid());
		//order2.setOrder1s(order1s);
		
		return "mytheorder";
	}
	
	
	//========================================后台部分=================================================
	// 所有订单
	public String findAll(){
		
			
		
		size=15;
		allpage=(Order2DAO.order2num(type)+size-1)/size;
		//allpage = (DAO.findnum(Order2.class)+size-1)/size;
		System.out.println("allpage="+allpage);
		checkpage();
		order2s=Order2DAO.findorder2bypage(type,page, size);
		//order2s=Order2DAO.findByPageOrderByIdStatus(Order2.class, page, size);
		System.out.println(order2s);
		allprice = Order2DAO.findhe("price");
		
		return "all";
		
	}
	
	//退款审核
	public String tongyi(){
		order2=DAO.findbyid(Order2.class, order2.getId());
		order2.setTuikuanstatus(1);
		int  num=0;
		
		type=2;
		team=DAO.findbyid(Team.class, order2.getTeamid());
		
		int code = Sendmoney.refund1(order2.getOid(), order2.getAllprice(), tuikuan, null, team.getOpenId());
		if (code==1) {
			
			if (order2.getType()==0) {
					yewu=DAO.findbyid(Yewu.class, order2.getCourseid());
					if (yewu!=null&&yewu.getXiaoshounum()!=0) {
						num=yewu.getXiaoshounum();
						yewu.setXiaoshounum(num-order2.getNum());
						DAO.update(yewu);
						
					}
				}else if (order2.getType()==1) {
					Sb sb=DAO.findbyid(Sb.class, order2.getCourseid());
					if (sb!=null&&sb.getState()==1) {
						sb.setState(0);
					
						DAO.update(sb);
						
					}
					
				}
			order2.setIsfanyong(1);
				DAO.update(order2);
				
				msg="退款成功！";
			
		}else {
			msg="退款失败，请联系客服";
		}
		
		return findAll();
		
		
	}
	//退款审核1
	public String jujue(){
		
		order2=DAO.findbyid(Order2.class, order2.getId());
		order2.setTuikuanstatus(2);
		DAO.update(order2);
		type=2;
		return findAll();
		
	}
	//查看订单详情
	/*public String toOrder(){
		order2=DAO.findbyid(Order2.class,order2.getId());
		order1s = Order1DAO.findByOid(order2.getOid());
		
		courses = new ArrayList<Course>();
		if(order2.getType()<2){
			for(Order1 o1 : order1s){
				course = DAO.findbyid(Course.class,o1.getCourseid());
				course.setCollectid(o1.getPingfen());//临时保存order1评分
				course.setOrder1id(o1.getId());//临时保存order1id
				courses.add(course);
			}
			order2.setCourses(courses);
			if(order2.getType()==1)
				taocan = DAO.findbyid(Taocan.class,order2.getTypeid());
		}else{
			banner = DAO.findbyid(Banner.class,order2.getTypeid());
		}
		
		return "toorder";
	}*/
	//删除订单
	public String deleteById() {
	    if(deid!=null){
			
				DAO.deletebyid(Order2.class, deid);
			
			msg = "删除成功";
	    }else{
	    	msg = "删除失败";
	    }
		return findAll();
	}
	public Sb getShangbiaoSb() {
		return shangbiaoSb;
	}
	public void setShangbiaoSb(Sb shangbiaoSb) {
		this.shangbiaoSb = shangbiaoSb;
	}
	//按订单号查询
	public String findbyoid(){
		
		allpage=1;
		order2s=DAO.findbystring(Order2.class,"oid", keyword);
		allprice=0.0;
		for(Order2 o2:order2s){
			allprice =Math.round(allprice*100+o2.getPrice()*100)/100.0;
		}
		if(order2s.size()==0)
			msg="未找到该订单";
		
		return "all";
	}
	//按时间查询
	public String findbytime(){
		admin = (Admin) session.get("admin");
		if(admin==null)
			return "all";
		
		allpage=1;
		
		order2s=Order2DAO.findbytime1(time1, time2, type);
		
		allprice=0.0;
		for(Order2 o2:order2s){
			allprice =Math.round(allprice*100+o2.getPrice()*100)/100.0;
		}
		if(order2s.size()==0)
			msg="未找到该订单";
		
		return "all";
	}
	
	
	
	
	//预支付						//用户唯一 		 //交易金额		//订单ID	
	public  void  yuzhifu(String openid, Double finalmoney1, String oid  ){
		
		peizhi = DAO.findone(Peizhi.class);
		// 商户相关资料
		String appid = peizhi.getAppid();
		String appsecret = peizhi.getAppsecret();
		String partner = peizhi.getPartner();
		String partnerkey = peizhi.getPartnerkey();

		//将金额变为分为单位
		//finalmoney = finalmoney+"00";
		
		String finalmoney = String.format("%.2f",finalmoney1);
		finalmoney = finalmoney.replace(".", "");
		finalmoney = String.valueOf(Integer.valueOf(finalmoney));
		System.err.println(finalmoney);
		
		//测试用1分钱
		finalmoney = "1";
		
		// 获取openId后调用统一支付接口https://api.mch.weixin.qq.com/pay/unifiedorder
		String currTime = TenpayUtil.getCurrTime();
		// 8位日期
		String strTime = currTime.substring(8, currTime.length());
		// 四位随机数
		String strRandom = TenpayUtil.buildRandom(4) + "";
		// 10位序列号,可以自行调整。
		String strReq = strTime + strRandom;
		// 商户号
		String mch_id = partner;

		String nonce_str = strReq;
		// 商品描述
		// String body = describe;

		// 商品描述根据情况修改
		String body = "洛奇教育";
		// 商户订单号
		String out_trade_no = oid;
		HttpSession request = null;
		// int intMoney = Integer.parseInt(finalmoney);
		//总金额以分为单位，不带小数点
		// int total_fee = intMoney;
		// 订单生成的机器 IP
		String spbill_create_ip = org.apache.struts2.ServletActionContext
		.getRequest().getRemoteAddr();
		// = ((ServletRequest) request).getRemoteAddr();
		// 这里notify_url是 支付完成后微信发给该链接信息，可以判断会员是否支付成功，改变订单状态等。
		String notify_url = wx_notify1_url;
		String trade_type = "JSAPI";

		SortedMap<String, String> packageParams = new TreeMap<String, String>();
		packageParams.put("appid", appid);
		packageParams.put("mch_id", mch_id);
		packageParams.put("nonce_str", nonce_str);
		packageParams.put("body", body);
		packageParams.put("out_trade_no", out_trade_no);
		packageParams.put("total_fee", finalmoney);
		packageParams.put("spbill_create_ip", spbill_create_ip);
		packageParams.put("notify_url", notify_url);
		packageParams.put("trade_type", trade_type);
		packageParams.put("openid", openid);

		HttpServletResponse HttpServletResponse = null;
		RequestHandler reqHandler = new RequestHandler(HttpServletRequest,
				HttpServletResponse);
		reqHandler.init(appid, appsecret, partnerkey);

		String sign = reqHandler.createSign(packageParams);
		String xml = "<xml>" + "<appid>" + appid + "</appid>" + "<mch_id>"
		+ mch_id + "</mch_id>" + "<nonce_str>" + nonce_str
		+ "</nonce_str>" + "<sign>" + sign + "</sign>"
		+ "<body><![CDATA[" + body + "]]></body>" +

		"<out_trade_no>" + out_trade_no + "</out_trade_no>" +

		"<total_fee>" + finalmoney + "</total_fee>"
		+ "<spbill_create_ip>" + spbill_create_ip
		+ "</spbill_create_ip>" + "<notify_url>" + notify_url
		+ "</notify_url>" + "<trade_type>" + trade_type
		+ "</trade_type>" + "<openid>" + openid + "</openid>"
		+ "</xml>";

		String createOrderURL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
		String prepay_id = "";
		try {
			prepay_id = new GetWxOrderno().getPayNo(createOrderURL, xml);
			if (prepay_id.equals("")) {

				request.setAttribute("ErrorMsg", "统一支付接口获取预支付订单出错");

			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		SortedMap<String, String> finalpackage = new TreeMap<String, String>();
		String timestamp = Sha1Util.getTimeStamp();
		String nonceStr2 = nonce_str;
		String prepay_id2 = "prepay_id=" + prepay_id;
		String packages = prepay_id2;

		finalpackage.put("appId", appid);
		finalpackage.put("timeStamp", timestamp);
		finalpackage.put("nonceStr", nonceStr2);
		finalpackage.put("package", packages);
		finalpackage.put("signType", "MD5");
		String finalsign = reqHandler.createSign(finalpackage);

		session.put("package", packages);
		session.put("sign", finalsign);
		session.put("appid", appid);
		session.put("timeStamp", timestamp);
		session.put("nonceStr", nonceStr2);
	}
	

	/**
	 * 导出订单到Excel
	 * @return
	 * @throws Exception
	 */
	/*public String exportOrder2() throws Exception {
		//String excelName=ServletActionContext.getServletContext().getRealPath("/mp/moban.xls");
		// 获取需要导出的对象的list
//		if(keyword==null)
//			keyword="";
//		keyword="%"+keyword+"%";
//		//System.out.println("key:"+keyword);
//		if(order2.getFhStatus()==-1)
//			orders = Order2DAO.findbytimefhstatus(time1, time2,keyword);
//		else
//			orders = Order2DAO.findbytimefhstatus(time1, time2,order2.getFhStatus(),keyword);
//		
//		System.out.println("test orders"+orders.size());
		admin = (Admin) session.get("admin");
		if("".equals(time1)){
			time1 = "2010-01-01";
		}
		if("".equals(time2)){
			time2 = TimeUtil.getStringShort();
		}
		order2s= Order2DAO.findbytime1(time1, time2,order2.getFhStatus(),admin.getId());
		
		//订单号  订单总价 收件人 联系电话 地址 下单时间 快递公司 快递单号 订单状态
		String[] tableHeader = { "订单号", "订单总价", "收件人", "联系电话", "地址", "下单时间", "快递公司" ,"快递单号" ,"订单状态"};
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
				for (int i = 0; i < order2s.size(); i++) {
					order2 = (Order2) order2s.get(i); // 获取对象
					row = sheet.createRow((short) (i + 1)); // 创建第i+1行
					row.setHeight((short) 400); // 设置行高

					cell = row.createCell((short) 0); // 创建第i+1行第0列
					cell.setEncoding(HSSFCell.ENCODING_UTF_16);
					cell.setCellValue(order2.getOid()); // 设置第i+1行第1列的值
					cell.setCellStyle(style); // 设置风格

					cell = row.createCell((short) 1);
					cell.setEncoding(HSSFCell.ENCODING_UTF_16);
					cell.setCellValue(order2.getPrice());
					cell.setCellStyle(style); // 设置风格
					
					cell = row.createCell((short) 2);
					cell.setEncoding(HSSFCell.ENCODING_UTF_16);
					cell.setCellValue(order2.getName());
					cell.setCellStyle(style); // 设置风格
					
					cell = row.createCell((short) 3);
					cell.setEncoding(HSSFCell.ENCODING_UTF_16);
					cell.setCellValue(order2.getPhone());
					cell.setCellStyle(style); 
					
					cell = row.createCell((short) 4);
					cell.setEncoding(HSSFCell.ENCODING_UTF_16);
					cell.setCellStyle(style); 
					
					cell = row.createCell((short) 5);
					cell.setEncoding(HSSFCell.ENCODING_UTF_16);
					cell.setCellStyle(style); 
						
					
					cell = row.createCell((short) 6);
					cell.setEncoding(HSSFCell.ENCODING_UTF_16);
					cell.setCellStyle(style); 
					
					
					cell = row.createCell((short) 7);
					cell.setEncoding(HSSFCell.ENCODING_UTF_16);
					cell.setCellStyle(style); 
					
					cell = row.createCell((short) 8);
					cell.setEncoding(HSSFCell.ENCODING_UTF_16);
					if(order2.getFhStatus()==0){
						cell.setCellValue("待付款");
					}else if(order2.getFhStatus()==1) {
						cell.setCellValue("待发货");
					} else if(order2.getFhStatus()==2) {
						cell.setCellValue("已发货");
					} else {
						cell.setCellValue("已收货");
					}
					
					cell.setCellStyle(style); 

				}

			

		} catch (Exception e) {
			e.printStackTrace();
		}

		HttpServletResponse response = null; // 创建一个HttpServletResponse对象
		OutputStream out = null; // 创建一个输出流对象
		try {
			response = ServletActionContext.getResponse(); // 初始化HttpServletResponse对象
			out = response.getOutputStream(); //

			String headerStr = "商品订单列表";
			headerStr = new String(headerStr.getBytes("utf-8"), "ISO8859-1"); // headerString为中文时转码
			response.setHeader("Content-disposition", "attachment; filename="
					+ headerStr + ".xls"); // filename是下载的xls的名，建议最好用英文
			response.setContentType("application/msexcel;charset=UTF-8");// 设置类型
			response.setHeader("Pragma", "No-cache"); // 设置头
			response.setHeader("Cache-Control", "no-cache");// 设置头
			response.setDateHeader("Expires", 0); // 设置日期头
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
*/



	public Order2 getOrder2() {
		return order2;
	}




	public Order1 getOrder1() {
		return order1;
	}




	public List<Order2> getOrder2s() {
		return order2s;
	}




	public Yewu getYewu() {
		return yewu;
	}
	public void setYewu(Yewu yewu) {
		this.yewu = yewu;
	}
	public List<Order1> getOrder1s() {
		return order1s;
	}




	public Peizhi getPeizhi() {
		return peizhi;
	}




	public Integer getDeid() {
		return deid;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setDeid(Integer deid) {
		this.deid = deid;
	}

	public static HttpServletRequest getHttpservletrequest() {
		return HttpServletRequest;
	}

	public String getTime1() {
		return time1;
	}




	public String getTime2() {
		return time2;
	}




	public Product getProduct() {
		return product;
	}




	public double getTuikuan() {
		return tuikuan;
	}
	public void setTuikuan(double tuikuan) {
		this.tuikuan = tuikuan;
	}
	public String getKeyword() {
		return keyword;
	}




	public Integer getAllpoint() {
		return allpoint;
	}




	public Integer getPruductid() {
		return pruductid;
	}
	public void setPruductid(Integer pruductid) {
		this.pruductid = pruductid;
	}
	public JsonResult getJsonresult() {
		return jsonresult;
	}


	public void setJsonresult(JsonResult jsonresult) {
		this.jsonresult = jsonresult;
	}


	public String getOpenid() {
		return openid;
	}


	public void setOpenid(String openid) {
		this.openid = openid;
	}


	public double getAllprice() {
		return allprice;
	}




	public void setOrder2(Order2 order2) {
		this.order2 = order2;
	}




	public void setOrder1(Order1 order1) {
		this.order1 = order1;
	}




	public void setOrder2s(List<Order2> order2s) {
		this.order2s = order2s;
	}




	public void setOrder1s(List<Order1> order1s) {
		this.order1s = order1s;
	}




	public void setPeizhi(Peizhi peizhi) {
		this.peizhi = peizhi;
	}




	public void setTime1(String time1) {
		this.time1 = time1;
	}




	public void setTime2(String time2) {
		this.time2 = time2;
	}




	public void setProduct(Product product) {
		this.product = product;
	}




	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}




	public void setAllpoint(Integer allpoint) {
		this.allpoint = allpoint;
	}




	public void setAllprice(double allprice) {
		this.allprice = allprice;
	}




	public Course getCourse() {
		return course;
	}




	public void setCourse(Course course) {
		this.course = course;
	}




	public List<Course> getCourses() {
		return courses;
	}




	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}




	public Integer getXuanze() {
		return xuanze;
	}




	public void setXuanze(Integer xuanze) {
		this.xuanze = xuanze;
	}

	public Taocan getTaocan() {
		return taocan;
	}

	public List<Taocan> getTaocans() {
		return taocans;
	}

	public void setTaocan(Taocan taocan) {
		this.taocan = taocan;
	}

	public void setTaocans(List<Taocan> taocans) {
		this.taocans = taocans;
	}
	public double getTotleprice() {
		return totleprice;
	}
	public void setTotleprice(double totleprice) {
		this.totleprice = totleprice;
	}
	public Banner getBanner() {
		return banner;
	}

	public void setBanner(Banner banner) {
		this.banner = banner;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	public String getAppsecret() {
		return appsecret;
	}
	public void setAppsecret(String appsecret) {
		this.appsecret = appsecret;
	}
	public String getPartner() {
		return partner;
	}
	public void setPartner(String partner) {
		this.partner = partner;
	}
	public String getPartnerkey() {
		return partnerkey;
	}
	public void setPartnerkey(String partnerkey) {
		this.partnerkey = partnerkey;
	}
	public String getAppid() {
		return appid;
	}
	public void setAppid(String appid) {
		this.appid = appid;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}

	



}
