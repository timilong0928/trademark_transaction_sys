package com.yx.util;  
  
import java.io.BufferedReader;  
import java.io.File;
import java.io.InputStream;  
import java.io.InputStreamReader;  
import java.io.OutputStream;  
import java.io.UnsupportedEncodingException;
import java.net.ConnectException;  
import java.net.URL;  
import java.net.URLEncoder;
import java.io.FileOutputStream; 
import javax.net.ssl.HttpsURLConnection;  
import javax.net.ssl.SSLContext;  
import javax.net.ssl.SSLSocketFactory;  
import javax.net.ssl.TrustManager;  
  
import net.sf.json.JSONException;
import net.sf.json.JSONObject;  
  
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;  
import org.slf4j.LoggerFactory;  

import com.utils.CommonUtil;
import com.yx.pojo.AccessToken;
import com.yx.pojo.Menu;
  
/** 
 * 公众平台通用接口工具类 
 *  
 */  
public class WeixinUtil {  

	 // 日志文件
	protected final static Logger log = LoggerFactory.getLogger(WeixinUtil.class);
  
    /** 
     * 发起https请求并获取结果 
     *  
     * @param requestUrl 请求地址 
     * @param requestMethod 请求方式（GET、POST） 
     * @param outputStr 提交的数据 
     * @return JSONObject(通过JSONObject.get(key)的方式获取json对象的属性值) 
     */  
	public static JSONObject httpRequest1(String requestUrl, String requestMethod, String outputStr) {  
        JSONObject jsonObject = null;  
        StringBuffer buffer = new StringBuffer();  
        try {  
            // 创建SSLContext对象，并使用我们指定的信任管理器初始化   
            TrustManager[] tm = { new MyX509TrustManager() };  
            SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");  
            sslContext.init(null, tm, new java.security.SecureRandom());  
            // 从上述SSLContext对象中得到SSLSocketFactory对象   
            SSLSocketFactory ssf = sslContext.getSocketFactory();  
  
            URL url = new URL(requestUrl);  
            HttpsURLConnection httpUrlConn = (HttpsURLConnection) url.openConnection();  
            httpUrlConn.setSSLSocketFactory(ssf);  
  
            httpUrlConn.setDoOutput(true);  
            httpUrlConn.setDoInput(true);  
            httpUrlConn.setUseCaches(false);  
            // 设置请求方式（GET/POST）   
            httpUrlConn.setRequestMethod(requestMethod);  
  
            if ("GET".equalsIgnoreCase(requestMethod))  
                httpUrlConn.connect();  
  
            // 当有数据需要提交时   
            if (null != outputStr) {  
                OutputStream outputStream = httpUrlConn.getOutputStream();  
                // 注意编码格式，防止中文乱码   
                outputStream.write(outputStr.getBytes("UTF-8"));  
                outputStream.close();  
            }  
  
            // 将返回的输入流转换成字符串   
            InputStream is = httpUrlConn.getInputStream();  
           // InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");  
           // BufferedReader bufferedReader = new BufferedReader(inputStream);  
  
            String root = ServletActionContext.getServletContext().getRealPath("/upload");
            OutputStream os = new FileOutputStream(new File(root, "11.jpg"));
            byte[] buffer1 = new byte[500];
           int length = 0;
            while(-1 != (length = is.read(buffer1, 0, buffer1.length)))
            {
                os.write(buffer1);
            }
            
            os.close();
            is.close();
            String str = null;  


            // 释放资源   

            httpUrlConn.disconnect();  
        //   jsonObject = JSONObject.fromObject(buffer1.toString());  
         //   System.out.println(buffer);
      
        } catch (Exception e) {  
            e.printStackTrace();
        }  
        return null;  
    } 
	
