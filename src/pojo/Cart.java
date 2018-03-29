package pojo;

import java.io.Serializable;

public class Cart implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 购物车实体
	 * 
	 */
	private Integer id ;//购物车ID
	private Integer teamId;//所属用户
	private Integer pid;//商品ID
	
	private Integer num=1;//数量+
	private Integer price;//商品单价
	private Integer point;//商品积分
	private Integer allprice;//商品总价+
	private Integer allpoint;//商品总积分+
	private String img;//商品图片
	private String title;//商品名
	private Integer yunfei;//该商品是否需要运费 ，0不要。1要
	
	private Integer xuanze=1;//是否被选中，0未选中，1选中
	
	
	public Integer getXuanze() {
		return xuanze;
	}
	public void setXuanze(Integer xuanze) {
		this.xuanze = xuanze;
	}
	public Integer getYunfei() {
		return yunfei;
	}
	public void setYunfei(Integer yunfei) {
		this.yunfei = yunfei;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	public Integer getPoint() {
		return point;
	}


	public Integer getAllpoint() {
		return allpoint;
	}


	public void setPrice(Integer price) {
		this.price = price;
	}


	public void setPoint(Integer point) {
		this.point = point;
	}


	public void setAllprice(Integer allprice) {
		this.allprice = allprice;
	}


	public void setAllpoint(Integer allpoint) {
		this.allpoint = allpoint;
	}

	public Integer getTeamId() {
		return teamId;
	}
	public void setTeamId(Integer teamId) {
		this.teamId = teamId;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public Integer getPrice() {
		return price;
	}


	public Integer getAllprice() {
		return allprice;
	}


	
}
