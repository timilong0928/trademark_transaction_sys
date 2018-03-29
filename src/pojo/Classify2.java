package pojo;

public class Classify2 {
	private Integer id;
	private String name;//分类名
	private Integer orderid=0;//排序
	private String img="1";//图片
	
	private String img2="1";//选中图片
	
	private Integer type;//0产品分类，1兑换商城分类
	
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public Integer getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public Integer getOrderid() {
		return orderid;
	}
	public String getImg() {
		return img;
	}
	public Integer getType() {
		return type;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	
	
}
