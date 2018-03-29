package action;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFHeader;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import pojo.Admin;
import pojo.Course;
import pojo.JsonResult;
import pojo.TimeUtil;
import pojo.Tongji;
import util.ImageUploadUtil;
import dao.AdminDAO;
import dao.CourseDao;
import dao.DAO;

public class AdminAction extends BaseAction{

	private Admin admin;
	private List<Admin> admins;
	private File file;
	private File file1;
	private File file2;
	private File file3;
	private String fileFileName;
	private String file1FileName;
	private String file2FileName;
	private String file3FileName;
	private String fileContentType;
	private String name;
	private String pwd;
	private List<Tongji> tongjis;
	private String time1;
	private String time2;
	private JsonResult jsonresult;
	
	public String ckphone(){
		System.out.println("jing===");
		jsonresult=new JsonResult();
		admin=DAO.findbyid(Admin.class, 1);
		jsonresult.setObject(admin);
		System.out.println(admin);
		return "jsonresult";
		
	}
	
	public String checkAdminName(){
		Admin admin=AdminDAO.findbyname(name);
		if(admin==null)
			msg="success";
		else
			msg="该昵称已被使用";
		if("".equals(name))
			msg="请输入用户名";
		return "json_msg";
	}
	
	public String findAll(){
		allpage=1;
		admins=DAO.findbystring(Admin.class,"quanxian","teacher");
		return "all";
	}
	
	public String toAdmin(){
		admin=DAO.findbyid(Admin.class, admin.getId());
		return "toAdmin";
	}
	
	public String toUpdate(){
		admin=DAO.findbyid(Admin.class, admin.getId());
		return "toUpdate";
	}
	
	public String deletebyid() {
		try {
			for (int i = 0,len=ids.length; i < len; i++) {
				DAO.deletebyid(Admin.class, ids[i]);
			}
			msg = "删除成功";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "删除失败";
		}
		return findAll();
	}

