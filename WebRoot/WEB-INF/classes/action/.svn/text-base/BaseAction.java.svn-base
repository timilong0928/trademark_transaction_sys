package action;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import pojo.Admin;
import pojo.Award;
import pojo.Code;
import pojo.Peizhi;
import pojo.Team;
import util.Delemoji;

import com.utils.CommonUtil;

import dao.CodeDAO;
import dao.DAO;
import dao.TeamDAO;

/**
 *	BaseAction是其他Action的父类，我们将通用的逻辑
 *	提取到这里。
 *	1.通过接口注入Session放到这里，这样子类取Session很方便
 */
public class BaseAction implements SessionAware {
						//二维码
	//去个人中心地址
	public static String wx_user_url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx4762347a01c410da&redirect_uri=http%3a%2f%2fshangbiao.xmyunxin.com%2fteam!getUser.action&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
	//去首页
	public static String wx_index_url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx4762347a01c410da&redirect_uri=http%3a%2f%2fshangbiao.xmyunxin.com%2findex!goindex.action&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
	
	//课程
	public static String wx_thecourse_url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx4762347a01c410da&redirect_uri=http%3a%2f%2fshangbiao.xmyunxin.com%2fcourse!gothecourse.action&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
	//套餐
	public static String wx_thetaocan_url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx4762347a01c410da&redirect_uri=http%3a%2f%2fshangbiao.xmyunxin.com%2fcourse!gothetaocan.action&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
	
	//活动
	public static String wx_thehuodong_url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx4762347a01c410da&redirect_uri=http%3a%2f%2fshangbiao.xmyunxin.com%2fbanner!gothehuodong.action&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
	
	//分销
	public static String wx_fenxiao_url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx4762347a01c410da&redirect_uri=http%3a%2f%2fshangbiao.xmyunxin.com%2fteam!gofenxiao.action&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
	
	//支付
	public static String wx_notify1_url="http://shangbiao.xmyunxin.com/notify1!notify1.action";
	protected Team team;
	protected Award award;//公共字段对象
	protected Admin admin;
	protected Integer min;//最小
	protected Integer max;
	protected Integer size;
	protected Integer page;
	protected Integer allpage;
	protected String msg;
	protected int[] ids;//全选
	protected String code;
	protected String openId;

	protected Map<String, Object> session;
	protected HttpServletRequest request;
	protected HttpServletResponse response;

	
	