    public static JSONObject httpRequest(String requestUrl, String requestMethod, String outputStr) {  
        JSONObject jsonObject = null;  
        StringBuffer buffer = new StringBuffer();  
        try {  
            // 创建SSLContext对象，并使用我们指定的信任管理器初始化   
            TrustManager[] tm = { new MyX509TrustManager() };  
            SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");  
            sslContext.init(null, tm, new java.security.SecureRandom());  
            // 从上述SSLContext对象中得到SSLSocketFactory对象   
            SSLSocketFactory ssf = sslContext.getSocketFactory();  
  
            URL url = new URL(requestUrl);  
            HttpsURLConnection httpUrlConn = (HttpsURLConnection) url.openConnection();  
            httpUrlConn.setSSLSocketFactory(ssf);  
  
            httpUrlConn.setDoOutput(true);  
            httpUrlConn.setDoInput(true);  
            httpUrlConn.setUseCaches(false);  
            // 设置请求方式（GET/POST）   
            httpUrlConn.setRequestMethod(requestMethod);  
  
            if ("GET".equalsIgnoreCase(requestMethod))  
                httpUrlConn.connect();  
  
            // 当有数据需要提交时   
            if (null != outputStr) {  
                OutputStream outputStream = httpUrlConn.getOutputStream();  
                // 注意编码格式，防止中文乱码   
                outputStream.write(outputStr.getBytes("UTF-8"));  
                outputStream.close();  
            }  
  
            // 将返回的输入流转换成字符串   
            InputStream inputStream = httpUrlConn.getInputStream();  
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");  
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);  
  
            String str = null;  
            while ((str = bufferedReader.readLine()) != null) {  
                buffer.append(str);  
            }  
            bufferedReader.close();  
            inputStreamReader.close();  
            // 释放资源   
            inputStream.close();  
            inputStream = null;  
            httpUrlConn.disconnect();  
            jsonObject = JSONObject.fromObject(buffer.toString());  
        } catch (ConnectException ce) {  
            log.error("Weixin server connection timed out.");  
        } catch (Exception e) {  
            log.error("https request error:{}", e);  
        }  
        return jsonObject;  
    } 
    
 // 获取access_token的接口地址（GET） 限200（次/天）   
    public final static String access_token_url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";  
    /** 
     * 获取access_token 
     *  
     */  
    public static AccessToken getAccessToken(String appid, String appsecret) {  
        AccessToken accessToken = null;  
      
        String requestUrl = access_token_url.replace("APPID", appid).replace("APPSECRET", appsecret);  
        JSONObject jsonObject = httpRequest(requestUrl, "GET", null);  
        // 如果请求成功   
        if (null != jsonObject) {  
            try {  
                accessToken = new AccessToken();  
                accessToken.setToken(jsonObject.getString("access_token"));  
                accessToken.setExpiresIn(jsonObject.getInt("expires_in"));  
            } catch (JSONException e) {  
                accessToken = null;  
                // 获取token失败   
                log.error("获取token失败 errcode:{} errmsg:{}", jsonObject.getInt("errcode"), jsonObject.getString("errmsg"));  
            }  
        }  
        return accessToken;  
    }  
    
  //查询菜单
    /**
     * 查询订单，get请求
     */
    public static String menu_find_url = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=ACCESS_TOKEN";

    public static String findMenu(String accessToken){
    	String url = menu_find_url.replace("ACCESS_TOKEN", accessToken);
    	JSONObject jsonObject = CommonUtil.httpsRequest(url, "GET", null);
    	return jsonObject.toString();
    }
    
    
    // 菜单创建（POST） 限100（次/天）   
    public static String menu_create_url = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";  
      
    /** 
     * 创建菜单 
     *  
     * @param menu 菜单实例 
     * @param accessToken 有效的access_token 
     * @return 0表示成功，其他值表示失败 
     */  
    public static int createMenu(Menu menu, String accessToken) {  
        int result = 0;  
        // 拼装创建菜单的url   
        String url = menu_create_url.replace("ACCESS_TOKEN", accessToken);  
        // 将菜单对象转换成json字符串   
        String jsonMenu = JSONObject.fromObject(menu).toString(); 
        System.err.println("菜单的json字符串："+jsonMenu);
        // 调用接口创建菜单   
        JSONObject jsonObject = httpRequest(url, "POST", jsonMenu);  
      
        if (null != jsonObject) {
            if (0 != jsonObject.getInt("errcode")) {  
                result = jsonObject.getInt("errcode");  
                log.error("创建菜单失败 errcode:{} errmsg:{}", jsonObject.getInt("errcode"), jsonObject.getString("errmsg"));  
            }  
        }  
        return result;  
    }  
    
    public static String urlEncodeUTF8(String source) {
		String result=source;
		try {
			result=URLEncoder.encode(source, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return result;
	}
      
	
    // 接收消息类型：文本 
    public final static String RECRIVE_TEXT = "text";  
    // 接收消息类型：图片  
    public final static String RECRIVE_IMAGE = "image";  
    // 接收消息类型：语音
    public final static String RECRIVE_VOICE = "voice";  
    // 接收消息类型：视频
    public final static String RECRIVE_VIDEO = "video"; 
    // 接收消息类型：地理位置   
    public final static String RECRIVE_LOCATION = "location";  
    // 接收消息类型：链接 
    public final static String RECRIVE_LINK = "link";  
    // 接收消息类型：推送   
    public final static String RECRIVE_EVENT = "event";  
    
    // 回复消息类型：文本 
    public final static String REQUEST_TEXT = "text"; 
    // 回复消息类型：图片  
    public final static String REQUEST_IMAGE = "image"; 
    // 回复消息类型：语音  
    public final static String REQUEST_VOICE = "voice"; 
    // 回复消息类型：视频 
    public final static String REQUEST_VIDEO = "video"; 
    // 回复消息类型：音乐 
    public final static String REQUEST_MUSIC = "music";  
    // 回复消息类型：图文 
    public final static String REQUEST_NEWS = "news";  
    
    // 事件类型：subscribe(订阅) 
    public final static String EVENT_SUBSCRIBE = "subscribe";  
    // 事件类型：unsubscribe(取消订阅) 
    public final static String EVENT_UNSUBSCRIBE = "unsubscribe";  
    // 事件类型：LOCATION(上报地理位置事件) 
    public final static String EVENT_LOCATION = "LOCATION";  
    // 事件类型：CLICK(自定义菜单点击事件) 
    public final static String EVENT_CLICK = "CLICK";  
   
    /**
     * 扫描带参数二维码事件
     * 用户扫描带场景值二维码时，可能推送以下两种事件：
		1.如果用户还未关注公众号，则用户可以关注公众号，关注后微信会将带场景值关注事件推送给开发者。
   		2.如果用户已经关注公众号，则微信会将带场景值扫描事件推送给开发者。
    */
    // 事件类型：subscribe(用户未关注时，进行关注后的事件推送) 
    public final static String EVENT_QRCODE_SUBSCRIBE = "subscribe";
    // 事件类型：scan(用户已关注时的事件推送) 
    public final static String EVENT_QRCODE_SCAN = "scan";
	
   
	// 获取access_token的接口地址（GET） 限200（次/天）  
	public final static String GET_ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";   
	// 开发者可通过OpenID来获取用户基本信息 url 
	protected final static String GET_PERSONALINF_URL="https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";	
	// 通过OpenID获取查询用户所在分组url
	protected final static String GET_PERSONGROUPID_URL="https://api.weixin.qq.com/cgi-bin/groups/getid?access_token=ACCESS_TOKEN";
	/**
	 *  OAuth2.0引导关注者打开 用户同意授权，获取code页面url
	 *  1.scope的设置为：snsapi_base（不弹出授权页面，直接跳转，只能获取用户openid），snsapi_userinfo （弹出授权页面)
	 *  2.redirect_uri：授权后重定向的回调链接地址，请使用urlencode对链接进行处理  方法再commonutil的urlEncodeUTF8()
	 */
	public final static String FANS_GET_CODE="https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=SCOPE&state=STATE#wechat_redirect";
	// OAuth2.0通过code换取网页授权access_token
	protected final static String OAUTH2_ACCESSTOKEN_URL="https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
	// OAuth2.0刷新access_token
	protected final static String REFRESH_ACCESSTOKEN_URL="https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=APPID&grant_type=refresh_token&refresh_token=REFRESH_TOKEN";
	// OAuth2.0拉取用户信息(需scope为 snsapi_userinfo)
	protected final static String OAUTH2_USERINFO_URL="https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
	// 主动发送客服消息url
	protected final static String SEND_CUSTOM_URL="https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=ACCESS_TOKEN";
	// 生成临时二维码url
	protected final static String TEMPORARY_QRCODE_URL="https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=ACCESS_TOKEN";
	// 生成永久二维码url
	protected final static String PERMANENT_QRCODE_URL="https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=ACCESS_TOKEN";
	// 换取二维码url
	protected final static String GET_QRCODE_URL="https://mp.weixin.qq.com/cgi-bin/shoMyna Wangrcode?ticket=TICKET";
	// 获取关注者列表url
	protected final static String GET_USERLIST_URL="https://api.weixin.qq.com/cgi-bin/user/get?access_token=ACCESS_TOKEN&next_openid=NEXT_OPENID";
	
	// 获取所有分组信息url
	protected final static String GET_GROUPS_URL="https://api.weixin.qq.com/cgi-bin/groups/get?access_token=ACCESS_TOKEN";
	// 创建分组url
	protected final static String CREATE_GROUPS_URL="https://api.weixin.qq.com/cgi-bin/groups/create?access_token=ACCESS_TOKEN";
	// 修改分组url
	protected final static String UPDATE_GROUPS_URL="https://api.weixin.qq.com/cgi-bin/groups/update?access_token=ACCESS_TOKEN";
	// 移动用户分组url
	protected final static String REMOVE_MEMBER_URL="https://api.weixin.qq.com/cgi-bin/groups/members/update?access_token=ACCESS_TOKEN";

	// 上传多媒体文件url
	protected final static String UPLOAD_MEDIA_URL="http://file.api.weixin.qq.com/cgi-bin/media/upload?access_token=ACCESS_TOKEN&type=TYPE";
	// 下载多媒体文件url
	protected final static String DOWNLOAD_MEDIA_URL="http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=ACCESS_TOKEN&media_id=MEDIA_ID";

	// 菜单创建（POST） 限100（次/天）  
	protected final static String CREATE_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";  
	// 菜单查询（GET） 
	protected final static String GET_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=ACCESS_TOKEN";
	// 菜单删除（GET） 
	protected final static String DELETE_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=ACCESS_TOKEN";

}  
