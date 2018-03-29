package com.utils;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.ConnectException;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.cert.CertificateException;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContexts;
import org.apache.http.entity.BasicHttpEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;



/**
 * 通用工具类
 * 
 * @author liufeng
 * @date 2013-10-17
 */
public class CommonUtil {
	private static Logger log = Logger.getLogger(CommonUtil.class);
	// 凭证获取（GET）
	public final static String token_url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";

	/**
	 * 发送https请求
	 * 
	 * @param requestUrl 请求地址
	 * @param requestMethod 请求方式（GET、POST）
	 * @param outputStr 提交的数据
	 * @return JSONObject(通过JSONObject.get(key)的方式获取json对象的属性值)
	 */
	public static JSONObject httpsRequest(String requestUrl, String requestMethod, String outputStr) {
		JSONObject jsonObject = null;
		try {
			// 创建SSLContext对象，并使用我们指定的信任管理器初始化
			StringBuffer buffer = getBuffer(requestUrl, requestMethod,
					outputStr);
			//System.out.println("buffer"+buffer);
			jsonObject = JSONObject.fromObject(buffer.toString());
		} catch (ConnectException ce) {
		} catch (Exception e) {
		}
		return jsonObject;
	}
	
	public static Map<String,String> httpsRequestWeb(String requestUrl, String requestMethod, String outputStr) {
		Map<String, String> resMap = new HashMap<String, String>();
		try {
			StringBuffer buffer = getBuffer(requestUrl, requestMethod,
					outputStr);
			
			String restr=buffer.toString();
			String[] arry = restr.split("&");
			for(int i=0;i<arry.length;i++){
				String[] ar = arry[i].split("=");
				resMap.put(ar[0], ar[1]);
			}
		} catch (ConnectException ce) {
		} catch (Exception e) {
		}
		return resMap;
	}
	
	public static JSONObject httpsRequestQQjson(String requestUrl, String requestMethod, String outputStr) {
		JSONObject jsonObject = null;
		try {
			StringBuffer buffer = getBuffer(requestUrl, requestMethod,
					outputStr);
			
			String restr=buffer.toString();
			restr=restr.substring(restr.indexOf("{"), restr.lastIndexOf("}")+1);
			//System.out.println(restr);
			jsonObject = JSONObject.fromObject(restr.toString());
		} catch (ConnectException ce) {
		} catch (Exception e) {
		}
		return jsonObject;
	}

	private static StringBuffer getBuffer(String requestUrl,
			String requestMethod, String outputStr)
			throws NoSuchAlgorithmException, NoSuchProviderException,
			KeyManagementException, MalformedURLException, IOException,
			ProtocolException, UnsupportedEncodingException {
		TrustManager[] tm = { new MyX509TrustManager() };
		SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
		sslContext.init(null, tm, new java.security.SecureRandom());
		// 从上述SSLContext对象中得到SSLSocketFactory对象
		SSLSocketFactory ssf = sslContext.getSocketFactory();

		URL url = new URL(requestUrl);
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		conn.setSSLSocketFactory(ssf);
		
		conn.setDoOutput(true);
		conn.setDoInput(true);
		conn.setUseCaches(false);
		// 设置请求方式（GET/POST）
		conn.setRequestMethod(requestMethod);

		// 当outputStr不为null时向输出流写数据
		if (null != outputStr) {
			OutputStream outputStream = conn.getOutputStream();
			// 注意编码格式
			outputStream.write(outputStr.getBytes("UTF-8"));
			outputStream.close();
		}

		// 从输入流读取返回内容
		InputStream inputStream = conn.getInputStream();
		InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
		BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
		String str = null;
		StringBuffer buffer = new StringBuffer();
		while ((str = bufferedReader.readLine()) != null) {
			buffer.append(str);
		}

		// 释放资源
		bufferedReader.close();
		inputStreamReader.close();
		inputStream.close();
		inputStream = null;
		conn.disconnect();
		return buffer;
	}
	
	
	

