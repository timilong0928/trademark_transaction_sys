package pojo;

import java.util.List;

public class Post {
	
	private Integer id;
	private String title;//标题
	
	private String img;	//主图
	private String writer;//作者
	private String head;//引言
	
	private String content;	//内容
	private String time=TimeUtil.getStringShort();	//时间
	
	private Integer readnum=0;//阅读量
	private Integer collectnum=0;//收藏量
	private Integer likenum=0;//点赞量
	private Integer tuijian =0;//是否推荐。0不推荐。1推荐
	
	private List<Comment> comments;//临时字段。保存这个资讯的评论内容
	
	
	
	
	
	public Integer getTuijian() {
		return tuijian;
	}
	public void setTuijian(Integer tuijian) {
		this.tuijian = tuijian;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	public Integer getLikenum() {
		return likenum;
	}
	public void setLikenum(Integer likenum) {
		this.likenum = likenum;
	}
	public Integer getReadnum() {
		return readnum;
	}
	public void setReadnum(Integer readnum) {
		this.readnum = readnum;
	}
	public Integer getCollectnum() {
		return collectnum;
	}
	public void setCollectnum(Integer collectnum) {
		this.collectnum = collectnum;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	@Override
	public String toString() {
		return "Post [collectnum=" + collectnum + ", comments=" + comments
				+ ", content=" + content + ", head=" + head + ", id=" + id
				+ ", img=" + img + ", likenum=" + likenum + ", readnum="
				+ readnum + ", time=" + time + ", title=" + title + ", writer="
				+ writer + "]";
	}
	

}
