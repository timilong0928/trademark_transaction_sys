package com.servlet;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.TimerTask;

import javax.servlet.ServletContext;

import com.sun.org.apache.xpath.internal.operations.Or;

import moban.WeixinPushMassage;
import net.sf.json.JSONObject;
import pojo.Award;
import pojo.Nongli;
import pojo.Order2;
import pojo.Team;
import pojo.TeamAward;
import pojo.TimeUtil;
import pojo.Tongji;
import dao.DAO;
import dao.TeamDAO;
import dao.TongjiDAO;
public class ReminderTask extends TimerTask{

	private ServletContext context = null;
	
	public ReminderTask(ServletContext context){
		this.context = context;  
	} 
	
	@Override
	public void run() {
		/*//每天定时器启动
		System.err.println("每日定时器已经启动");
		//用户签到和会员管理
		team();*/
		List<Order2> orders=DAO.findbyinteger(Order2.class, "status", 1);
		fanyong(orders);
		List<Order2> orders1=DAO.findbytwo(Order2.class, "status", "tuikuanstatus", 2, 2);
		fanyong(orders1);
		

	}
	
	 public boolean isLatestWeek(Date addtime,Date now){  
		    Calendar calendar = Calendar.getInstance();  //得到日历  
		    calendar.setTime(now);//把当前时间赋给日历  
		    calendar.add(Calendar.DAY_OF_MONTH, -7);  //设置为7天前  
		    Date before7days = calendar.getTime();   //得到7天前的时间  
		    if(before7days.getTime() > addtime.getTime()){  
		        return true;  
		    }else{  
		        return false;  
		    }  
		}
	 public void fanyong(List<Order2> orders){
		 
		 Date now = new Date(); 
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date datetime = null;
			
			Award award=new Award();
			Team team=new Team();
			Team shangji1=new Team();
			
			for(Order2 o:orders){
				System.out.println("几个订单");
				team=DAO.findbyid(Team.class,o.getTeamid());
				
				if (team.getIsfanyong()==0) {
					
				
				
				try {
					datetime = dateFormat.parse(o.getTime());
					if (isLatestWeek(datetime,now)) {
						
						award = DAO.findbyid(Award.class,1);
						
						
						
						shangji1=DAO.findbyid(Team.class,team.getYijiId());
						
						//如果有上级，则给佣金
						if(shangji1!=null){
							//添加佣金记录
							System.out.println("有上级，进来"); 
							TeamAward teamaward2 = new TeamAward();
							teamaward2.setType(4);
							teamaward2.setTeamId(shangji1.getId());
							//teamaward2.setYjcontent("下级用户："+team.getNickName()+"的购买");
							double fanyong=award.getDiscount1();
							teamaward2.setFanyongname(shangji1.getNickName());
							teamaward2.setYongjinaward(fanyong);
							//System.out.println("反佣金钱："+Math.round(o.getPrice()*award.getDiscount1())/100.0);
							teamaward2.setTeamId1(team.getId());
							DAO.save(teamaward2);
							shangji1.setAllyongjin(Math.round(shangji1.getAllyongjin()*100+fanyong*100)/100.0);
							shangji1.setYongjin(Math.round(shangji1.getYongjin()*100+fanyong*100)/100.0);
							DAO.update(shangji1);
							
							team.setIsfanyong(1);
							DAO.update(team);
							
							
							
						}
						
					}
					
				} catch (ParseException e) {
					
					e.printStackTrace();
				}
				
			}
			
			}	
			
		 
	 } 
	
	 
	 
	 
	//用户签到和会员管理
/*	void team(){
		TeamDAO.sign1();
		TeamDAO.sign2();
	}*/
	
	
	

	public ServletContext getContext() {
		return context;
	}

	public void setContext(ServletContext context) {
		this.context = context;
	}


}
