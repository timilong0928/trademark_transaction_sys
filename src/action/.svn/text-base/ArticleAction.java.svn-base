package action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import pojo.Article;
import pojo.Award;
import pojo.JsonResult;
import pojo.Team;
import util.ImageUploadUtil;
import dao.DAO;

public class ArticleAction extends BaseAction{
	
	private Article article;
	private List<Article> articles;
	private File file;
	private String fileFileName;
	private String keyword;//收索内容
	
	private JsonResult jsonresult;
	private Integer articleid;
	
	
	/**
	 * 前台
	 * **/
	public String findall(){
		
		jsonresult=new JsonResult();
		
		articles=DAO.findbyinteger(Article.class, "state", 0);
		if (articles!=null) {
			jsonresult.setObjs(articles);
			
			return "jsonresult";
			
		}
		return null;
		
		
	}
	//行业新闻
	public String chakanxq(){
		//System.out.println("id=="+articleid);
		jsonresult=new JsonResult();
		
		article=DAO.findbyid(Article.class, articleid);
		if (article!=null) {
			jsonresult.setObject(article);
			
			return "jsonresult";
			
		}
		return null;
		
	}
	//红包规则
	public String chakanguize(){
		//System.out.println("id=="+articleid);
		jsonresult=new JsonResult();
		
		article=DAO.findbyintegerone(Article.class, "state", 3);
		if (article!=null) {
			jsonresult.setObject(article);
			
			return "jsonresult";
			
		}
		return null;
		
	}
	
	
	/**
	 * 后台
	 * **/
	
	//搜索文章
	public String searchtitle(){
		
		
		articles=DAO.searchtitle("title",keyword);
		return "find";
	}
	//找行业文章
	public String find(){
		
		
		articles=DAO.findbyinteger(Article.class, "state", 0);
		return "find";
	}
	//添加行业文章
	public String add(){
		
		String imgname=ImageUploadUtil.upload1(file, fileFileName);
		article.setImg(imgname);
		Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String nowtime = dateFormat.format(now); 
        article.setTime(nowtime);
        article.setState(0);
        DAO.save(article);
		
		return find();
	}
	//找红包规则文章
	public String find1(){
		
		
		article=DAO.findbyintegerone(Article.class, "state", 3);
		return "findguize";
	}
	//添加红包规则
	public String addl(){
		System.out.println("jinglai guize");
		Article article2;
		article2=DAO.findbyintegerone(Article.class, "state", 3);
		try {
			
		
		if (article2==null) {
			Article article1=new Article();
			Date now = new Date();
			System.out.println("jinglai guize1");
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	        String nowtime = dateFormat.format(now); 
	        article1.setTime(nowtime);
	        article1.setState(3);
	        article1.setContent(article.getContent());
	        article1.setTitle(article.getTitle());
	        DAO.save(article1);
			
		}else {
			Date now = new Date(); 
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	        String nowtime = dateFormat.format(now); 
	        article2.setTime(nowtime);
	        article2.setContent(article.getContent());
	        article2.setTitle(article.getTitle());
	        DAO.update(article2);
			
		}
		msg="更新成功";
		
		} catch (Exception e) {
			e.printStackTrace();
			msg="更新失败";
		}
		
		
		return find1();
	}
	//查看文章
	public String look(){
		
		article=DAO.findbyid(Article.class, article.getId());
		return "look";
	}
	//修改文章
	public String xiugai(){
		
		article=DAO.findbyid(Article.class, article.getId());
		return "xiugai";
	}
	//更新文章
	public String gengxin(){
		
		Article article1=new Article();
		article1=DAO.findbyid(Article.class, article.getId());
		try {
			if (file!=null) {
				String imgname=ImageUploadUtil.upload1(file, fileFileName);
				article1.setImg(imgname);
				
			}
			article1.setTitle(article.getTitle());
			article1.setContent(article.getContent());
			DAO.update(article1);
			msg="更新成功";
			
		} catch (Exception e) {
			msg="更新失败";
		}
		
		
		return find();
	}
	//进入权利密码
	public String chakantj(){
		Integer a;
        a= (Integer) session.get("teamididid");
       
        team=DAO.findbyid(Team.class, a);
		System.out.println(a);
		if(team==null){
			try {
				
				response.sendRedirect(wx_index_url);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
		}
		
		jsonresult = new JsonResult();
		
		return "jsonresult";
	}
	
	//删除文章
	public String delete(){
		
		article=DAO.findbyid(Article.class, article.getId());
		DAO.delete(article);
		
		return find();
	}
	
	
	
	
	
	public Award getAward() {
		return award;
	}

	public Article getArticle() {
		return article;
	}





	public void setArticle(Article article) {
		this.article = article;
	}





	public List<Article> getArticles() {
		return articles;
	}





	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}





	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public Integer getArticleid() {
		return articleid;
	}

	public void setArticleid(Integer articleid) {
		this.articleid = articleid;
	}

	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public JsonResult getJsonresult() {
		return jsonresult;
	}


	public void setJsonresult(JsonResult jsonresult) {
		this.jsonresult = jsonresult;
	}


	public void setAward(Award award) {
		this.award = award;
	}

	



	
}
