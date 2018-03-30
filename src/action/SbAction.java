package action;

import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import pojo.Award;
import pojo.Fenxiao;
import pojo.JsonResult;
import pojo.Sb;
import pojo.Sbfenlei;
import util.ImageUploadUtil;
import dao.DAO;

public class SbAction extends BaseAction{

	
	private Sbfenlei fenlei;
	private List<Sbfenlei> fenleis;
	
	private Sb sb;
	private Sb shangbiao;
	private List<Sb> sbs;
	private List<Sb> sbs1;
	private List<Sb> sbs2;
	private List<Sb> sbs3;
	
	private File file;
	private String fileFileName;
	
	private int key;
	private String keyword="";//搜索内容
	private String keyword1="";//搜索内容
	
	private String keyword2="";//返回搜索内容
	
	
	private String keyword3="";//搜索内容
	private String keyword4="";//搜索内容
	
	private Integer sbid;
	private Integer sbid1;
	private JsonResult jsonresult;
	private String ss;
	private String fenleiname;//分类名名称
	
	private Integer id;
	/**
	 * 前台
	 * **/
	public String chakansb(){
		jsonresult = new JsonResult();
		//System.out.println("sb进来"+sbid);
		sbs=DAO.findbyinteger(Sb.class, "fenleiid", sbid);
		if(sbs!=null){
			jsonresult.setObjs(sbs);
			
			return "jsonresult";
			
		}
		return null;
	}
	public String chakansb1(){
		
		jsonresult = new JsonResult();
		
		shangbiao=DAO.findbyid(Sb.class, sbid1);
		
		if(shangbiao!=null){
			jsonresult.setObject(shangbiao);
			fenlei=DAO.findbyid(Sbfenlei.class, shangbiao.getFenleiid());
			
			fenleiname=fenlei.getName();
			System.out.println(fenleiname);
			jsonresult.setRes1(fenleiname);
			return "jsonresult";
			
		}
		return null;
	}
	
	public String sousuo(){
		jsonresult = new JsonResult();
		
		sbs=DAO.findby2mohu("title", "biaohao", ss,sbid);
		if(sbs!=null){
			jsonresult.setObjs(sbs);
			return "jsonresult";
		}
			return null;
	}
	
