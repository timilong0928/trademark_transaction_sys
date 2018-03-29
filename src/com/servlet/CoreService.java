package com.servlet;  


import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;  
import java.util.List;
import java.util.Map;  
import java.util.Random;

import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pojo.Peizhi;
import pojo.Team;
import util.SpringUtil;
import net.sf.json.JSONObject;
import action.TeamAction;

import com.utils.CommonUtil;
import com.yx.event.model.LocationEvent;
import com.yx.message.req.LocationMessage;
import com.yx.message.resp.Article;
import com.yx.message.resp.NewsMessage;
import com.yx.message.resp.TextMessage;  
import com.yx.pojo.AccessToken;
import com.yx.pojo.KKTransInfo;
import com.yx.pojo.MessageTransInfo;
import com.yx.pojo.SNSUserInfo;
import com.yx.util.MessageUtil;  
import com.yx.util.WeixinUtil;

import dao.DAO;
import dao.TeamDAO;
/** 
 * 核心服务类 
 */  
public class CoreService {  
	/** 
	 * 处理微信发来的请求 
	 *  
	 * @param request 
	 * @return 
	 */  
	private static String respMessage = null;  
	// 第三方用户唯一凭证   

	public static synchronized String processRequest(HttpServletRequest request,HttpServletResponse response,String appId,String appSecret) {  

		LocationEvent location = null;
		SNSUserInfo userinfo = null;
		try {  
			Peizhi peizhi =DAO.findone(Peizhi.class);
			// 默认返回的文本消息内容   
			String respContent = "请求处理异常，请稍候尝试！";  

			// xml请求解析   
			Map<String, String> requestMap = MessageUtil.parseXml(request);  

			// 发送方帐号（open_id）   
			String fromUserName = requestMap.get("FromUserName");  
			// 公众帐号   
			String toUserName = requestMap.get("ToUserName");  
			// 消息类型   
			String msgType = requestMap.get("MsgType"); 
			//        	//经度
			//        	String longitude = requestMap.get("Longitude");
			//            //纬度
			//        	String latitude = requestMap.get("Latitude");
			// 回复文本消息   
			TextMessage textMessage = new TextMessage();  
			textMessage.setToUserName(fromUserName);  
			textMessage.setFromUserName(toUserName);  
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setMsgType("text");  
			//回复图文消息
			NewsMessage newsMessage = new NewsMessage();  
			newsMessage.setToUserName(fromUserName);  
			newsMessage.setFromUserName(toUserName);  
			newsMessage.setCreateTime(new Date().getTime());  
			newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);  
			newsMessage.setFuncFlag(0);  

			//            //设置经纬度
			//          location.setLongitude(longitude);
			//          location.setLatitude(latitude);
			String content = requestMap.get("Content");  
			// 文本消息   
			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {  
				
				// 创建图文消息   
				List<Article> articleList = new ArrayList<Article>();  
				// 单图文消息   
        		respContent="您好，欢迎关注“洛奇教育”";
				respMessage = MessageUtil.newsMessageToXml(newsMessage);  
			}  
			// 图片消息   
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) {  
				respContent = "您发送的是图片消息！";  
			}  
			// 地理位置消息   

			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)) {

				LocationMessage local=new LocationMessage();
				local.setLocation_X(requestMap.get("Latitude"));
				local.setLocation_Y(requestMap.get("Longitude"));

				respMessage = "您发送的是地理位置消息！";  
			}  
			// 链接消息   
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LINK)) {  
				respContent = "您发送的是链接消息！";  
			}  
			// 音频消息   
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VOICE)) {  
				respContent = "您发送的是音频消息！";  
			}  
			// 事件推送   
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {  
				// 事件类型   
				String eventType = requestMap.get("Event"); 
				// 订阅 （关注）  
				if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {
					/*
					String e = requestMap.get("EventKey"); 
					SimpleDateFormat df1 = new SimpleDateFormat("MMddHHmmss");
					String idd = df1.format(new Date());
					Team team=new Team();
					//            		

					if(e==null||e.equals("")||!e.startsWith("qrscene_")){//普通关注


						String openid = requestMap.get("FromUserName"); 
						Team t=DAO.findstringone(Team.class,"openId",openid);
						if(t==null){


							SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							String time=d.format(new Date());


							team.setOpenId(openid);

							DAO.save(team);

							AccessToken at = WeixinUtil.getAccessToken(appId, appSecret);
							String access_token = at.getToken();
							String url1="https://api.weixin.qq.com/cgi-bin/user/info?access_token="+access_token+"&openid="+openid+"&lang=zh_CN";
							JSONObject jsonObject1 = CommonUtil.httpsRequest(url1, "GET", null);
							openid = jsonObject1.getString("openid");
							String nickname = jsonObject1.getString("nickname");
							String img = jsonObject1.getString("headimgurl");
							System.out.println(nickname);

							team.setImg(img);
							team.setNickName(nickname);

							try{
								System.out.println("可以");
								DAO.update(team);
							}catch(Exception e1){
								e1.printStackTrace();

							} 
							respMessage = "";

						}else{

							respMessage = "";
						}

					}else{//扫描关注

						String openid = requestMap.get("FromUserName"); 
						Team t=DAO.findstringone(Team.class,"openId",openid);
						if(t==null){


							team.setOpenId(openid);
							// team.setYjnum2(0);
							String s=e.substring(8);
							int s1=Integer.parseInt(s);
							System.out.println(s1);

							Team t1=DAO.findbyid(Team.class,s1);

							int num=DAO.findnum(Team.class);
							num=num+1;
							DAO.save(team);
							AccessToken at = WeixinUtil.getAccessToken(appId, appSecret);
							String access_token = at.getToken();
							String url1="https://api.weixin.qq.com/cgi-bin/user/info?access_token="+access_token+"&openid="+openid+"&lang=zh_CN";
							JSONObject jsonObject1 = CommonUtil.httpsRequest(url1, "GET", null);
							openid = jsonObject1.getString("openid");
							String nickname = jsonObject1.getString("nickname");
							String img = jsonObject1.getString("headimgurl");
							System.out.println(nickname);
							//String root = ServletActionContext.getServletContext().getRealPath("/upload");

							team.setImg(img);
							team.setNickName(nickname);

							try{
								System.out.println("可以");
								DAO.update(team);
							}catch(Exception e1){
								e1.printStackTrace();

							}

							respMessage = "";
						}else{
							//                     		
							respMessage = "";
						}


					}
					respMessage = "";
				 */
            		respContent="您好，欢迎关注“洛奇教育”";
				}else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)) {  
					String eventKey = requestMap.get("EventKey");  
					if (eventKey.equals("kefu")) { //导航
						MessageTransInfo message = new MessageTransInfo();  
						message.setToUserName(fromUserName);  
						message.setFromUserName(toUserName);  
						message.setCreateTime(new Date().getTime());  
						message.setMsgType("transfer_customer_service");  
						respMessage =  MessageUtil.textMessageToXml(textMessage);//将对象转换为xml形式的字符串

					} else 
						if (eventKey.equals("home")) { 
							List<Article> articleList = new ArrayList<Article>();  
							Article article1 = new Article();  
							article1.setTitle("第7篇\n文本消息中换行符的使用");  
							article1.setDescription("");  
							article1.setPicUrl("http://0.xiaoqrobot.duapp.com/images/avatar_liufeng.jpg");  
							article1.setUrl("http://blog.csdn.net/lyq8479/article/details/9141467");  

							Article article2 = new Article();  
							article2.setTitle("第8篇\n文本消息中使用网页超链接");  
							article2.setDescription("");  
							article2.setPicUrl("http://avatar.csdn.net/1/4/A/1_lyq8479.jpg");  
							article2.setUrl("http://blog.csdn.net/lyq8479/article/details/9157455");  

							Article article3 = new Article();  
							article3.setTitle("如果觉得文章对你有所帮助，请通过博客留言或关注微信公众帐号xiaoqrobot来支持柳峰！");  
							article3.setDescription("");  
							// 将图片置为空   
							article3.setPicUrl("");  
							article3.setUrl("http://blog.csdn.net/lyq8479");  
							articleList.add(article1);  
							articleList.add(article2);  
							articleList.add(article3);  
							newsMessage.setArticleCount(articleList.size());  
							newsMessage.setArticles(articleList);  
							respMessage = MessageUtil.newsMessageToXml(newsMessage);  
							response.sendRedirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appId+
									"&redirect_uri=http://www.mydress2014.com/oauth2.jsp?fromUserName="+fromUserName+"&response_type=" +
							"code&scope=snsapi_userinfo&state=STATE#wechat_redirect");
						} else if (eventKey.equals("13")) {  
							respContent = "周边搜索菜单项被点击！";  
						} else if (eventKey.equals("14")) {  
							respContent = "历史上的今天菜单项被点击！";  
						} else if (eventKey.equals("21")) {  
							respContent = "歌曲点播菜单项被点击！";  
						} else if (eventKey.equals("22")) {  
							respContent = "经典游戏菜单项被点击！";  
						} else if (eventKey.equals("23")) {  
							respContent = "美女电台菜单项被点击！";  
						} else if (eventKey.equals("24")) {  
							respContent = "人脸识别菜单项被点击！";  
						} else if (eventKey.equals("25")) {  
							respContent = "聊天唠嗑菜单项被点击！";  
						} else if (eventKey.equals("31")) {  
							respContent = "Q友圈菜单项被点击！";  
						} else if (eventKey.equals("32")) {  
							respContent = "电影排行榜菜单项被点击！";  
						} else if (eventKey.equals("33")) {  
							respContent = "幽默笑话菜单项被点击！";  
						}  
				}else if(eventType.equals("")){

				}
			}  
			//文本消息回复
			textMessage.setContent("您好，欢迎关注“洛奇教育”");  
        	respMessage = MessageUtil.textMessageToXml(textMessage);
			
		} catch (Exception e) {  
			e.printStackTrace();  
		} 
		
		return respMessage;  
	}  

	public static String loadJSON (String url) {
		StringBuilder json = new StringBuilder();
		try {
			URL oracle = new URL(url);
			URLConnection yc = oracle.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(
					yc.getInputStream()));
			String inputLine = null;
			while ( (inputLine = in.readLine()) != null) {
				json.append(inputLine);
			}
			in.close();
		} catch (Exception e) {
		}
		return json.toString();
	}

}  


