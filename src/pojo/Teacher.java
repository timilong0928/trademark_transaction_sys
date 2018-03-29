package pojo;
	
public class Teacher {
	
	private Integer id;//id(主键)
	private String name;//名字
	private String img;//照片
	private String intro;//详情（？）
	private String detail;//老师介绍
	private Integer seq;//序号
	
	
	
	
	
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
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	
	@Override
	public String toString() {
		return "Teacher [detail=" + detail + ", id=" + id + ", img=" + img
				+ ", intro=" + intro + ", name=" + name + ", seq=" + seq + "]";
	}
	
	
	
	
	
	
	
}
