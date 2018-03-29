import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import pojo.TimeUtil;
import util.DateUtil;



public class text {

public static void main(String[] args) throws IOException {
	Calendar calendar = new GregorianCalendar();
	calendar.setTime(new Date());
	calendar.add(calendar.DATE,-7);
	String time = new SimpleDateFormat("yyyy/MM/dd").format(calendar.getTime());
	System.err.println(time);
		
	String fileFileName = "logo.jpg";
	String[] fileFileNamess = fileFileName.split("\\.");
	System.err.println(fileFileName);
	System.err.println(fileFileNamess.length);
	if(fileFileNamess.length>0)
		fileFileName=DateUtil.getfileName()+TimeUtil.getOrderId()+(int)(Math.random()*1000)+"."+fileFileNamess[fileFileNamess.length-1];
	String path=fileFileName.substring(0,fileFileName.lastIndexOf("/"));
	
	
	
	
	
	
	
	
	
	
	
	
    //System.err.println(0.03+0.3);
	
	
	
}

}
