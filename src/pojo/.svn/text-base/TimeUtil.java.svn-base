package pojo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TimeUtil {
	public static String getString(String str,Long time){
		SimpleDateFormat sdf=new SimpleDateFormat(str);
		return sdf.format(time);
	}
	
	public static String getString(String str,Date date){
		SimpleDateFormat sdf=new SimpleDateFormat(str);
		return sdf.format(date);
	}
	
	public static String getString(String str){
		return getString(str,new Date());
	}
	
	public static String getString(){
		return getString("yyyy-MM-dd HH:mm:ss",new Date());
	}
	
	public static String getOrderId(){
		return getString("MMddHHmmss",new Date());
	}
	
	public static String getStringShort(){
		return getString("yyyy-MM-dd",new Date());
	}
	
	public static String getStringByDate(Date date){
		return getString("yyyy-MM-dd HH:mm:ss",date);
	}
	
	public static String getString(Long time){
		return getString("yyyy-MM-dd HH:mm:ss",time);
	}
	
	public static Date getDate(String format,String datestr) throws ParseException{
		//System.out.println("format"+format);
		//System.out.println("datestr"+datestr);
		
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		return sdf.parse(datestr);
	}
	
	public static String getZeroTime(){
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 001);
		Date date = calendar.getTime();
		String time=TimeUtil.getStringByDate(date);
		return time;
	}
	
	
	
	
	
}
