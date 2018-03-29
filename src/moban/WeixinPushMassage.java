package moban;


import net.sf.json.JSONObject;
import pojo.Peizhi;
import pojo.TimeUtil;

import com.yx.pojo.AccessToken;
import com.yx.util.WeixinUtil;

import dao.DAO;

/**
 * 微信推送信息
 * 
 * @author My
 * @CreateDate 2016-1-19
 * @param
 */
public class WeixinPushMassage {
	
	Peizhi peizhi = (Peizhi) DAO.findone(Peizhi.class);
	
	
	// 购买成功通知
	public static void goumai(String openid,String content,String urlurl) {
		
		// 微信接口
		Peizhi peizhi = (Peizhi) DAO.findone(Peizhi.class);
		String url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=ACCESS_TOKEN";
		Token token = headtoken(peizhi.getAppid(), peizhi.getAppsecret());// 获取token
		url = url.replace("ACCESS_TOKEN", token.getAccessToken());// 转换为响应接口模式

		// 封装数据
		JSONObject json = new JSONObject();
		json.put("touser", openid);// 接收者wxName
		json.put("template_id", "Yzzo-vhI176URk6f6lRFlvDlgC65ItiHTKLHXOc8MyU");// 消息模板
		//System.err.println("消息："+urlurl);
		if(urlurl!=null){
			json.put("url",urlurl);//填写url可查看详情
		}

		JSONObject dd = new JSONObject();

		JSONObject dd2 = new JSONObject();
		dd2.put("value", "您已成功购买课程");// 消息提示
		dd2.put("color", "#173177");
		dd.put("first", dd2);

		JSONObject cc2 = new JSONObject();
		cc2.put("value", content);//"消息内容"
		cc2.put("color", "#173177");
		dd.put("name", cc2);

		JSONObject gg4 = new JSONObject();
		gg4.put("value", "点击查看订单");
		// gg2.put("color", "#173177");
		dd.put("remark", gg4);
		
		json.put("data", dd);
		System.out.println(json.toString());
		JSONObject js = CommonUtil.httpsRequest(url, "POST", json.toString());
		System.out.println("js==" + js);
	}
	
	// 下级购买返佣通知
	public static void fanyong(String openid,String first,String order,String money,String urlurl) {
		// 微信接口
		Peizhi peizhi = (Peizhi) DAO.findone(Peizhi.class);
		String url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=ACCESS_TOKEN";
		Token token = headtoken(peizhi.getAppid(), peizhi.getAppsecret());// 获取token
		url = url.replace("ACCESS_TOKEN", token.getAccessToken());// 转换为响应接口模式

		// 封装数据
		JSONObject json = new JSONObject();
		json.put("touser", openid);// 接收者wxName
		json.put("template_id", "vn0xCWC0yLKw2nDZN7WYBgVuZch_IVz5dc9MEgXTyag");// 消息模板
		//System.err.println("消息："+urlurl);
		if(urlurl!=null){
			json.put("url",urlurl);//填写url可查看详情
		}

		JSONObject dd = new JSONObject();

		JSONObject dd2 = new JSONObject();
		dd2.put("value", first);// 消息提示
		dd2.put("color", "#173177");
		dd.put("first", dd2);
		
		JSONObject cc1 = new JSONObject();
		cc1.put("value", order);//"消息内容"
		cc1.put("color", "#173177");
		dd.put("order", cc1);
		
		
		JSONObject cc2 = new JSONObject();
		cc2.put("value", money);//"消息内容"
		cc2.put("color", "#173177");
		dd.put("money", cc2);
		
		
		JSONObject gg4 = new JSONObject();
		gg4.put("value", "温馨提示：返现的佣金可以在个人中心中提现。");
		// gg2.put("color", "#173177");
		dd.put("remark", gg4);
		
		json.put("data", dd);
		System.out.println(json.toString());
		JSONObject js = CommonUtil.httpsRequest(url, "POST", json.toString());
		System.out.println("js==" + js);
	}
	
