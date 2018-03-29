package pojo;

public class Address {
	/**
	 * 用户地址管理实体
	 * 
	 */
	private Integer id;
	private Integer userId;//用户ID
	private Integer isMoren=1;//是否是默认地址0普通 1默认
	private String name;//收货人
	private String tel;//电话号码
	private String province;//省份
	private String city;//城市
	private String qu;//区
	private String address;//详细地址
	
	
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
	public String getQu() {
		return qu;
	}
	public void setQu(String qu) {
		this.qu = qu;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Integer getIsMoren() {
		return isMoren;
	}
	public void setIsMoren(Integer isMoren) {
		this.isMoren = isMoren;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	
	
	
}
