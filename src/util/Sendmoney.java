package util;

import java.io.StringReader;
import java.text.SimpleDateFormat;
import java.util.*;

import com.utils.CommonUtil;
import com.yx.util.MessageUtil;
import com.yx.util.XmlHandler;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import util.MoneyUtils;

import org.apache.log4j.Logger;
import org.dom4j.DocumentException;
import org.hibernate.util.StringHelper;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.Namespace;
import org.jdom.input.SAXBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.xml.sax.InputSource;

import dao.DAO;
import dao.Order2DAO;

import pojo.Order2;
import pojo.Peizhi;
import pojo.Weixinpay;



public class Sendmoney {
	private static Logger log = Logger.getLogger(Sendmoney.class);
	final static  String url = "https://api.mch.weixin.qq.com/mmpaymkttransfers/sendredpack";
	final static  String url1 = "https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers";
	private static String cert_path="";
	private static String cert_pwd="";
//	final static String appid = "";// 应用ID
//	final static String partner = "";// 微信支付商户号
	ApplicationContext ac = new ClassPathXmlApplicationContext("ssh.xml"); 
	
	public String hongbao(String jieshouzhe,double money,String ip){
		String finalmoney = String.format("%.2f", money);
		finalmoney = finalmoney.replace(".", "");
	    Weixinpay w=DAO.findone(Weixinpay.class);
	  
	    SimpleDateFormat df1 = new SimpleDateFormat("MMddHHmmss");
 		String idd = df1.format(new Date());
		//String orderNNo =  MoneyUtils.getOrderNo() ; 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nonce_str", MoneyUtils.buildRandom());//随机字符串
		map.put("mch_billno", idd);//商户订单
		map.put("mch_id", w.getPartner());//商户号
		map.put("wxappid", w.getAppid());//商户appid
		map.put("nick_name", "sslf");//提供方名称
		map.put("send_name",  "sslf");//用户名
		map.put("re_openid", jieshouzhe);//用户openid
		map.put("total_amount", finalmoney);//付款金额
		map.put("min_value", finalmoney);//最小红包
		map.put("max_value", finalmoney);//最大红包
		map.put("total_num", 1);//红包发送总人数
		map.put("wishing", "sslf");//红包祝福语
		map.put("client_ip", ip);//ip地址
		map.put("act_name", "sslf");//活动名称
		map.put("remark", "sslf");//备注
		map.put("sign", MoneyUtils.createSign(map));//签名
		String reqXml = MoneyUtils.createXML(map);
		String resXml = "";
		try {
			resXml = MoneyUtils.doSendMoney(url, reqXml);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("reqXml:"+reqXml);
		System.out.println("resXml:"+resXml);
		
		 //创建一个新的字符串
	     StringReader read = new StringReader(resXml);
	     //创建新的输入源SAX 解析器将使用 InputSource 对象来确定如何读取 XML 输入
	     InputSource source = new InputSource(read);
	     //创建一个新的SAXBuilder
	     SAXBuilder sb = new SAXBuilder();
	     try {
	         //通过输入源构造一个Document
	         Document doc = sb.build(source);
	         //取的根元素
	         Element root = doc.getRootElement();
	         System.out.println("根元素名称"+root.getName());//输出的（测试）
	         //得到根元素所有子元素的集合
	         List jiedian = root.getChildren();
	         //获得XML中的命名空间（XML中未定义可不写）
	         Namespace ns = root.getNamespace();
	         Element et = null;
	         for(int i=0;i<jiedian.size();i++){
	             et = (Element) jiedian.get(i);//循环依次得到子元素
	             String jieguo=et.getName();
	             if(jieguo.equals("result_code")){
	             	String j=et.getText();
	             	if(j.equals("SUCCESS")){
	             		System.out.println("成功了！");
	             		return "yes";
	             		
	             	}
	             }   
	         }
	        
	   
	     } catch (Exception e) {
	     	e.printStackTrace();
	     }
	     
	     return null;
	
		}
 
 
 public String send(String openid,String ip,double money){
	    String finalmoney = String.format("%.2f", money);
		finalmoney = finalmoney.replace(".", "");
	    // MD5Util m=new MD5Util();
		// 商户相关资料
		Peizhi peizhi = DAO.findone(Peizhi.class);
		String appid = peizhi.getAppid();
		String appsecret = peizhi.getAppsecret();
		String partner = peizhi.getPartner();
		String partnerkey = peizhi.getPartnerkey();
		
		System.out.println("appid"+appid);
		System.out.println("partner"+partner);
		
	    SimpleDateFormat df1 = new SimpleDateFormat("MMddHHmmss");
 		String idd = df1.format(new Date());
		//String orderNNo =  MoneyUtils.getOrderNo() ; 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mch_appid",appid);//appid
		map.put("mchid",partner);//商户号
		map.put("nonce_str",MoneyUtils.buildRandom() );//随机字符串
		map.put("partner_trade_no",idd);//商户订单号
		map.put("openid", openid);//用户openid
		map.put("amount", finalmoney);//付款金额
		map.put("check_name", "NO_CHECK");
		map.put("desc", "sslf");//描述
		map.put("spbill_create_ip", ip);
		map.put("sign", MoneyUtils.createSign(map));//签名

		String reqXml = MoneyUtils.createXML(map);
		String resXml = "";
		try {
			resXml = MoneyUtils.doSendMoney(url1, reqXml);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("reqXml:"+reqXml);
		System.out.println("resXml:"+resXml);
	
		 //创建一个新的字符串
	     StringReader read = new StringReader(resXml);
	     //创建新的输入源SAX 解析器将使用 InputSource 对象来确定如何读取 XML 输入
	     InputSource source = new InputSource(read);
	     //创建一个新的SAXBuilder
	     SAXBuilder sb = new SAXBuilder();
	     try {
	         //通过输入源构造一个Document
	         Document doc = sb.build(source);
	         //取的根元素
	         Element root = doc.getRootElement();
	         System.out.println("根元素名称"+root.getName());//输出的（测试）
	         //得到根元素所有子元素的集合
	         List jiedian = root.getChildren();
	         //获得XML中的命名空间（XML中未定义可不写）
	         Namespace ns = root.getNamespace();
	         Element et = null;
	         for(int i=0;i<jiedian.size();i++){
	             et = (Element) jiedian.get(i);//循环依次得到子元素
	             String jieguo=et.getName();
	             if(jieguo.equals("result_code")){
	             	String j=et.getText();
	             	if(j.equals("SUCCESS")){
	             		System.out.println("成功了！");
	             		return "yes";
	             		
	             	}
	             }   
	         }
	        
	   
	     } catch (Exception e) {
	     	e.printStackTrace();
	     }
	     
	     return null;
 }
 
 public static void refund(String orderId, double totalFee, double refundFee, String opUserId,
			String openId){
	 Map<String, String> resultMap=refundOrder(orderId,totalFee, refundFee, opUserId, openId);
	/* for (Map.Entry<String, String> entry : resultMap.entrySet()) {  
		    System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());  
	 } */ 
		 
 }
 
 public static int refund1(String orderId, double totalFee, double refundFee, String opUserId,
			String openId){
		int code=0;
	 Map<String, String> resultMap=refundOrder1(orderId,totalFee, refundFee, opUserId, openId);
	 for (Map.Entry<String, String> entry : resultMap.entrySet()) {  
		    System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());  
		    
		    if (entry.getKey().equals("return_msg")) {
				if (entry.getValue().equals("OK")) {
					System.out.println("flag:"+entry.getValue().equals("OK"));
					code=1;
					System.out.println("成功");
				}else {
					System.out.println("flag:"+entry.getValue().equals("OK"));
					code=0;
					System.out.println("失败");
				}
			}
	 }
	return code;  
 }
 /**
  * @author csyaonie@qq.com
  * @date 2017-5-8
  * Description: 自动退款功能
  */
	public static Map<String, String> refundOrder1(String orderId, double totalFee1, double refundFee1, String opUserId,
			String openId) {
		String totalFee = String.format("%.2f", totalFee1);
		totalFee = totalFee.replace(".", "");
		totalFee= String.valueOf(Integer.valueOf(totalFee));
		
		String refundFee = String.format("%.2f", refundFee1);
		refundFee = refundFee.replace(".", "");
		refundFee = String.valueOf(Integer.valueOf(refundFee));
		// 商户相关资料
		Order2 o = Order2DAO.find(orderId);
		String appid = "wx4762347a01c410da";

		String partner =  MoneyUtils.KEYSTORE_PASSWORD;


		Map<String, String> resultMap = new HashMap<String, String>();
		Map<String, String> parseMap = new HashMap<String, String>();
		// 申请退款接口地址
		String requestUrl = "https://api.mch.weixin.qq.com/secapi/pay/refund";
		// 构造请求微信支付系统参数
		Map<String, String> paramMap = new HashMap<String, String>();

		paramMap.put("appid", appid);
		paramMap.put("mch_id", partner);
		paramMap.put("nonce_str", MoneyUtils.buildRandom());
		
		cert_path = MoneyUtils.KEYSTORE_FILE;
		cert_pwd = MoneyUtils.KEYSTORE_PASSWORD;

		// 商户侧传给微信的订单号
		paramMap.put("out_trade_no", orderId);
		// 微信生成的订单号，在支付通知中有返回
		paramMap.put("out_refund_no", orderId);// StringHelper.getUUID()
		// paramMap.put("transaction_id", "1005090346201509150891328635");
		// 订单总金额，单位为分，只能为整数
		paramMap.put("total_fee", "1");
		// 退款总金额，订单总金额，单位为分，只能为整数
		paramMap.put("refund_fee", "1");
		// 操作员帐号, 默认为商户号
		paramMap.put("op_user_id", partner);
		
		try {
			log.info(String.format("PARAMS:orderId=%s,totalFee=%s,refundFee=%s,opUserId=%s,openId=%s",
				orderId,totalFee,refundFee,opUserId,openId));
			parseMap = sendToWechat(requestUrl, paramMap, true);
			log.info(String.format("return:%s ",parseMap));
			// 结果处理
			if (parseMap != null) {
				resultMap.put("return_code", parseMap.get("return_code"));
				resultMap.put("return_msg", parseMap.get("return_msg"));
				resultMap.put("result_code", parseMap.get("result_code"));
				resultMap.put("refund_id", parseMap.get("refund_id"));
				resultMap.put("err_code", parseMap.get("err_code"));
				resultMap.put("err_code_des", parseMap.get("err_code_des"));
				resultMap.put("transaction_id", parseMap.get("transaction_id"));
			}
		} catch (Exception e) {
			log.error("------------------微信退款---------------------", e);
			log.error(e.getStackTrace().toString());
			e.printStackTrace();
			resultMap.put("return_code", "FAIL");
			resultMap.put("result_code", "FAIL");
			resultMap.put("return_msg", e.getMessage());
		}
		log.info("=====================end refund==============");
	
		return resultMap;
	}
 /**
  * @author csyaonie@qq.com
  * @date 2017-5-8
  * Description: 自动退款功能
  */
	public static Map<String, String> refundOrder(String orderId, double totalFee1, double refundFee1, String opUserId,
			String openId) {
		String totalFee = String.format("%.2f", totalFee1);
		totalFee = totalFee.replace(".", "");
		totalFee= String.valueOf(Integer.valueOf(totalFee));
		
		String refundFee = String.format("%.2f", refundFee1);
		refundFee = refundFee.replace(".", "");
		refundFee = String.valueOf(Integer.valueOf(refundFee));
		// 商户相关资料
		Peizhi peizhi = DAO.findone(Peizhi.class);
		String appid = peizhi.getAppid();
		String appsecret = peizhi.getAppsecret();
		String partner = peizhi.getPartner();
		String partnerkey = peizhi.getPartnerkey();

		Map<String, String> resultMap = new HashMap<String, String>();
		Map<String, String> parseMap = new HashMap<String, String>();
		// 申请退款接口地址
		String requestUrl = "https://api.mch.weixin.qq.com/secapi/pay/refund";
		// 构造请求微信支付系统参数
		Map<String, String> paramMap = new HashMap<String, String>();

		paramMap.put("appid", appid);
		paramMap.put("mch_id", partner);
		paramMap.put("nonce_str", MoneyUtils.buildRandom());
		
		cert_path = MoneyUtils.KEYSTORE_FILE;
		cert_pwd = partner;

		// 商户侧传给微信的订单号
		paramMap.put("out_trade_no", orderId);
		// 微信生成的订单号，在支付通知中有返回
		paramMap.put("out_refund_no", orderId);// StringHelper.getUUID()
		// paramMap.put("transaction_id", "1005090346201509150891328635");
		// 订单总金额，单位为分，只能为整数
		paramMap.put("total_fee", totalFee);
		// 退款总金额，订单总金额，单位为分，只能为整数
		paramMap.put("refund_fee", refundFee);
		// 操作员帐号, 默认为商户号
		paramMap.put("op_user_id", partner);
		
		try {
			log.info(String.format("PARAMS:orderId=%s,totalFee=%s,refundFee=%s,opUserId=%s,openId=%s",
				orderId,totalFee,refundFee,opUserId,openId));
			parseMap = sendToWechat(requestUrl, paramMap, true);
			log.info(String.format("return:%s ",parseMap));
			// 结果处理
			if (parseMap != null) {
				resultMap.put("return_code", parseMap.get("return_code"));
				resultMap.put("return_msg", parseMap.get("return_msg"));
				resultMap.put("result_code", parseMap.get("result_code"));
				resultMap.put("refund_id", parseMap.get("refund_id"));
				resultMap.put("err_code", parseMap.get("err_code"));
				resultMap.put("err_code_des", parseMap.get("err_code_des"));
				resultMap.put("transaction_id", parseMap.get("transaction_id"));
			}
		} catch (Exception e) {
			log.error("------------------微信退款---------------------", e);
			log.error(e.getStackTrace().toString());
			e.printStackTrace();
			resultMap.put("return_code", "FAIL");
			resultMap.put("result_code", "FAIL");
			resultMap.put("return_msg", e.getMessage());
		}
		log.info("=====================end refund==============");
	
		return resultMap;
	}
	
	private static Map<String, String> sendToWechat(String requestUrl, Map<String, String> paramMap, boolean useCert)
				throws Exception, DocumentException {
			Map<String, String> parseMap;
			// 生成签名
			paramMap.put("sign", MoneyUtils.createSign2(paramMap));
			XmlHandler xmlHandler = new XmlHandler();
			String dataStr = xmlHandler.Map2Xml(paramMap);
			String result;
			
			// 发送请求
			if (useCert) {
				result = CommonUtil.sendHttpRequestWithCert(requestUrl, dataStr, cert_path, cert_pwd);
			} else {
				result = CommonUtil.sendHttpsRequest(requestUrl, "POST", dataStr);
			}
			
			// 结果解析
			parseMap = xmlHandler.simpleXml2Map(result);
			
			return parseMap;
			}
 
	
	
 
 public  String jieguo(String xmlDoc) {
    
     return null;
 }


}