	// 下级注册成功通知
	public static void zhuce(String openid,String keyword1) {
		// 微信接口
		Peizhi peizhi = (Peizhi) DAO.findone(Peizhi.class);
		String url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=ACCESS_TOKEN";
		Token token = headtoken(peizhi.getAppid(), peizhi.getAppsecret());// 获取token
		url = url.replace("ACCESS_TOKEN", token.getAccessToken());// 转换为响应接口模式

		// 封装数据
		JSONObject json = new JSONObject();
		json.put("touser", openid);// 接收者wxName
		json.put("template_id", "9H5aUvyHKz3_IVJnXVJviKZBJcN2rJ2-bh2ImNUjWBc");// 消息模板
		//System.err.println("消息："+urlurl);
		
		
		JSONObject dd = new JSONObject();

		JSONObject dd2 = new JSONObject();
		dd2.put("value", "恭喜您，有新的分销会员加入您的分销团队！");// 消息提示
		dd2.put("color", "#173177");
		dd.put("first", dd2);
		
		JSONObject cc1 = new JSONObject();
		cc1.put("value", keyword1);//"消息内容"
		cc1.put("color", "#173177");
		dd.put("keyword1", cc1);
		
		
		JSONObject cc2 = new JSONObject();
		cc2.put("value", TimeUtil.getString());//"消息内容"
		cc2.put("color", "#173177");
		dd.put("keyword2", cc2);
		
		JSONObject cc3 = new JSONObject();
		cc3.put("value", "微信");//"消息内容"
		cc3.put("color", "#173177");
		dd.put("keyword3", cc3);
		
		
		JSONObject gg4 = new JSONObject();
		gg4.put("value", "您的团队越来越强大了哦，请再接再厉！");
		// gg2.put("color", "#173177");
		dd.put("remark", gg4);
		
		json.put("data", dd);
		System.out.println(json.toString());
		JSONObject js = CommonUtil.httpsRequest(url, "POST", json.toString());
		System.out.println("js==" + js);
	}
	
	// 预约课程开始提醒通知
	public static void kecheng(String openid,String keyword1,String urlurl) {
		// 微信接口
		Peizhi peizhi = (Peizhi) DAO.findone(Peizhi.class);
		String url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=ACCESS_TOKEN";
		Token token = headtoken(peizhi.getAppid(), peizhi.getAppsecret());// 获取token
		url = url.replace("ACCESS_TOKEN", token.getAccessToken());// 转换为响应接口模式

		// 封装数据
		JSONObject json = new JSONObject();
		json.put("touser", openid);// 接收者wxName
		json.put("template_id", "A1Vs86im48PhjrVuZ5xjgzPelC6UtPKm-ILRuN_KmDE");// 消息模板
		//System.err.println("消息："+urlurl);
		if(urlurl!=null){
			json.put("url",urlurl);//填写url可查看详情
		}

		JSONObject dd = new JSONObject();

		JSONObject dd2 = new JSONObject();
		dd2.put("value", "有新的课程即将开始！");// 消息提示
		dd2.put("color", "#173177");
		dd.put("first", dd2);
		
		JSONObject cc1 = new JSONObject();
		cc1.put("value", keyword1);//"消息内容"
		cc1.put("color", "#173177");
		dd.put("keyword1", cc1);
		
		
		JSONObject cc2 = new JSONObject();
		cc2.put("value", TimeUtil.getString());//"消息内容"
		cc2.put("color", "#173177");
		dd.put("keyword2", cc2);
		
		
		JSONObject gg4 = new JSONObject();
		gg4.put("value", "点击查看课程详情。");
		// gg2.put("color", "#173177");
		dd.put("remark", gg4);
		
		json.put("data", dd);
		System.out.println(json.toString());
		JSONObject js = CommonUtil.httpsRequest(url, "POST", json.toString());
		System.out.println("js==" + js);
	}

	public static Token headtoken(String appId, String appSrecet) {
		Token token = new Token();
		token = CommonUtil.getToken(appId, appSrecet);
		return token;
	}
}
