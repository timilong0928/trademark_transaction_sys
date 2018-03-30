package pojo;

import java.util.List;

/**
 *  商标
 */
public class Sb {
	private Integer id;//id(主键)
	
	private Double price=0.0;//价格
	/* Edit by Timilong(13896901804@qq.com) 2018年3月30日*/
	/* 需求一: 在商标页新添内部价格cost_price、sb_owner字段表示成本价格、商标持有人*/
	private Double cost_price=0.0;  //内部价格
	private String sb_owner="admin";  //商标持有人
	/* Edit by Timilong(13896901804@qq.com) 2018年3月30日*/
	private String title;//标题
	private String img;//图标
	private Integer fenleiid;//分类id
	private String biaohao;//商标编号
	
	private String time;//专用期限
	private String leixing;//商标类型
	private String jieshao;//服务项目
	private String qunzu;//商标群组
	
	private Integer state=0;//0-正在销售；；1--已销售
	
	
	//不用
	private Double xiaoxiang=0.0;//小项价格
	
	
	//临时字段
	private String fenleiname;
	
	public String getFenleiname() {
		return fenleiname;
	}
	public void setFenleiname(String fenleiname) {
		this.fenleiname = fenleiname;
	}
	public Integer getFenleiid() {
		return fenleiid;
	}
	public void setFenleiid(Integer fenleiid) {
		this.fenleiid = fenleiid;
	}
	public Integer getId() {
		return id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	
	public String getQunzu() {
		return qunzu;
	}
	public void setQunzu(String qunzu) {
		this.qunzu = qunzu;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	
	/* Edit by Timilong(13896901804@qq.com) 2018年3月30日 */
	/* 需求一: 在商标页新添内部价格cost_price、sb_owner字段表示成本价格、商标持有人 */
	public Double getCostPrice() {
		return cost_price;
	}
	public void setCostPrice(Double cost_price) {
		this.cost_price = cost_price;
	}
	
	public String getSbOwner() {
		return sb_owner;
	}
	public void setSbOwner(String sb_owner) {
		this.sb_owner = sb_owner;
	}
	/* Edit by Timilong(13896901804@qq.com) 2018年3月30日 */
	
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTime() {
		return time;
	}
	public Double getXiaoxiang() {
		return xiaoxiang;
	}
	public void setXiaoxiang(Double xiaoxiang) {
		this.xiaoxiang = xiaoxiang;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getLeixing() {
		return leixing;
	}
	public void setLeixing(String leixing) {
		this.leixing = leixing;
	}
	public String getJieshao() {
		return jieshao;
	}
	public void setJieshao(String jieshao) {
		this.jieshao = jieshao;
	}
	public String getBiaohao() {
		return biaohao;
	}
	public void setBiaohao(String biaohao) {
		this.biaohao = biaohao;
	}
	@Override
	public String toString() {
		return "Sb [biaohao=" + biaohao + ", fenleiid=" + fenleiid
				+ ", fenleiname=" + fenleiname + ", id=" + id + ", img=" + img
				+ ", jieshao=" + jieshao + ", leixing=" + leixing + ", price="
				+ price + ", qunzu=" + qunzu + ", state=" + state + ", time="
				+ time + ", title=" + title + ", xiaoxiang=" + xiaoxiang + "]";
	}
}
    