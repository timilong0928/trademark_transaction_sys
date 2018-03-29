package util;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

public class ImgCompose {
	 /**
	      * 
	      * @Title: 构造图片
	      * @Description: 生成水印并返回java.awt.image.BufferedImage
	      * @param file
	      *            源文件(图片)
	      * @param waterFile
	      *            水印文件(图片)
	      * @param x
	      *            距离右下角的X偏移量
	      * @param y
	      *            距离右下角的Y偏移量
	      * @param alpha
	      *            透明度, 选择值从0.0~1.0: 完全透明~完全不透明
	      * @return BufferedImage
	      * @throws IOException
	      */
	     public static BufferedImage watermark(File bjfile, File erweimaFile) throws IOException {
	    	 float alpha = 1f;
	    	 // 获取底图
	         BufferedImage buffImg = ImageIO.read(bjfile);
	         int ImgWidth = buffImg.getWidth();// 获取低图的宽度
	         int ImgHeight = buffImg.getHeight();// 获取低图的高度
	         // 获取二维马层图
	         BufferedImage erweimaImg = ImageIO.read(erweimaFile);
	         //int waterImgWidth = erweimaImg.getWidth();// 获取层图的宽度
	         //int waterImgHeight = erweimaImg.getHeight();// 获取层图的高度
	         // 获取头像层图
	         //int txImgWidth = erweimaImg.getWidth();// 获取层图的宽度
	         //int txImgHeight = erweimaImg.getHeight();// 获取层图的高度
	         
//	         System.out.println(ImgWidth+":"+ImgHeight);
//	         System.out.println(waterImgWidth+":"+waterImgHeight);
//	         System.out.println(txImgWidth+":"+txImgHeight);
	         
	         // 创建Graphics2D对象，用在底图对象上绘图
	         Graphics2D g2d = buffImg.createGraphics();
	         // 在图形和图像中实现混合和透明效果
	         g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, alpha));
	         // 绘制
	         g2d.drawImage(erweimaImg,257, 793, 236,236, null);
	         //
	         g2d.dispose();// 释放图形上下文使用的系统资源
	         
	         return buffImg;
	     }
	 
	     /**
	      * 输出水印图片
	      * 
	      * @param buffImg
	      *            图像加水印之后的BufferedImage对象
	      * @param savePath
	      *            图像加水印之后的保存路径
	      */
	     private void generateWaterFile(BufferedImage buffImg, String savePath) {
	         int temp = savePath.lastIndexOf(".") + 1;
	         try {
	             ImageIO.write(buffImg, savePath.substring(temp), new File(savePath));
	         } catch (IOException e1) {
	             e1.printStackTrace();
	         }
	     }
	 
	     /**
	      * 
	      * @param args
	      * @throws IOException
	      *             IO异常直接抛出了
	      * @author bls
	      */
	     public static void main(String[] args) throws IOException {
	         //上层图片
	         String waterFilePath = "C:\\shangbiao18\\erweima\\1002.jpg";
	         //新图片
	         String saveFilePath = "C:\\shangbiao18\\erweima\\1002.jpg";
	         String sourceFilePath = "C:\\shangbiao18\\hb.jpg";
	         ImgCompose imgCompose = new ImgCompose();
	         hecheng(waterFilePath,saveFilePath ,new File(sourceFilePath));
	         
	         // 构建叠加层
	         //BufferedImage buffImg = imgCompose.watermark(new File(sourceFilePath), new File(waterFilePath), 350, 800, 1f);
	         // 输出水印图片
	         //imgCompose.generateWaterFile(buffImg, saveFilePath);
	         
	     }
	     
	     public static void hecheng(String erweimaFilePath , String saveFilePath , File sourceFilePath) throws IOException{
	    	 //背景图
	        System.err.println(sourceFilePath);
	        System.err.println("C:\\shangbiao18\\hb.jpg");
	         //新图片
	        // String saveFilePath = "D:\\Apache Software Foundation\\apache-tomcat-7.0.75-windows-x86\\apache-tomcat-7.0.75\\webapps\\PC\\upload\\25.jpg";
	         ImgCompose imgCompose = new ImgCompose();
	         // 构建叠加层
	         BufferedImage buffImg = imgCompose.watermark(sourceFilePath, new File(erweimaFilePath));
	         imgCompose.generateWaterFile(buffImg, saveFilePath);
	         // 输出水印图片
	     }
}

