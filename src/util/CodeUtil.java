package util;

import java.util.Random;

import pojo.TimeUtil;

/**
 * 生成一个订单号
 * @author Administrator
 *
 */

public class CodeUtil {
	
	private static Random r=new Random();
	
	/**
	 * 根据 毫秒数+4位随机数
	 * @return
	 */
	public static String byTimeMillis(){
		return ""+System.currentTimeMillis()+getnum(4);
	}
	/**
	 * 根据yyyyMMddHHmmss +4位随机数
	 * @return
	 */
	public static String byDay(){
		return TimeUtil.getString("yyyyMMddHHmmss")+getnum(4);
	}
	
	
	
	private static String getnum(int n){
		StringBuffer sb=new StringBuffer();
		for(int i=0;i<n;i++){
			sb.append(r.nextInt(10));
		}
		return sb.toString();
	}
}











