package pojo;

/**
 * 	课时 
 */
public class Content {

	private Integer id;//主键
	private Integer courseId;//课程id
	private Integer isTest=0;//是否试看，0付费，1试看
	private String title="无"; //标题
	private String content1;//课程内容
	private Integer seq=10;//顺序
	
	
	
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCourseId() {
		return courseId;
	}
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent1() {
		return content1;
	}
	public void setContent1(String content) {
		this.content1 = content;
	}
	
	public Integer getIsTest() {
		return isTest;
	}
	public void setIsTest(Integer isTest) {
		this.isTest = isTest;
	}
	@Override
	public String toString() {
		return "Content [content1=" + content1 + ", courseId=" + courseId
				+ ", id=" + id + ", isTest=" + isTest + ", seq=" + seq
				+ ", title=" + title + "]";
	}
	
}
