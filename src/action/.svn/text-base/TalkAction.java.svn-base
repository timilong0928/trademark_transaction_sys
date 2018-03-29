package action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import dao.DAO;
import dao.TalPhotosDAO;
import dao.TalkDAO;
import pojo.Admin;
import pojo.BackTalk;
import pojo.TalPhoto;
import pojo.Talk;
import pojo.Team;
import util.ImageUploadUtil;
import util.ImgCompress;

public class TalkAction extends BaseAction{
	private Integer fid;
	private String content;
	private File file;
	private String fileFileName;
	private File[] files;
	private String[] filesFileName;
	private List<Talk> talks;
	private Talk talk;
	private BackTalk backTalk;
	private List<TalPhoto> talPhotos;
	
	//前端部分
	public String fabu() throws IOException{
		team=(Team) session.get("team");
		if(team==null){
			msg="login";
			return "json_msg";
		}
		Talk t=new Talk();
		t.setTeamId(team.getId());
		t.setForumId(fid);
		t.setContent(content);
		DAO.save(t);
		if (files != null) {
			String imageName = null;
			TalPhoto tp=null;
			for (int i = 0,len=files.length; i < len; i++) {
				imageName = ImgCompress.compress(files[i], filesFileName[i]);
				tp = new TalPhoto();
				tp.setImg(imageName);
				tp.setTid(t.getId());
				DAO.save(tp);
			}
		} 
		msg="success";
		return "json_msg";
	}
	
	public String myTalkForum(){
		team=(Team) session.get("team");
		if(team==null)
			return "login";
		
		List<Integer> idList=TalkDAO.findMyTalk(team.getId());
		return "mytalk";
	}
	
	//后台部分
	public String findAllTalk(){
		
		talks=TalkDAO.findByFidOrderByTime(fid);
		List<TalPhoto> talPhotos;
		Team temp=null;
		for(Talk t:talks){
			temp=DAO.findbyid(Team.class, t.getTeamId());
			t.setTeam(temp);
			talPhotos=TalPhotosDAO.findByTid(t.getId());
			t.setTalPhotos(talPhotos);
		}
		return "alltalk";
	}
	
	public String add(){
		admin=(Admin) session.get("admin");
		if(admin==null)
			return "adminlogin";
		backTalk.setAdminId(admin.getId());
		backTalk.setForumId(fid);
		DAO.save(backTalk);
		return findAllTalk();
	}
	public String deleteById(){
		DAO.deletebyid(Talk.class,talk.getId());
		msg="删除成功";
		return "json_msg";
	}
	public String toBack(){
		talk=DAO.findbyid(Talk.class,talk.getId());
		talPhotos=TalPhotosDAO.findByTid(talk.getId());
		return "back";
	}
	
	public String myBackForum(){
		admin=(Admin) session.get("admin");
		if(admin==null)
			return "adminlogin";
		List<Integer> idList=TalkDAO.findMyBack(admin.getId());
		return "myback";
	}
	
	public BackTalk getBackTalk() {
		return backTalk;
	}

	public void setBackTalk(BackTalk backTalk) {
		this.backTalk = backTalk;
	}

	public Integer getFid() {
		return fid;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public File[] getFiles() {
		return files;
	}

	public void setFiles(File[] files) {
		this.files = files;
	}

	public String[] getFilesFileName() {
		return filesFileName;
	}

	public void setFilesFileName(String[] filesFileName) {
		this.filesFileName = filesFileName;
	}
	public List<Talk> getTalks() {
		return talks;
	}
	public void setTalks(List<Talk> talks) {
		this.talks = talks;
	}

	public Talk getTalk() {
		return talk;
	}

	public void setTalk(Talk talk) {
		this.talk = talk;
	}

	public List<TalPhoto> getTalPhotos() {
		return talPhotos;
	}

	public void setTalPhotos(List<TalPhoto> talPhotos) {
		this.talPhotos = talPhotos;
	}

	
}
