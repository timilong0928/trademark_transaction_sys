package pojo;

/**
 *  商标分类
 */
public class Sbfenlei {
	
	private Integer id;//id(主键)
	private String name;//分类名
	private Integer num=0;//这个分类下的商标数量
	private String img;//分类图标
	private Integer fenleiid;
	
	
	
	
	
	
	
	public Integer getFenleiid() {
		return fenleiid;
	}
	public void setFenleiid(Integer fenleiid) {
		this.fenleiid = fenleiid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	
}
    