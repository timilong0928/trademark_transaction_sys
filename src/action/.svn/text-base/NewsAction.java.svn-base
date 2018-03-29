package action;
import java.io.IOException;
import java.util.List;
import pojo.News;
import dao.DAO;
import dao.NewsDAO;

public class NewsAction extends BaseAction{
	private News news;
	private List<News> newss;
	private List<News> datas;
	//前端部分
	
	public String findAllForIndex(){
		if(page==null)
			page=1;
		size=10;
		newss=NewsDAO.findByPageOderByTime(page,size);
		return "allIndex";
	} 
	public String findForIndexMore(){
		if(page==null)
			page=1;
		size=10;
		datas=NewsDAO.findByPageOderByTime(page,size);
		return "json_datas";
	}
	
	public String findForDetail(){
		news=DAO.findbyid(News.class,news.getId());
		return "detailIndex";
	}
	
	//后台部分
	public String findAll(){
		size=10;
		allpage = (DAO.findnum(News.class)+size-1)/size;
		checkpage();
		newss=DAO.findbypageorderbyid(News.class,page,size);
		return "all";
	}
	
	public String add() throws IOException {
		try {
			DAO.save(news);
			msg = "添加成功";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "添加失败";
		}
		return findAll();
	}
	
	public String deletebyid() {
		try {
			for (int i = 0,len=ids.length; i < len; i++) {
				DAO.deletebyid(News.class, ids[i]);
			}
			msg = "删除成功";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "删除失败";
		}
		return findAll();
	}
	
	
	
	public String toUpdate(){
		
		news=DAO.findbyid(News.class, news.getId());
		return "toUpdate";
		
	}
	
	public String updateById() {
		News n2 =DAO.findbyid(News.class, news.getId());
		n2.setContent(news.getContent());
		n2.setTitle(news.getTitle());
		try {
			DAO.update(n2);
			msg = "更新成功";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "更新失败";
		}
		return findAll();
	}


	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

	public List<News> getNewss() {
		return newss;
	}

	public void setNewss(List<News> newss) {
		this.newss = newss;
	}
	public List<News> getDatas() {
		return datas;
	}
	public void setDatas(List<News> datas) {
		this.datas = datas;
	}
	
}