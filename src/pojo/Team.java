package pojo;

public class Team{
	
	private Integer id;//id
	private String openId;//微信，QQ唯一标识
	private String img="";//头像
	private String nickName;//昵称
	private String phone;//手机号码
	private String erweimapath="";
	
	private String appid;
	
	private Integer yijiId=0;//上一级分销商的teamid。
	private String yijiname;//上一级的名字
	
	private Double yongjin=0.0;//可用佣金
	private Double allyongjin=0.0;//总的佣金
	//是否可以反佣
	private Integer isfanyong=0;//0可以反佣，1不能反佣
	
	
	private String regTime=TimeUtil.getStringShort();//注册时间
	
	private String tuijian;//推荐
	private Integer istj=1;//是否有推荐0有;1无
	
	//临时字段
	private Team shangji1;
	private Team shangji2;
	private Integer companyId=0;//上级ID。 为0则代表无上级
	private String companyName;//上级呢称
	private Integer memberdj=0;//会员等级。0代表非会员。1代表年费会员 		 //分销情况待定
	
	//分享专用
	private Long hctime;
	private String ticket;
	
	//暂时不用
	private String rname;//真实姓名
	private Integer sex;//性别 1男 2女
	private String birthDay;//生日
	private String province;//所在省
	private String city;//所在城市地区
	private String area;//区
	private String address;//收货地址
	private String email;//邮箱
	private Integer  isJudge=0;//是否需要审核，0不需要1需要;
	private String reason;//拒绝理由;?。。。用来保存注册时用户填写的单位名称
	private Integer isForbid=0;//禁用 0正常,1禁用
	public String getErweimapath() {
		return erweimapath;
	}
	public void setErweimapath(String erweimapath) {
		this.erweimapath = erweimapath;
	}
	private String pwd;//密码

	private String userName;//账号
	public String getAppid() {
		return appid;
	}
	public Integer getIsfanyong() {
		return isfanyong;
	}
	public void setIsfanyong(Integer isfanyong) {
		this.isfanyong = isfanyong;
	}
	public void setAppid(String appid) {
		this.appid = appid;
	}
	private Integer goumai;//临时字段，是否购买了这个课程
	private Integer isReject=0;//邀请分享码
	private Integer num=0;//分享次数
	
	
	private String endTime=TimeUtil.getString();;//下次评论时间
	
	

	public String getTicket() {
		return ticket;
	}
	public void setTicket(String ticket) {
		this.ticket = ticket;
	}
	public Long getHctime() {
		return hctime;
	}
	public void setHctime(Long hctime) {
		this.hctime = hctime;
	}
	public void setYongjin(Double yongjin) {
		this.yongjin = yongjin;
	}
	public void setAllyongjin(Double allyongjin) {
		this.allyongjin = allyongjin;
	}
	public double getYongjin() {
		return yongjin;
	}
	public void setYongjin(double yongjin) {
		this.yongjin = yongjin;
	}
	public double getAllyongjin() {
		return allyongjin;
	}
	public Integer getIstj() {
		return istj;
	}
	public void setIstj(Integer istj) {
		this.istj = istj;
	}
	public void setAllyongjin(double allyongjin) {
		this.allyongjin = allyongjin;
	}
	public String getYijiname() {
		return yijiname;
	}
	public void setYijiname(String yijiname) {
		this.yijiname = yijiname;
	}
	
	public Integer getGoumai() {
		return goumai;
	}
	public void setGoumai(Integer goumai) {
		this.goumai = goumai;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public Integer getMemberdj() {
		return memberdj;
	}
	public void setMemberdj(Integer memberdj) {
		this.memberdj = memberdj;
	}
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOpenId() {
		return openId;
	}
	public void setOpenId(String openId) {
		this.openId = openId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getTuijian() {
		return tuijian;
	}
	public void setTuijian(String tuijian) {
		this.tuijian = tuijian;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public String getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
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
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getRegTime() {
		return regTime;
	}
	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getIsJudge() {
		return isJudge;
	}
	public void setIsJudge(Integer isJudge) {
		this.isJudge = isJudge;
	}
	public Integer getIsReject() {
		return isReject;
	}
	public void setIsReject(Integer isReject) {
		this.isReject = isReject;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Integer getIsForbid() {
		return isForbid;
	}
	public void setIsForbid(Integer isForbid) {
		this.isForbid = isForbid;
	}
	
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	
	public Integer getYijiId() {
		return yijiId;
	}
	public void setYijiId(Integer yijiId) {
		this.yijiId = yijiId;
	}
	

	public Team getShangji1() {
		return shangji1;
	}
	public void setShangji1(Team shangji1) {
		this.shangji1 = shangji1;
	}
	public Team getShangji2() {
		return shangji2;
	}
	public void setShangji2(Team shangji2) {
		this.shangji2 = shangji2;
	}
	@Override
	public String toString() {
		return "Team [address=" + address + ", allyongjin=" + allyongjin
				+ ", area=" + area + ", birthDay=" + birthDay + ", city="
				+ city + ", companyId=" + companyId + ", companyName="
				+ companyName + ", email=" + email + ", endTime=" + endTime
				+ ", goumai=" + goumai + ", hctime=" + hctime + ", id=" + id
				+ ", img=" + img + ", isForbid=" + isForbid + ", isJudge="
				+ isJudge + ", isReject=" + isReject + ", memberdj=" + memberdj
				+ ", nickName=" + nickName + ", num=" + num + ", openId="
				+ openId + ", phone=" + phone + ", province=" + province
				+ ", pwd=" + pwd + ", reason=" + reason + ", regTime="
				+ regTime + ", rname=" + rname + ", sex=" + sex + ", shangji1="
				+ shangji1 + ", shangji2=" + shangji2 + ", ticket=" + ticket
				+ ", userName=" + userName + ", yijiId=" + yijiId
				+ ", yijiname=" + yijiname + ", yongjin=" + yongjin + "]";
	}
	




}
