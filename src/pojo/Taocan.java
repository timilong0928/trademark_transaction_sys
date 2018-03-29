package pojo;

import java.util.List;

public class Taocan {
	private Integer id;
	private String  name;//套餐名
	private String img;//图片
	private Double money=0.0;//套餐价格
	private Double twomoney=0.0;//原价
	private String courseids;//套餐里面包含的课程IDs//按,区分
	
	private Integer payNum=0;//购买人数(报名)
	private String time=TimeUtil.getStringShort();//上传时间
	private String introduce;//套餐介绍
	
	
	//临时字段
	private List<Course> taocancourses;
	
	
	
	public List<Course> getTaocancourses() {
		return taocancourses;
	}
	public void setTaocancourses(List<Course> taocancourses) {
		this.taocancourses = taocancourses;
	}
	public Integer getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getImg() {
		return img;
	}
	public Double getMoney() {
		return money;
	}
	public Double getTwomoney() {
		return twomoney;
	}
	public Integer getPayNum() {
		return payNum;
	}
	public String getTime() {
		return time;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public void setTwomoney(Double twomoney) {
		this.twomoney = twomoney;
	}
	public void setPayNum(Integer payNum) {
		this.payNum = payNum;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getCourseids() {
		return courseids;
	}
	public void setCourseids(String courseids) {
		this.courseids = courseids;
	}
	
	
	
	
	
}