	private Map<String,String> cookmap(Cookie[] cookies){
		Map<String,String> map=new HashMap<String, String>();
		for(Cookie ck:cookies){
			map.put(ck.getName(), ck.getValue());
		}
		return map;
	}
	
	
	public void setSession(Map<String, Object> session) {
		this.session = session;
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		Cookie[] cookies= request.getCookies();
		//System.out.println(cookies);
		team=(Team) session.get("team");
		if(team!=null){
			team=DAO.findbyid(Team.class,team.getId());
			session.put("team",team);
		}
		
		if(team==null && cookies!=null){
			Map<String,String> map =cookmap(cookies);
			//System.out.println(map);
			String openId=map.get("openId");
			if(openId!=null){
				Team team=TeamDAO.findByOpenid(openId);
				if(team!=null){
					session.put("team", team);
				}
			}
			
		}
	}
	//分页
	protected void checkpage(){
		if(page==null || page<1){
			page=1;
		}
		if(allpage==null || allpage<1){
			allpage=1;
		}
		try {
			page=Math.min(page, allpage);		
			min=Math.max(1, page-5);
			max=Math.min(page+5, allpage);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 保存文件至upload下 返回文件名
	 * 
	 * @param file
	 * @param fileFileName
	 * @return
	 * @throws IOException
	 */
	protected String loadFile(File file, String fileFileName)
			throws IOException {
		String root = ServletActionContext.getServletContext().getRealPath(
				"/upload");
		fileFileName = System.currentTimeMillis() + fileFileName;
		InputStream is = new FileInputStream(file);
		OutputStream os = new FileOutputStream(new File(root, fileFileName));
		byte[] buffer = new byte[500];
		int length = 0;
		while (-1 != (length = is.read(buffer, 0, buffer.length))) {
			os.write(buffer, 0, length);
		}
		os.close();
		is.close();
		return "upload/" + fileFileName;
	}
	
	protected void loadOpenId() {
		JSONObject jsonObject=null;
		String access_token=null;
		if(code==null)
		{
			msg="用户取消授权";
			return ;
		}
		Peizhi peizhi=DAO.findone(Peizhi.class);
		if(peizhi==null){
			msg="后台未配置appkey";
		}
		Code c = CodeDAO.findbycode(code);
		if (c != null) {
			openId = (String) session.get("openid");
		}else{
			c = new Code();
			c.setCode(code);
			DAO.save(c);
			System.out.println("test code"+code);
			String appid = peizhi.getAppid();
			String secret = peizhi.getAppsecret();
			String URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid="
				+ appid
				+ "&secret="
				+ secret
				+ "&code="
				+ code
				+ "&grant_type=authorization_code";
			jsonObject = CommonUtil.httpsRequest(URL, "GET", null);
			openId = jsonObject.getString("openid");
			access_token = jsonObject.getString("access_token");
			session.put("openId", openId);
		}
		team=TeamDAO.findByOpenid(openId);
		session.put("team", team);
		if(jsonObject!=null&&team==null){
			if(null==team){
				String url1 = "https://api.weixin.qq.com/sns/userinfo?access_token="
						+ access_token + "&openid=" + openId + "&lang=zh_CN";
				JSONObject jsonObject1 = CommonUtil.httpsRequest(url1, "GET",
						null);
				String nickName = jsonObject1.getString("nickname");
				String headimg = jsonObject1.getString("headimgurl");
				team=new Team();
				team.setOpenId(openId);
				try {
					nickName = Delemoji.emojiChange(nickName);
				} catch (Exception e) {
					// TODO: handle exception
				}
				team.setNickName(nickName);
				team.setImg(headimg);
				try {
					DAO.save(team);
				} catch (Exception e) {
					team.setNickName("默认昵称");
					DAO.save(team);
				}
				
			}
			session.put("team", team);
		}else if(null!=team){
			session.put("team", team);
		}else{
		}
		
		//cookie
		Cookie c1=new Cookie("openId", openId);
		c1.setMaxAge(60*60*24*5);
		c1.setPath("/");
		response.addCookie(c1);
	}
	//小程序生成二微码
	protected void erweima(String openid) {
		
		String url_access_token="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="+"wx4762347a01c410da"+"&secret=121a7932fb06791ee86a017d502a6639";
		JSONObject jsonObject = CommonUtil.httpsRequest(url_access_token, "GET",null);
		String access_token=jsonObject.getString("access_token");
		try
        {	System.out.println("access_token====="+access_token);
            URL url = new URL("https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token="+access_token);
            
            HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
            httpURLConnection.setRequestMethod("POST");// 提交模式
            // conn.setConnectTimeout(10000);//连接超时 单位毫秒
            // conn.setReadTimeout(2000);//读取超时 单位毫秒
            // 发送POST请求必须设置如下两行
            httpURLConnection.setDoOutput(true);
            httpURLConnection.setDoInput(true);
            // 获取URLConnection对象对应的输出流
            PrintWriter printWriter = new PrintWriter(httpURLConnection.getOutputStream());
            // 发送请求参数
            JSONObject paramJson = new JSONObject();
              //paramJson.put("path", "pages/index/index");
            //String aString="qqqqqqqqq";
            paramJson.put("scene", openid);
            paramJson.put("page", "pages/index/index");
            paramJson.put("width", 430);
            paramJson.put("auto_color", true);
           /**
             * line_color生效
             * paramJson.put("auto_color", false);
             * JSONObject lineColor = new JSONObject();
             * lineColor.put("r", 0);
             * lineColor.put("g", 0);
             * lineColor.put("b", 0);
             * paramJson.put("line_color", lineColor);
             * */

            printWriter.write(paramJson.toString());
            // flush输出流的缓冲
            printWriter.flush();
            //开始获取数据
            BufferedInputStream bis = new BufferedInputStream(httpURLConnection.getInputStream());
            OutputStream os = new FileOutputStream(new File("c:\\shangbiao18\\erweima\\"+openid+".png"));
            int len;
            byte[] arr = new byte[1024];
            while ((len = bis.read(arr)) != -1)
            {
                os.write(arr, 0, len);
                os.flush();
            }
            os.close();
            System.out.println("ok");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
	}

	
	public Admin getAdmin() {
		return admin;
	}


	public void setAdmin(Admin admin) {
		this.admin = admin;
	}


	public Integer getMin() {
		return min;
	}

	public void setMin(Integer min) {
		this.min = min;
	}

	public Integer getMax() {
		return max;
	}

	public void setMax(Integer max) {
		this.max = max;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getAllpage() {
		return allpage;
	}

	public void setAllpage(Integer allpage) {
		this.allpage = allpage;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public Map<String, Object> getSession() {
		return session;
	}


	public Team getTeam() {
		return team;
	}


	public void setTeam(Team team) {
		this.team = team;
	}


	public Integer getSize() {
		return size;
	}




	public void setSize(Integer size) {
		this.size = size;
	}


	public int[] getIds() {
		return ids;
	}


	public void setIds(int[] ids) {
		this.ids = ids;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public Award getAward() {
		return award;
	}


	public void setAward(Award award) {
		this.award = award;
	}


	public String getOpenId() {
		return openId;
	}


	public void setOpenId(String openId) {
		this.openId = openId;
	}


	
	


}
