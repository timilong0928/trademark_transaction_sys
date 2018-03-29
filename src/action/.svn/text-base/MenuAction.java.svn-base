package action;

import java.util.ArrayList;
import java.util.List;

import pojo.MainBtn;
import pojo.Peizhi;

import com.yx.pojo.AccessToken;  
import com.yx.pojo.Button;  
import com.yx.pojo.CommonButton;  
import com.yx.pojo.ComplexButton;  
import com.yx.pojo.Menu;  
import com.yx.util.WeixinUtil;  

import dao.DAO;
import dao.PeizhiDAO;
 

public class MenuAction {

	 private List<CommonButton> btn1;//二级菜单的name、type、key、url
	 private List<CommonButton> btn2;
	 private List<CommonButton> btn3;
	 
	 private ComplexButton Button1;
	 private ComplexButton Button2;
	 private ComplexButton Button3;
	 private List<ComplexButton> ones;
	 
	 private MainBtn mainBtn1;//一级菜单(名称和分类)
	 private MainBtn mainBtn2;
	 private MainBtn mainBtn3;

	 private Peizhi peizhi;
	 private String msg;
	
	//查询菜单的接口
	public void findMenu(){
		
		peizhi = PeizhiDAO.findone(Peizhi.class);
		String appId = peizhi.getAppid();
		String appSecret = peizhi.getAppsecret();
		AccessToken at = WeixinUtil.getAccessToken(appId, appSecret); 
		String result = WeixinUtil.findMenu(at.getToken()); 
		System.err.println("result："+result);
	}
	//跳转自定义菜单
	public String find(){
		ones = (List<ComplexButton>) DAO.findall(ComplexButton.class);
		CommonButton two = new CommonButton();
		for(ComplexButton c:ones){
			two.setComplexButtonId(c.getId());
			List<CommonButton> twos = (List<CommonButton>) DAO.find(two);
			c.setSub_button(twos);
		}
		return "success";
	}
	//创建菜单
	public String add(){
		//创建菜单先把数据库的菜单清空
		List<ComplexButton>ones = (List<ComplexButton>) DAO.findall(ComplexButton.class);
		if(ones!=null && ones.size()>0){
			DAO.delete(ones);
		}
		List<CommonButton>twos = (List<CommonButton>) DAO.findall(CommonButton.class);
		if(twos!=null && twos.size()>0){
			DAO.delete(twos);
		}
		//一级菜单如果type为空，则表示有子菜单
	    List<Button> button = new ArrayList<Button>();
	    if(mainBtn1!=null){
	    	Button1=new ComplexButton();  
	    	Button1.setName(mainBtn1.getName());
	    	Button1.setClassify(mainBtn1.getClassify());
	    	if(mainBtn1.getClassify()==1){//一级菜单
	    		Button1.setType(mainBtn1.getType());
	    		if("click".equals(mainBtn1.getType())){//事件click
	    			Button1.setKey(mainBtn1.getUrl());
	    		}else{//链接view
	    			Button1.setUrl(mainBtn1.getUrl());
	    		}
	    	}
	    	System.err.println("name:"+Button1.getName());
	    	DAO.save(Button1);
	    	//System.err.println("id:"+Button1.getId());
	    	if(mainBtn1.getClassify()==2){//二级菜单
	    		if(btn1!=null){
	    			for(CommonButton c:btn1){
	    				if("click".equals(c.getType())){
	    					c.setKey(c.getUrl());
	    					c.setUrl("");
	    				}
	    				c.setComplexButtonId(Button1.getId());
	    				DAO.save(c);
	    			}
	    			
	    		}
	    		Button1.setSub_button(btn1); 
	    	}
	    	button.add(Button1);
	    }
	      
         if(mainBtn2!=null){
        	 Button2=new ComplexButton();
        	 Button2.setName(mainBtn2.getName());
        	 Button2.setClassify(mainBtn2.getClassify());
        	 if(mainBtn2.getClassify()==1){
 	    		Button2.setType(mainBtn2.getType());
 	    		if("click".equals(mainBtn2.getType())){
 	    			Button2.setKey(mainBtn2.getUrl());
 	    		}else{
 	    			Button2.setUrl(mainBtn2.getUrl());
 	    		}
 	    	}
        	DAO.save(Button2);
 	    	if(mainBtn2.getClassify()==2){
 	    		if(btn2!=null){
 	    			for(CommonButton c:btn2){
 	    				if("click".equals(c.getType())){
 	    					c.setKey(c.getUrl());
 	    					c.setUrl("");
 	    				}
 	    				System.err.println(c.getType());
 	    				c.setComplexButtonId(Button2.getId());
	    				DAO.save(c);
 	    			}
 	    			
 	    		}
 	    		Button2.setSub_button(btn2);
 	    	}
	    	 button.add(Button2);
	    	 
	      }
         if(mainBtn3!=null){
        	 Button3=new ComplexButton();
        	 Button3.setName(mainBtn3.getName()); 
        	 Button3.setClassify(mainBtn3.getClassify());
        	 if(mainBtn3.getClassify()==1){
  	    		Button3.setType(mainBtn3.getType());
  	    		if("click".equals(mainBtn3.getType())){
  	    			Button3.setKey(mainBtn3.getUrl());
  	    		}else{
  	    			Button3.setUrl(mainBtn3.getUrl());
  	    		}
  	    	}
        	DAO.save(Button3);
  	    	if(mainBtn3.getClassify()==2){
  	    		if(btn3!=null){
  	    			for(CommonButton c:btn3){
  	    				if("click".equals(c.getType())){
  	    					c.setKey(c.getUrl());
  	    					c.setUrl("");
  	    				}
  	    				c.setComplexButtonId(Button3.getId());
	    				DAO.save(c);
  	    			}
  	    			
  	    		}
  	    		Button3.setSub_button(btn3); 
  	    	}
	    	button.add(Button3);
	    	
         }
         
        
		peizhi=PeizhiDAO.findone(Peizhi.class);
		String appId = peizhi.getAppid();  
        // 第三方用户唯一凭证密钥   
		
        String appSecret = peizhi.getAppsecret();
        if(peizhi.getAppsecret()==null||peizhi.getAppid()==null){
        	msg = "null";
        	return find();
        }
        // 调用接口获取access_token   
        AccessToken at = WeixinUtil.getAccessToken(appId, appSecret);  
           Menu menu = new Menu();  
           menu.setButton(button); 
       
        if (null != at) {  
            // 调用接口创建菜单   
            int result = WeixinUtil.createMenu(menu, at.getToken());  
            // 判断菜单创建结果  
            
            if (0 == result) { 
                System.out.println("菜单创建成功！");
                
                  msg="success";
            
            }else { 
            	System.out.println("菜单创建失败，错误码：" + result); 
            	
            	msg="fail";
            	
            }
            
        }  
		return find();
	}
	
	
//	private static Menu getMenu() { 
//		
//        CommonButton btn11 = new CommonButton();  
//        btn11.setName("主页");  
//        btn11.setType("view");  
//        btn11.setUrl("https://www.taobao.com/");
//  
//        CommonButton btn12 = new CommonButton();  
//        btn12.setName("公交查询");
//        btn12.setType("click");
//        btn12.setKey("12");  
//  
//        CommonButton btn13 = new CommonButton();  
//        btn13.setName("周边搜索");  
//        btn13.setType("click");  
//        btn13.setKey("13");  
//  
//        CommonButton btn14 = new CommonButton();  
//        btn14.setName("历史上的今天");  
//        btn14.setType("click");  
//        btn14.setKey("14");  
//  
//        CommonButton btn21 = new CommonButton();  
//        btn21.setName("歌曲点播");  
//        btn21.setType("click");  
//        btn21.setKey("21");  
//  
//        CommonButton btn22 = new CommonButton();  
//        btn22.setName("经典游戏");  
//        btn22.setType("click");  
//        btn22.setKey("22");  
//  
//        CommonButton btn23 = new CommonButton();  
//        btn23.setName("美女电台");  
//        btn23.setType("click");  
//        btn23.setKey("23");  
//  
//        CommonButton btn24 = new CommonButton();  
//        btn24.setName("人脸识别");  
//        btn24.setType("click");  
//        btn24.setKey("24");  
//  
//        CommonButton btn25 = new CommonButton();  
//        btn25.setName("聊天唠嗑");  
//        btn25.setType("click");  
//        btn25.setKey("25");  
//  
//        CommonButton btn31 = new CommonButton();  
//        btn31.setName("Q友圈");  
//        btn31.setType("click");  
//        btn31.setKey("31");  
//  
//        CommonButton btn32 = new CommonButton();  
//        btn32.setName("电影排行榜");  
//        btn32.setType("click");  
//        btn32.setKey("32");  
//  
//        CommonButton btn33 = new CommonButton();  
//        btn33.setName("幽默笑话");  
//        btn33.setType("click");  
//        btn33.setKey("33");  
//  
//        
//        ComplexButton mainBtn1 = new ComplexButton();  
//        mainBtn1.setName("生活助手");
//        mainBtn1.setSub_button(new CommonButton[] { btn11, btn12, btn13, btn14 });  
//  
//        ComplexButton mainBtn2 = new ComplexButton();  
//        mainBtn2.setName("休闲驿站");  
//        mainBtn2.setSub_button(new CommonButton[] { btn21, btn22, btn23, btn24, btn25 });  
//  
//        ComplexButton mainBtn3 = new ComplexButton();  
//        mainBtn3.setName("更多体验");  
//        mainBtn3.setSub_button(new CommonButton[] { btn31, btn32, btn33 });  
//
//        Menu menu = new Menu();  
//        menu.setButton(new Button[] { mainBtn1, mainBtn2, mainBtn3 });  
//  
//        return menu;  
//    } 
	
	
	public ComplexButton getButton1() {
		return Button1;
	}

