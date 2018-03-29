package util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.Random;

import org.apache.struts2.ServletActionContext;

import pojo.TimeUtil;

public class ImageUploadUtil {
	public static String root="C:/shangbiao18/";
	
	public static String uploadForWX(String imgUrl, String openid){
		
		String fname = openid + ".jpg";
		try {
		
		URL url = new URL(imgUrl);
		// 打开连接
		URLConnection con = url.openConnection();
		// 输入流
		InputStream is = con.getInputStream();
		// 1K的数据缓冲
		byte[] bs = new byte[1024*100];
		// 读取到的数据长度
		int len=0;
		// 输出的文件流
		OutputStream os = new FileOutputStream(new File(root, fname));
		// 开始读取
		while ((len = is.read(bs)) != -1) {
			os.write(bs, 0, len);
		}
		// 完毕，关闭所有链接
		os.close();
		is.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "upload/"+fname;
	}
	
	public static String upload(File file,String fileFileName) {
		
		InputStream is = null;
		OutputStream os = null;
		try {
			String[] fileFileNamess = fileFileName.split("\\.");
			if(fileFileNamess.length>0)
				fileFileName=DateUtil.getfileName()+(int)(Math.random()*1000)+"."+fileFileNamess[fileFileNamess.length-1];
			else
				fileFileName=DateUtil.getfileName()+fileFileName;
		} catch (Exception e) {
			fileFileName=DateUtil.getfileName()+fileFileName;
			// TODO: handle exception
		}
		System.err.println(fileFileName);
		String path=root+fileFileName.substring(0,fileFileName.lastIndexOf("/"));
		
		

		
		File ff=new File(path);
		if(!ff.exists())
			ff.mkdirs();
		try {
			is = new FileInputStream(file);
			os = new FileOutputStream(new File(root,fileFileName));
			byte[] buffer = new byte[500];
			int length = 0;
			while (-1 != (length = is.read(buffer, 0, buffer.length))) {
				os.write(buffer);
			}
			return "upload/"+fileFileName;
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e1) {

		} finally {
			try {
				if(os!=null)os.close();
				if(is!=null)is.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "";
	}
	
public static String upload1(File file,String fileFileName) {
		
		InputStream is = null;
		OutputStream os = null;
		//System.out.println("fileFileName==="+fileFileName);
		//System.out.println(fileFileName);
		fileFileName=DateUtil.getfileName()+fileFileName;
		//System.out.println(fileFileName);
		String path=root+fileFileName.substring(0,fileFileName.lastIndexOf("/"));
		
		
		
		File ff=new File(path);
		if(!ff.exists())
			ff.mkdirs();
		try {
			is = new FileInputStream(file);
			os = new FileOutputStream(new File(root,fileFileName));
			byte[] buffer = new byte[500];
			int length = 0;
			while (-1 != (length = is.read(buffer, 0, buffer.length))) {
				os.write(buffer);
			}
			return "upload/"+fileFileName;
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e1) {

		} finally {
			try {
				if(os!=null)os.close();
				if(is!=null)is.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "";
	}
	

}
