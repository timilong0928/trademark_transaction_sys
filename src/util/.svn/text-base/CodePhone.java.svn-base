package util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

public class CodePhone {

	public static final String DEF_CHATSET = "UTF-8";
	public static final int DEF_CONN_TIMEOUT = 30000;
	public static final int DEF_READ_TIMEOUT = 30000;
	public static String userAgent = "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.66 Safari/537.36";

	// 配置您申请的KEY
	public static final String APPKEY = "c852fa568b7d28b2c095bfeb7ba6768a";



	// 2.发送短信
	public static void getRequest2() {
		String result = null;
		String url = "http://api.chanzor.com/send";// 请求接口地址
		Map<String,String> params = new HashMap<String,String>();// 请求参数
		params.put("account", "mishewang");
		params.put("password", MD5Util.MD5Encode("155186", "UTF-8").toUpperCase());
		params.put("mobile", "15396242979");
		String msg="【米社网】"+"121212";
		params.put("content",msg);// 
		//params.put("sendTime", "");
		//params.put("extno", "");
		
		try {
			result = net(url, params, "GET");
			System.out.println(result);
			JSONObject object = JSONObject.fromObject(result);
			if (object.getInt("status") == 0) {
				System.out.println(object.get("status"));
			} else {
				System.out.println(object.get("status") + ":"
						+ object.get("desc"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		getRequest2();
	}

	/**
	 * 
	 * @param strUrl
	 *            请求地址
	 * @param params
	 *            请求参数
	 * @param method
	 *            请求方法
	 * @return 网络请求字符串
	 * @throws Exception
	 */
	public static String net(String strUrl, Map params, String method)
			throws Exception {
		HttpURLConnection conn = null;
		BufferedReader reader = null;
		String rs = null;
		try {
			StringBuffer sb = new StringBuffer();
			if (method == null || method.equals("GET")) {
				strUrl = strUrl + "?" + urlencode(params);
			}
			URL url = new URL(strUrl);
			conn = (HttpURLConnection) url.openConnection();
			if (method == null || method.equals("GET")) {
				conn.setRequestMethod("GET");
			} else {
				conn.setRequestMethod("POST");
				conn.setDoOutput(true);
			}
			conn.setRequestProperty("User-agent", userAgent);
			conn.setUseCaches(false);
			conn.setConnectTimeout(DEF_CONN_TIMEOUT);
			conn.setReadTimeout(DEF_READ_TIMEOUT);
			conn.setInstanceFollowRedirects(false);
			conn.connect();
			if (params != null && method.equals("POST")) {
				try {
					DataOutputStream out = new DataOutputStream(conn
							.getOutputStream());
					out.writeBytes(urlencode(params));
				} catch (Exception e) {
					
				}
			}
			InputStream is = conn.getInputStream();
			reader = new BufferedReader(new InputStreamReader(is, DEF_CHATSET));
			String strRead = null;
			while ((strRead = reader.readLine()) != null) {
				sb.append(strRead);
			}
			rs = sb.toString();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				reader.close();
			}
			if (conn != null) {
				conn.disconnect();
			}
		}
		return rs;
	}

	// 将map型转为请求参数型
	public static String urlencode(Map<String, Object> data) {
		StringBuilder sb = new StringBuilder();
		for (Map.Entry i : data.entrySet()) {
			try {
			//	sb.append(i.getKey()).append("=").append(
			//			URLEncoder.encode(i.getValue() + "", "UTF-8")).append(
			//			"&");
				sb.append(i.getKey()).append("=").append(
									i.getValue() ).append(
									"&");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println(sb);
		return sb.toString();
	}

}
