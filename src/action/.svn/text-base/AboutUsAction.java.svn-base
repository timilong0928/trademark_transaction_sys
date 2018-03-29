package action;
import java.io.IOException;
import java.util.List;
import pojo.AboutUs;
import dao.DAO;

public class AboutUsAction extends BaseAction{
	private AboutUs aboutus;
	private List<AboutUs> aboutuss;
	
	public String findForIndex(){
		
		aboutuss=DAO.findall(AboutUs.class);
		if(aboutuss!=null&&aboutuss.size()>0){
			aboutus=aboutuss.get(0);
		}else{
			aboutus=new AboutUs();
			DAO.save(aboutus);
		}
		return "aboutus";
	}
	
	public String findAll(){
		aboutuss=DAO.findall(AboutUs.class);
		if(aboutuss!=null&&aboutuss.size()>0){
			aboutus=aboutuss.get(0);
		}else{
			aboutus=new AboutUs();
			DAO.save(aboutus);
		}
		return "toUpdate";
	}
	
	public String add() throws IOException {
		try {
			DAO.save(aboutus);
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
				DAO.deletebyid(AboutUs.class, ids[i]);
			}
			msg = "删除成功";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "删除失败";
		}
		return findAll();
	}
	
	
	
	public String toUpdate(){
		
		aboutus=DAO.findbyid(AboutUs.class, aboutus.getId());
		return "toUpdate";
		
	}
	
	public String updateById() {
		AboutUs a2 =DAO.findbyid(AboutUs.class, aboutus.getId());
		a2.setContent(aboutus.getContent());
		try {
			DAO.update(a2);
			msg = "更新成功";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "更新失败";
		}
		return findAll();
	}

	public AboutUs getAboutus() {
		return aboutus;
	}

	public void setAboutus(AboutUs aboutus) {
		this.aboutus = aboutus;
	}

	public List<AboutUs> getAboutuss() {
		return aboutuss;
	}

	public void setAboutuss(List<AboutUs> aboutuss) {
		this.aboutuss = aboutuss;
	}
	
	
}