	/**
	 * 获取接口访问凭证
	 * 
	 * @param appid 凭证
	 * @param appsecret 密钥
	 * @return
	 */
	
	
	/**
	 * URL编码（utf-8）
	 * 
	 * @param source
	 * @return
	 */
	public static String urlEncodeUTF8(String source) {
		String result = source;
		try {
			result = java.net.URLEncoder.encode(source, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 根据内容类型判断文件扩展名
	 * 
	 * @param contentType 内容类型
	 * @return
	 */
	public static String getFileExt(String contentType) {
		String fileExt = "";
		if ("image/jpeg".equals(contentType))
			fileExt = ".jpg";
		else if ("audio/mpeg".equals(contentType))
			fileExt = ".mp3";
		else if ("audio/amr".equals(contentType))
			fileExt = ".amr";
		else if ("video/mp4".equals(contentType))
			fileExt = ".mp4";
		else if ("video/mpeg4".equals(contentType))
			fileExt = ".mp4";
		return fileExt;
	}
	
	/**
	 * 发送https请求
	 * 
	 * @param requestUrl
	 *            请求地址
	 * @param requestMethod
	 *            请求方式（GET、POST）
	 * @param outputStr
	 *            提交的数据
	 * @return 字符串
	 */
	public static String sendHttpsRequest(String requestUrl, String requestMethod, String outputStr) {
		StringBuffer buffer = new StringBuffer();
		try {
			// 创建SSLContext对象，并使用我们指定的信任管理器初始化
			TrustManager[] tm = { new MyX509TrustManager() };
			SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
			sslContext.init(null, tm, new java.security.SecureRandom());
			// 从上述SSLContext对象中得到SSLSocketFactory对象
			SSLSocketFactory ssf = sslContext.getSocketFactory();

			URL url = new URL(requestUrl);
			HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
			conn.setSSLSocketFactory(ssf);

			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setUseCaches(false);
			// 设置请求方式（GET/POST）
			conn.setRequestMethod(requestMethod);

			// 当outputStr不为null时向输出流写数据
			if (null != outputStr) {
				OutputStream outputStream = conn.getOutputStream();
				// 注意编码格式
				outputStream.write(outputStr.getBytes("UTF-8"));
				outputStream.close();
			}

			InputStream inputStream = conn.getInputStream();
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}

			// 释放资源
			bufferedReader.close();
			inputStreamReader.close();
			inputStream.close();
			inputStream = null;
			conn.disconnect();
		} catch (ConnectException ce) {
			log.error("连接超时：{}", ce);
		} catch (Exception e) {
			log.error("https请求异常：{}", e);
		}
		return buffer.toString();
	}
	
	
	public static String sendHttpRequestWithCert(String reqestUrl, String dataStr,String certPath,String pwd) {
		FileInputStream instream = null;
		CloseableHttpClient httpclient = null;
		CloseableHttpResponse response = null;
		StringBuffer result = new StringBuffer();

		try {
			// 指定读取证书格式为PKCS12
			KeyStore keyStore = KeyStore.getInstance("PKCS12");
			// 读取本机存放的PKCS12证书文件
			instream = new FileInputStream(new File(certPath));

			// 指定PKCS12的密码(商户ID)
			System.out.println("============"+certPath+"++++++++"+pwd);
			keyStore.load(instream, pwd.toCharArray());//WXPayPropertiesUtil.GetMCH_ID()

			SSLContext sslcontext = SSLContexts.custom()
					.loadKeyMaterial(keyStore, pwd.toCharArray()).build();

			SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslcontext, new String[] { "TLSv1" },
					null, SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
			httpclient = HttpClients.custom().setSSLSocketFactory(sslsf).build();

			// HttpGet httpget = new HttpGet(reqestUrl);
			HttpPost httpPost = new HttpPost(reqestUrl);
			// OutputStream os = new ByteArrayOutputStream();
			// os.write(dataStr.getBytes("UTF-8"));
			BasicHttpEntity httpEntity = new BasicHttpEntity();
			httpEntity.setContent(new ByteArrayInputStream(dataStr.getBytes("UTF-8")));
			// httpEntity.writeTo(os);
			httpPost.setEntity(httpEntity);

			// EntityUtils.consume(httpEntity);

			response = httpclient.execute(httpPost);

			HttpEntity entity = response.getEntity();

			if (entity != null) {
				System.out.println("Response content length: " + entity.getContentLength());
				BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(entity.getContent()));
				String text;
				while ((text = bufferedReader.readLine()) != null) {
					result.append(new String(text.getBytes(), "UTF-8"));
				}
			}
			EntityUtils.consume(entity);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			log.error(e);
		} catch (CertificateException e) {
			e.printStackTrace();
			log.error(e);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
		} finally {
			try {
				if (instream != null) {
					instream.close();
				}
				if (response != null) {
					response.close();
				}
				if (httpclient != null) {
					httpclient.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
				log.error(e2);
			}
		}
		return result.toString();
	}
}