	/**
	 * 后台
	 * **/
	//
	public String chazhao(){
		
		if(id==1){
			return find1();
			
			
		}else if (id==2) {
			sbs=DAO.findbyinteger(Sb.class, "state", 0);
			
			
			return "find1";	
		}else {
			sbs=DAO.findbyinteger(Sb.class, "state", 1);
			return "find1";
		}
	}
	public String searchbiaohao1(){
		
		try {

			if (keyword3!=null||keyword3!="") {
					System.out.println("keyword3==="+keyword3);
					System.out.println("keyword4==="+keyword4);
					String[] strArray = null; 
					strArray = keyword3.split(",");
					System.err.println("strArray==="+strArray);
					for (int i = 0; i < strArray.length; i++) {
						System.out.println("Integer.parseInt(strArray[i])=="+Integer.parseInt(strArray[i]));
			        	fenlei=DAO.findbyid(Sbfenlei.class, Integer.parseInt(strArray[i]));
			        	if (fenlei!=null) {
			        		if (i==0) {
			        			if ("".equals(keyword4)) {
			        				
			        				sbs=DAO.findbyinteger(Sb.class, "fenleiid", Integer.parseInt(strArray[i]));
			        			}else {
									sbs=DAO.findby2mohu("title", "biaohao", keyword4,fenlei.getId());
				        			System.err.println("sbs=="+sbs);
								}
			        			
			        		}else {
			        			if (sbs!=null) {
									
								
			        			if ("".equals(keyword4)) {
			        			
									sbs1=DAO.findbyinteger(Sb.class, "fenleiid", Integer.parseInt(strArray[i]));
									List<Sb> sbs2 = new ArrayList<Sb>();
									
									
									Sb jjSb=null;
									for (Sb s:sbs){
										 for (Sb b:sbs1) {
											
											if (b.getTitle().equals(s.getTitle())) {
												jjSb=b;
												sbs2.add(s);
											}if (jjSb!=null) {
												sbs2.add(jjSb);
												jjSb=null;
											}
										}
									}
									HashSet hs  =   new  HashSet(sbs2);  
									sbs2.clear();  
									sbs2.addAll(hs);
									System.out.println("sbs2===="+sbs2);
									System.out.println("sbs0=+++"+sbs);
									sbs.removeAll(sbs);
									
									System.out.println("sbs111=+++"+sbs);
									for (int j = 0; j < sbs2.size(); j++) {
										sbs.add(sbs2.get(j));
									}
									//sbs.remove(yySb);
									System.out.println("sbs222=+++"+sbs);
									
									
								}else {
									System.err.println("jin2");
			        				sbs1=DAO.findby2mohu("title", "biaohao", keyword4,fenlei.getId());
			        				sbs.addAll(sbs1);
			        			}
								
			        			}else {
									msg="请不要输入无效的商标分类";
									return "find1";
								}	
							}
				       }else {
							
						}	
					}
				
			
			}else {
				msg="请输入分类id";
			}	
			if (sbs!=null) {
				for(Sb b:sbs){
					
					fenlei=DAO.findbyid(Sbfenlei.class, b.getFenleiid());
					b.setFenleiname(fenlei.getName());
					
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			msg="输入不符合规则，请重新输入";
		}
		
		return "find1";
		
	}
	//搜索商标
	public String searchbiaohao(){
		System.err.println("11111keyword==="+keyword);
		
		try {
		
		if (keyword!=null||keyword!="") {
			keyword2=keyword;

			if (key==1) {
				sbs=DAO.searchbiaohao(keyword);
				session.put("sbs", sbs);
			}if (key==2) {
				
					sbs=DAO.searchbiaohao1(keyword);
					session.put("sbs", sbs);
			}
			
		}else {
			msg="请填写关键词";
		}
			
		for(Sb b:sbs){
			fenlei=DAO.findbyid(Sbfenlei.class, b.getFenleiid());
			b.setFenleiname(fenlei.getName());
		}
		} catch (Exception e) {
			e.printStackTrace();
			msg="输入不符合规则，请重新输入";
		}	
		return "find1";
	}
	//查找商标
	public String find1(){
		
		sbs=DAO.findall(Sb.class);
		
		fenleis=DAO.findall(Sbfenlei.class);
		return "find1";
	}
	//跳转添加商标
	public String add1(){
		
		fenleis=DAO.findall(Sbfenlei.class);
		//System.out.println("fenleis=="+fenleis);
		return "add1";
	}
	//添加商标
	public String addsb(){
		
		String imgName=ImageUploadUtil.upload1(file, fileFileName);
		sb.setImg(imgName);
		
		sb.setFenleiid(key);
		fenlei=DAO.findbyid(Sbfenlei.class, key);
		sb.setFenleiname(fenlei.getName());
		DAO.save(sb);
		
		return find1();
	}
	//检查编号
	public String checkbianhao(){
		
		shangbiao=DAO.findbystringone(Sb.class, "biaohao", sb.getBiaohao());
		if (shangbiao!=null) {
			msg="1";
			
		}
		return "json_msg";
	}
	//查看分类
	public String look1(){
		
		sb=DAO.findbyid(Sb.class, sbid);
		fenlei=DAO.findbyid(Sbfenlei.class, sb.getFenleiid());
		sb.setFenleiname(fenlei.getName());
		return "look1";
	}
	//修改商标
	public String xiugai(){
		
		sb=DAO.findbyid(Sb.class, sbid);
		fenlei=DAO.findbyid(Sbfenlei.class, sb.getFenleiid());
		fenleis=DAO.findall(Sbfenlei.class);
		sb.setFenleiname(fenlei.getName());
		return "xiugai";
	}
	
	//更新商标
	public String update1(){
		
	   Sb sb1=new Sb();
	   sb1=DAO.findbyid(Sb.class, sbid);
	   
	   
		if(file!=null){
			
			String imgName=ImageUploadUtil.upload1(file, fileFileName);
			sb1.setImg(imgName);
			
		}
			sb1.setBiaohao(sb.getBiaohao());
			sb1.setTitle(sb.getTitle());
			sb1.setPrice(sb.getPrice());
			sb1.setFenleiid(key);
			sb1.setTime(sb.getTime());
			sb1.setJieshao(sb.getJieshao());
			sb1.setLeixing(sb.getLeixing());
			sb1.setQunzu(sb.getQunzu());
			
		
			
			try {
				DAO.update(sb1);	
				msg="更新成功";
			} catch (Exception e) {
				e.printStackTrace();
				msg="更新失败";
			}
			
			
			return find1();
	}
	
	//删除商标
	public String delete1(){
		
		sb=DAO.findbyid(Sb.class, sb.getId());
		DAO.delete(sb);
		return find1();
	}
	
	//查看分类
	public String find(){
		
		fenleis=DAO.findall(Sbfenlei.class);
		return "find";
	}
	//添加分类
	public String add(){
		
		String imgName=ImageUploadUtil.upload1(file, fileFileName);
		fenlei.setImg(imgName);
		fenlei.setName(fenlei.getName());
		DAO.save(fenlei);
		return find();
	}
	
	//更新分类
	public String update(){
		System.out.println("分类更新"+fenlei.getName()+"ddddd"+file);
	   Sbfenlei fenlei1=new Sbfenlei();
	   fenlei1=DAO.findbyid(Sbfenlei.class, fenlei.getId());
	   
	   
		if(file!=null){
			
			String imgName=ImageUploadUtil.upload1(file, fileFileName);
			fenlei1.setImg(imgName);
			
		}
			fenlei1.setName(fenlei.getName());
			//fenlei1.setFenleiid(fenlei.getFenleiid());
			
			try {
				DAO.update(fenlei1);
				msg="更新成功";
			} catch (Exception e) {
				e.printStackTrace();
				msg="更新失败";
			}
			
			
			return find();
	}
	//删除分类
	public String delete(){
		
		fenlei=DAO.findbyid(Sbfenlei.class, fenlei.getId());
		DAO.delete(fenlei);
		return find();
	}
	
	//查看分类
	public String look(){
		
		fenlei=DAO.findbyid(Sbfenlei.class, fenlei.getId());
		sbs=DAO.findbyinteger(Sb.class, "fenlei", fenlei.getId());
		return "look";
	}
	public Sbfenlei getFenlei() {
		return fenlei;
	}
	public void setFenlei(Sbfenlei fenlei) {
		this.fenlei = fenlei;
	}
	public List<Sbfenlei> getFenleis() {
		return fenleis;
	}
	public void setFenleis(List<Sbfenlei> fenleis) {
		this.fenleis = fenleis;
	}
	public Sb getSb() {
		return sb;
	}
	public void setSb(Sb sb) {
		this.sb = sb;
	}
	public Sb getShangbiao() {
		return shangbiao;
	}
	public void setShangbiao(Sb shangbiao) {
		this.shangbiao = shangbiao;
	}
	public List<Sb> getSbs() {
		return sbs;
	}
	public void setSbs(List<Sb> sbs) {
		this.sbs = sbs;
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public int getKey() {
		return key;
	}
	public void setKey(int key) {
		this.key = key;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Integer getSbid() {
		return sbid;
	}
	public void setSbid(Integer sbid) {
		this.sbid = sbid;
	}
	public Integer getSbid1() {
		return sbid1;
	}
	public void setSbid1(Integer sbid1) {
		this.sbid1 = sbid1;
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
	public List<Sb> getSbs2() {
		return sbs2;
	}
	public void setSbs2(List<Sb> sbs2) {
		this.sbs2 = sbs2;
	}
	public String getFenleiname() {
		return fenleiname;
	}
	public void setFenleiname(String fenleiname) {
		this.fenleiname = fenleiname;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getKeyword1() {
		return keyword1;
	}
	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}
	public List<Sb> getSbs1() {
		return sbs1;
	}
	public void setSbs1(List<Sb> sbs1) {
		this.sbs1 = sbs1;
	}
	public String getKeyword2() {
		return keyword2;
	}
	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}
	public String getKeyword3() {
		return keyword3;
	}
	public void setKeyword3(String keyword3) {
		this.keyword3 = keyword3;
	}
	public String getKeyword4() {
		return keyword4;
	}
	public void setKeyword4(String keyword4) {
		this.keyword4 = keyword4;
	}
	public List<Sb> getSbs3() {
		return sbs3;
	}
	public void setSbs3(List<Sb> sbs3) {
		this.sbs3 = sbs3;
	}
	
	
	
	 



	
}
