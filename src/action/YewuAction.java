package action;

import java.io.File;
import java.math.BigDecimal;
import java.util.List;

import pojo.Award;
import pojo.JsonResult;
import pojo.Sb;
import pojo.Sbfenlei;
import pojo.Yewu;
import util.ImageUploadUtil;
import dao.DAO;

public class YewuAction extends BaseAction{
	
	private List<Yewu> yewus;
	private Yewu yewu;
	private File[] files;
	private String[] filesFileName;
	private File file;
	private String fileFileName;
	private String[] imgs;
	
	
	private JsonResult jsonresult;
	private String ss;
	private Integer ssnum;
	private List<Sb> sbs;
	private List<Sbfenlei> sbfenleis;
	
	private Integer yewuid;
	
	
	


	/**
	 * 前台
	 * **/
	public String sousuo(){
		jsonresult=new JsonResult();
		//System.out.println(ss);
		if(ssnum==1){
			yewus=DAO.sousuostring(ss);
			sbfenleis=DAO.findall(Sbfenlei.class);
			jsonresult.setObjs2(sbfenleis);
			jsonresult.setObjs(yewus);
		}else if (ssnum==2) {
			sbfenleis=DAO.sousuostring1(ss);
			yewus=DAO.findall(Yewu.class);
			jsonresult.setObjs(yewus);
			jsonresult.setObjs2(sbfenleis);
		}
		
		
		return "jsonresult";
	}
	public String chakanyw(){
		jsonresult=new JsonResult();
		yewu=DAO.findbyid(Yewu.class, yewuid);
		//System.out.println("yewuid=="+yewuid);
		jsonresult.setObject(yewu);
		
		imgs=yewu.getXqimg().split(",");
		
		jsonresult.setImgs(imgs);
		jsonresult.setIntint(adddouble(yewu.getPrice(), 0));
		return "jsonresult";
	}
	  public static double adddouble(double m1, double m2) {
	        BigDecimal p1 = new BigDecimal(Double.toString(m1));
	        BigDecimal p2 = new BigDecimal(Double.toString(m2));
	        return p1.add(p2).doubleValue();
	    }
	
	
	
	/**
	 * 后台
	 * **/
	
	
	//查找
	public String find(){
		
		yewus=DAO.findall(Yewu.class);
		
		return "find";
	}
	//添加
	public String add(){
			
		Yewu yewu1=new Yewu();
		
			String imgName=ImageUploadUtil.upload1(file, fileFileName);
			
			String name1="";
			for (int i = 0; i <= files.length-1; i++) {
				if(i==0){
					
					name1=ImageUploadUtil.upload1(files[i], filesFileName[i]);
					
				}else{
					
					name1=name1+","+ImageUploadUtil.upload1(files[i], filesFileName[i]);
				}
			 }
			yewu1.setImg(imgName);
			yewu1.setXqimg(name1);
			yewu1.setBiaoti(yewu.getBiaoti());
			yewu1.setPrice(yewu.getPrice());
			yewu1.setJianjie(yewu.getJianjie());
			
			yewu1.setXiaoxiang(yewu.getXiaoxiang());
			yewu1.setUptime(yewu1.getTime());
			DAO.save(yewu1);
		
		
		
		return find();
	}
	

	//修改
	public String xiugai(){
			
			yewu=DAO.findbyid(Yewu.class, yewu.getId());
			
			return "xiugai";
		}
	//删除
	public String delete(){
		
		yewu=DAO.findbyid(Yewu.class, yewu.getId());
		DAO.delete(yewu);
		return find();
	}
	//查看
	public String look(){
		
		yewu=DAO.findbyid(Yewu.class, yewu.getId());
		imgs=yewu.getXqimg().split(",");
		return "look";
	}
	//更新
	public String update(){
		
		Yewu yewu1=new Yewu();
		yewu1=DAO.findbyid(Yewu.class, yewu.getId());
		
		if(file!=null){
			String imgName=ImageUploadUtil.upload1(file, fileFileName);
			yewu1.setImg(imgName);
		}
		
		if(files!=null){
			String name1="";
			for (int i = 0; i <= files.length-1; i++) {
				if(i==0){
					
					name1=ImageUploadUtil.upload1(files[i], filesFileName[i]);
					
				}else{
					
					name1=name1+","+ImageUploadUtil.upload1(files[i], filesFileName[i]);
				}
				
				yewu1.setXqimg(name1);
				
			 }
			
		}
		
		
		yewu1.setBiaoti(yewu.getBiaoti());
		yewu1.setPrice(yewu.getPrice());
		yewu1.setJianjie(yewu.getJianjie());
		yewu1.setXiaoxiang(yewu.getXiaoxiang());
		DAO.update(yewu1);
		
		
		return find();
	}


	
	
	
	
	
	public List<Yewu> getYewus() {
		return yewus;
	}

	public void setYewus(List<Yewu> yewus) {
		this.yewus = yewus;
	}
	
	public Yewu getYewu() {
		return yewu;
	}



	public void setYewu(Yewu yewu) {
		this.yewu = yewu;
	}



	public Award getAward() {
		return award;
	}

	public File[] getFiles() {
		return files;
	}



	public void setFiles(File[] files) {
		this.files = files;
	}



	public void setAward(Award award) {
		this.award = award;
	}



	public String[] getFilesFileName() {
		return filesFileName;
	}



	public JsonResult getJsonresult() {
		return jsonresult;
	}



	public void setJsonresult(JsonResult jsonresult) {
		this.jsonresult = jsonresult;
	}



	public String getSs() {
		return ss;
	}



	public void setSs(String ss) {
		this.ss = ss;
	}



	public void setFilesFileName(String[] filesFileName) {
		this.filesFileName = filesFileName;
	}



	public File getFile() {
		return file;
	}



	public void setFile(File file) {
		this.file = file;
	}



	public String[] getImgs() {
		return imgs;
	}



	public void setImgs(String[] imgs) {
		this.imgs = imgs;
	}



	public Integer getSsnum() {
		return ssnum;
	}



	public void setSsnum(Integer ssnum) {
		this.ssnum = ssnum;
	}



	public Integer getYewuid() {
		return yewuid;
	}



	public void setYewuid(Integer yewuid) {
		this.yewuid = yewuid;
	}



	public List<Sb> getSbs() {
		return sbs;
	}



	public List<Sbfenlei> getSbfenleis() {
		return sbfenleis;
	}



	public void setSbfenleis(List<Sbfenlei> sbfenleis) {
		this.sbfenleis = sbfenleis;
	}



	public void setSbs(List<Sb> sbs) {
		this.sbs = sbs;
	}



	public String getFileFileName() {
		return fileFileName;
	}



	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}




	
}
