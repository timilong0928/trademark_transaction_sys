package action;

import dao.DAO;
import pojo.Peizhi;

/**
 * 配置
 * @author Administrator
 * 
 */
public class PeizhiAction {

	private Peizhi peizhi;
	private String msg;
	
	public String findall(){
		if(DAO.findall(Peizhi.class)==null||DAO.findall(Peizhi.class).size()<=0){
			peizhi=new Peizhi();
			DAO.save(peizhi);
		}else
			peizhi=DAO.findall(Peizhi.class).get(0);
			
		return "peizhi";
	}

	public String update() {

		try {
			DAO.update(peizhi);
			msg = "更新成功";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return findall();
	}

	public String find() {
		try {
			peizhi=DAO.findone(Peizhi.class);
			if(peizhi==null){
				peizhi=new Peizhi();
				DAO.save(peizhi);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	public Peizhi getPeizhi() {
		return peizhi;
	}

	public void setPeizhi(Peizhi peizhi) {
		this.peizhi = peizhi;
	}


	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	

}
