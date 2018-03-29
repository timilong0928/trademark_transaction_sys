package action;

import java.io.File;
import java.util.List;

import pojo.Content;
import pojo.Course;
import pojo.Teacher;
import util.ImageUploadUtil;
import dao.CourseDao;
import dao.DAO;

public class TeacherAction extends BaseAction{

	private List<Teacher> teachers;
	private Teacher teacher;
	private File file;
	private String fileFileName;
	private Integer seq=0;
	
	private List<Course> courses;

	//================================================前台部分===============================================
	//查询所有讲师
	public String tuijian(){
		teachers=DAO.findall(Teacher.class,null,"seq");
		return "kctuijian";
	}
	//查看这个讲师
	public String totheteather(){
		teacher = DAO.findbyid(Teacher.class,teacher.getId());
		courses = DAO.findbyinteger(Course.class,"teacherId", teacher.getId());
		return "kcteacher";
	}
	
	
	
	
	
	
	
	








	//================================================后台部分===============================================
	//查询所有讲师
	public String findAllTeacher(){
		size=10;
		allpage = (DAO.findnum(Teacher.class)+size-1)/size;
		checkpage();
		teachers=DAO.findbypage(Teacher.class, allpage, size,null,"seq");

		return "findAllTeacher";
	}
	//查看这个讲师
	public String theteacher(){
		if(teacher==null){
			return findAllTeacher();
		}
		teacher = DAO.findbyid(Teacher.class,teacher.getId());

		return "theteacher";
	}

	//添加讲师
	public String add(){
		if(teacher==null){
			return findAllTeacher();
		}
		if(teacher.getName()==null){
			msg = "请输入讲师名";
			return findAllTeacher();
		}
		if(file!=null){
			teacher.setImg(ImageUploadUtil.upload(file, fileFileName));
		}
		//排序所有讲师，并且将这个讲师放在最后一位
		teacher.setSeq(order());
		DAO.save(teacher);

		return findAllTeacher();
	}
	//跳转到修改页面
	public String toupdate(){
		if(teacher==null){
			return findAllTeacher();
		}
		teacher =DAO.findbyid(Teacher.class,teacher.getId());

		return "update";
	}
	//修改
	public String update(){

		try {
			if(teacher==null){
				return findAllTeacher();
			}
			Teacher teacher2 =DAO.findbyid(Teacher.class,teacher.getId());
			teacher2.setName(teacher.getName());
			teacher2.setIntro(teacher.getIntro());
			teacher2.setDetail(teacher.getDetail());
			if(file!=null){
				teacher2.setImg(ImageUploadUtil.upload(file, fileFileName));
			}
			DAO.update(teacher2);
			List<Course> list = CourseDao.findCoursesByTeacherId(teacher.getId());
			for(Course c:list){
				c.setTeacher(teacher.getName());
				DAO.update(c);
			}
			msg="修改成功";
		} catch (Exception e) {
			msg="修改失败";
		}

		return findAllTeacher();
	}


	//删除讲师
	public String deletebyid() {

		if(ids!=null&&ids.length>0){
			for (int i = 0,len=ids.length; i < len; i++) {
				try{
					TeacherAction.deleteCourseAndContentById(ids[i]);
					DAO.deletebyid(Teacher.class, ids[i]);
				}catch(Exception e){
					e.printStackTrace();
					msg = "删除失败";
				}
			}
			order();
			msg ="删除成功";
		}else
			msg="未选中,删除失败";
		return findAllTeacher();
	}

	//删除讲师所对应的课程和课时
	public static boolean deleteCourseAndContentById(Integer teacherId) throws RuntimeException{
		List<Course> list = CourseDao.findCoursesByTeacherId(teacherId);
		for(Course c:list){
			List<Content> contents = CourseDao.findContentsByCouresId(c.getId());
			for(Content con:contents){
				DAO.delete(con);
			}
			DAO.delete(c);
		}
		return true;
	}


	//修改排序
	public String seq(){
		teachers=DAO.findbyinteger(Teacher.class,"seq",seq);
		teacher=DAO.findbyid(Teacher.class,teacher.getId());
		//输入的排序有误或找不到这个排序的。
		if(teachers.size()==0){
			teacher.setSeq(99999);
			DAO.update(teacher);
			order();
			return findAllTeacher();
		}
		//说明找到了。那么调换2个的序号
		Teacher teacher2=teachers.get(0);
		teacher2.setSeq(teacher.getSeq());
		teacher.setSeq(seq);
		DAO.update(teacher);
		DAO.update(teacher2);
		return findAllTeacher();
	}


	//重新排序
	public Integer order(){
		teachers=DAO.findall(Teacher.class,null,"seq");
		Integer a = 1;
		for(Teacher teacher: teachers){
			teacher.setSeq(a);
			a++;
			DAO.update(teacher);
		}
		return a;
	}




	public List<Teacher> getTeachers() {
		return teachers;
	}

	public void setTeachers(List<Teacher> teachers) {
		this.teachers = teachers;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
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
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public List<Course> getCourses() {
		return courses;
	}
	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}






}