	public void setButton1(ComplexButton button1) {
		Button1 = button1;
	}

	public ComplexButton getButton2() {
		return Button2;
	}

	public void setButton2(ComplexButton button2) {
		Button2 = button2;
	}

	public ComplexButton getButton3() {
		return Button3;
	}

	public void setButton3(ComplexButton button3) {
		Button3 = button3;
	}

	public List<CommonButton> getBtn1() {
		return btn1;
	}

	public void setBtn1(List<CommonButton> btn1) {
		this.btn1 = btn1;
	}


	public List<CommonButton> getBtn2() {
		return btn2;
	}

	public void setBtn2(List<CommonButton> btn2) {
		this.btn2 = btn2;
	}

	public List<CommonButton> getBtn3() {
		return btn3;
	}

	public void setBtn3(List<CommonButton> btn3) {
		this.btn3 = btn3;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Peizhi getPeizhi() {
		return peizhi;
	}

	public void setPeizhi(Peizhi peizhi) {
		this.peizhi = peizhi;
	}

	public MainBtn getMainBtn1() {
		return mainBtn1;
	}

	public void setMainBtn1(MainBtn mainBtn1) {
		this.mainBtn1 = mainBtn1;
	}

	public MainBtn getMainBtn2() {
		return mainBtn2;
	}

	public void setMainBtn2(MainBtn mainBtn2) {
		this.mainBtn2 = mainBtn2;
	}

	public MainBtn getMainBtn3() {
		return mainBtn3;
	}

	public void setMainBtn3(MainBtn mainBtn3) {
		this.mainBtn3 = mainBtn3;
	}
	public List<ComplexButton> getOnes() {
		return ones;
	}
	public void setOnes(List<ComplexButton> ones) {
		this.ones = ones;
	}
	
}
