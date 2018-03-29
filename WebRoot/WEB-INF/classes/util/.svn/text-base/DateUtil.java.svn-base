package util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

public class DateUtil {
	
	public static String getRandomName(){
		String thisTime=null;
		SimpleDateFormat sdf=new SimpleDateFormat("HHmmssSSS");
		thisTime=sdf.format(System.currentTimeMillis());
		return thisTime;
	}
	
	
	/**
	 * yyyy/MM/dd HH:mm:ss获取当前时间
	 * @return
	 */
	public static String getfileName(){
		String thisTime=null;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd/HHmmssSSS");
		thisTime=sdf.format(System.currentTimeMillis());
		
		return thisTime;
	}
	/**
	 * yyyy-MM-dd HH:mm:ss获取当前时间
	 * @return
	 */
	public static String getThisTime(){
		String thisTime=null;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		thisTime=sdf.format(System.currentTimeMillis());
		return thisTime;
	}
	/**
	 *timestamp
	 * @param args
	 */
	public static Timestamp getThisTimes(){
		Timestamp thisTime=new Timestamp(System.currentTimeMillis());
		return thisTime;
	}
	//测试 2016-11-07 14:17:54
	public static void main(String[] args) {
		System.out.println(DateUtil.getThisTime());
	}
}
