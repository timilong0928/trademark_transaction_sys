package action;

import java.io.File;

import pojo.Award;
import dao.DAO;

public class AwardAction extends BaseAction{

	private Award award; 
	private File file;
	private String fileFileName;
	
	//积分设置页面
	public String find(){
		award = DAO.findbyid(Award.class, 1);
		return "find";
	}

	//修改数据
	public String update(){
		try {
			DAO.update(award);
			
			msg = "修改成功";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "修改失败";
		}
		return find();
	}
	
	
	
	
	
	public Award getAward() {
		return award;
	}

	public void setAward(Award award) {
		this.award = award;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}



	
}