	public String loginGuaPi()  throws Exception{
		String r=null;
		Admin admin1=AdminDAO.findbyname(admin.getName());
		if(admin1==null){
			msg="fail";
			r="fail";
		}else if(admin1.getPassword().equals(admin.getPassword())){
			int num=admin1.getNum()+1;
			admin1.setNum(num);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			admin1.setLasttime(admin1.getThistime());
			admin1.setThistime(df.format(new Date()));
			AdminDAO.update(admin1);
			Date d=new Date();   
			SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
			session.put("admin", admin1);
			
		
			
			r="success";
		}else{
			msg="fail";
			r="fail";	
		}
		return r;
	}
	
	
	/**
	 * 导出课程订单到Excel
	 */
	public String exportTongji() throws Exception {
		if("".equals(time1)){
			time1 = "2010-01-01";
		}
		if("".equals(time2)){
			time2 = TimeUtil.getStringShort();
		}
			tongjis = AdminDAO.findbytime2(time1, time2);
		
		
		String[] tableHeader = { "财务统计时间", "新增会员人数", "会员收入金额", "课程数量", "课程收入", "积分商城售出订单数", "积分商城收入金额","积分商城收入积分","总收入金额"};
		short cellNumber = (short) tableHeader.length;// 表的列数
		HSSFWorkbook workbook = new HSSFWorkbook(); // 创建一个excel
		HSSFCell cell = null; // Excel的列
		HSSFRow row = null; // Excel的行
		HSSFCellStyle style = workbook.createCellStyle(); // 设置表头的类型
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		HSSFCellStyle style1 = workbook.createCellStyle(); // 设置数据类型
		style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		HSSFFont font = workbook.createFont(); // 设置字体
		HSSFSheet sheet = workbook.createSheet("sheet1"); // 创建一个sheet
		HSSFHeader header = sheet.getHeader();// 设置sheet的头
		try {
			if (tongjis.size() < 1) {
				header.setCenter("无财务统计信息");
			} else {
				header.setCenter("财务统计列表");
				row = sheet.createRow(0);
				row.setHeight((short) 400);
				for (int k = 0; k < cellNumber; k++) {
					cell = row.createCell((short) k);// 创建第0行第k列
					cell.setEncoding(HSSFCell.ENCODING_UTF_16);
					cell.setCellValue(tableHeader[k]);// 设置第0行第k列的值
					short y = (short) 6000;
					sheet.setColumnWidth((short) k, y);// 设置列的宽度
					font.setColor(HSSFFont.COLOR_NORMAL); // 设置单元格字体的颜色.
					font.setFontHeight((short) 250); // 设置单元字体高度
					style1.setFont(font);// 设置字体风格
					cell.setCellStyle(style1);
				}
				// 开始循环写入
				for (int i = 0; i < tongjis.size(); i++) {
					Tongji tongji = (Tongji) tongjis.get(i);// 获取会员对象
					row = sheet.createRow((short) (i + 1));// 创建第i+1行
					row.setHeight((short) 400);// 设置行高

						cell = row.createCell((short) 0); // 创建第i+1行第0列
						cell.setEncoding(HSSFCell.ENCODING_UTF_16);
						cell.setCellValue(tongji.getTime());// 设置第i+1行第1列的值
						cell.setCellStyle(style); // 设置风格
						
						cell = row.createCell((short) 1);
						cell.setEncoding(HSSFCell.ENCODING_UTF_16);
						cell.setCellValue(tongji.getHuiyuannum());
						cell.setCellStyle(style);
						
						cell = row.createCell((short)2);
						cell.setEncoding(HSSFCell.ENCODING_UTF_16);
						cell.setCellValue(tongji.getHuiyuanprice());
						cell.setCellStyle(style);
						
						cell = row.createCell((short) 3);
						cell.setEncoding(HSSFCell.ENCODING_UTF_16);
						cell.setCellValue(tongji.getCoursenum());
						cell.setCellStyle(style);

					
						cell = row.createCell((short)4);
						cell.setEncoding(HSSFCell.ENCODING_UTF_16);
						cell.setCellValue(tongji.getCourseprice());
						cell.setCellStyle(style);
					

						cell = row.createCell((short) 5);
						cell.setEncoding(HSSFCell.ENCODING_UTF_16);
						cell.setCellValue(tongji.getProductnum());
						cell.setCellStyle(style);
						

						cell = row.createCell((short) 6);
						cell.setEncoding(HSSFCell.ENCODING_UTF_16);
						cell.setCellValue(tongji.getProductprice());
						cell.setCellStyle(style);
						
						cell = row.createCell((short) 7);
						cell.setEncoding(HSSFCell.ENCODING_UTF_16);
						cell.setCellValue(tongji.getProductpoint());
						cell.setCellStyle(style);
						
						cell = row.createCell((short) 8);
						cell.setEncoding(HSSFCell.ENCODING_UTF_16);
						cell.setCellValue(tongji.getPrice());
						cell.setCellStyle(style);
						
						
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		HttpServletResponse response = null;// 创建一个HttpServletResponse对象
		OutputStream out = null;// 创建一个输出流对象
		try {
			response = ServletActionContext.getResponse();// 初始化HttpServletResponse对象
			out = response.getOutputStream();//

			String headerStr = "财务统计列表";
			headerStr = new String(headerStr.getBytes("utf-8"), "ISO8859-1");// headerString为中文时转码
			response.setHeader("Content-disposition", "attachment; filename="
					+ headerStr + ".xls");// filename是下载的xls的名，建议最好用英文
			response.setContentType("application/msexcel;charset=UTF-8");// 设置类型
			response.setHeader("Pragma", "No-cache");// 设置头
			response.setHeader("Cache-Control", "no-cache");// 设置头
			response.setDateHeader("Expires", 0);// 设置日期头
			workbook.write(out);
			out.flush();
			workbook.write(out);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {

				if (out != null) {
					out.close();
				}

			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		return null;
	}
	
	
	
	public String loginOut(){
		session.put("admin", null);
		System.out.println("退出");
		return "tologin";
	}
	
	public String add() throws NoSuchAlgorithmException{
		Admin temp=(Admin) session.get("admin");
		if(temp==null)
			return "tologin";
		if(temp.getName().equals("admin")&&temp.getQuanxian().equals("supermen")){
			if(file!=null){
				String imgName=ImageUploadUtil.upload(file, fileFileName);
				admin.setImg(imgName);
			}
			DAO.save(admin);
		}else{
			msg="权限不足";
			return findAll();
		}
		msg="添加成功";
		return findAll();
	}

	public String update() throws Exception{

		Admin temp=DAO.findbyid(Admin.class, admin.getId());
		if(temp==null)
			return "tologin";
		
		if(!temp.getPassword().equals(pwd)&&!admin.getPassword().equals(""))
		{
			msg="旧密码错误";
			return "shezhi";
		}
		
		if(file!=null){
			String imgName=ImageUploadUtil.upload(file, fileFileName);
			temp.setImg(imgName);
		}
		if(!admin.getPassword().equals("")){
			temp.setPassword(admin.getPassword());
			temp.setQianming(admin.getQianming());
		}else{
			temp.setQianming(admin.getQianming());
		}
		System.out.println("===="+admin.getPhone());
		temp.setPhone(admin.getPhone());
		temp.setPhone1(admin.getPhone1());
		DAO.update(temp);
		msg="修改成功";
		return "tologin";

	}
	
	public String update2() throws Exception{

		Admin temp=DAO.findbyid(Admin.class, admin.getId());
		
		if(file!=null){
			String imgName=ImageUploadUtil.upload(file, fileFileName);
			temp.setImg(imgName);
		}
		
		temp.setRname(admin.getRname());
		temp.setPhone(admin.getPhone());
		temp.setQianming(admin.getQianming());
		temp.setPassword(admin.getPassword());
			
		try {
			List<Course> courses = CourseDao.findbyfufei(null,temp.getId(),null,null);
			for(Course course:courses){
				course.setTeacher(temp.getRname());
				DAO.update(course);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		DAO.update(temp);
		msg="修改成功";
		return findAll();

	}
	
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public List<Admin> getAdmins() {
		return admins;
	}
	public void setAdmins(List<Admin> admins) {
		this.admins = admins;
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


	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public File getFile1() {
		return file1;
	}

	public void setFile1(File file1) {
		this.file1 = file1;
	}

	public File getFile2() {
		return file2;
	}

	public JsonResult getJsonresult() {
		return jsonresult;
	}

	public void setJsonresult(JsonResult jsonresult) {
		this.jsonresult = jsonresult;
	}

	public void setFile2(File file2) {
		this.file2 = file2;
	}

	public File getFile3() {
		return file3;
	}

	public void setFile3(File file3) {
		this.file3 = file3;
	}

	public String getFile1FileName() {
		return file1FileName;
	}

	public void setFile1FileName(String file1FileName) {
		this.file1FileName = file1FileName;
	}

	public String getFile2FileName() {
		return file2FileName;
	}

	public void setFile2FileName(String file2FileName) {
		this.file2FileName = file2FileName;
	}

	public String getFile3FileName() {
		return file3FileName;
	}

	public void setFile3FileName(String file3FileName) {
		this.file3FileName = file3FileName;
	}

	public String getName() {
		return name;
	}

	public List<Tongji> getTongjis() {
		return tongjis;
	}

	public void setTongjis(List<Tongji> tongjis) {
		this.tongjis = tongjis;
	}

	public String getTime1() {
		return time1;
	}

	public void setTime1(String time1) {
		this.time1 = time1;
	}

	public String getTime2() {
		return time2;
	}

	public void setTime2(String time2) {
		this.time2 = time2;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	

}
