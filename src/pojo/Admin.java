package pojo;
public class Admin {
	
	private Integer id;
	private String name;//用户名
	private String password;//密码
	private Integer num=0;
	private String quanxian;//用户权限supermen和teacher
	
	private String rname;//真实姓名
	
	private String phone;//客服热线
	private String phone1;//投诉电话
	
	private String qianming;
	
	private String appid;//appid
	
	private String img;//头像
	private String zhengimg;//身份证 正面
	private String fanimg;//身份证 反面
	private String allimg;//全身照片
	private String nickName;//昵称
	private String province;//所在省
	private String city;//所在城市地区
	private String area;//区
	private String address;//收货地址
	private String thistime;
	private String lasttime;
	
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getThistime() {
		return thistime;
	}
	public void setThistime(String thistime) {
		this.thistime = thistime;
	}
	public String getLasttime() {
		return lasttime;
	}
	public void setLasttime(String lasttime) {
		this.lasttime = lasttime;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getAppid() {
		return appid;
	}
	public void setAppid(String appid) {
		this.appid = appid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getQianming() {
		return qianming;
	}
	public void setQianming(String qianming) {
		this.qianming = qianming;
	}
	public String getQuanxian() {
		return quanxian;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public void setQuanxian(String quanxian) {
		this.quanxian = quanxian;
	}
	public String getZhengimg() {
		return zhengimg;
	}
	public void setZhengimg(String zhengimg) {
		this.zhengimg = zhengimg;
	}
	public String getFanimg() {
		return fanimg;
	}
	public void setFanimg(String fanimg) {
		this.fanimg = fanimg;
	}
	public String getAllimg() {
		return allimg;
	}
	public void setAllimg(String allimg) {
		this.allimg = allimg;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
