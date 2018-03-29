package action;

import java.io.File;

import pojo.Content;
import util.ImageUploadUtil;

import com.opensymphony.xwork2.ActionSupport;

import dao.DAO;

  
  
public class UploadAction extends ActionSupport{  
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private File file;  
    private String fileFileName;  
    private String fileContentType;  
    private Integer id;
    private String msg;
      
    public String execute(){ 
    	   String video = ImageUploadUtil.upload(file, fileFileName);
    	   System.err.println(id);
    	   try {
    		   Content content= DAO.findbyid(Content.class,id);
    		   content.setContent1(video);
    		   DAO.update(content);
    		   msg="1";
			} catch (Exception e) {
				// TODO: handle exception
			}
           /*System.out.println("file:"+file);  
           String root="C:/shangbiao18/";
           InputStream is=new FileInputStream(file);  
           System.out.println("root:"+root);  
             
           System.out.println("name:"+this.fileFileName);  
           System.out.println("type:"+this.fileContentType);  
           File destFile=new File(root,this.fileFileName);  
           
           OutputStream os=new FileOutputStream(destFile);    
           
           //byte [] b=new byte[1024*1024*10];  
           byte [] b=new byte[500];
           int length=0;                     
           while(true){  
                 length=is.read(b);  
                 if(length<0)  
                     break;  
                 os.write(b,0,length);                     
           }              
           msg = "upload/"+fileFileName;
           is.close();
           os.close();*/
           
      return "success";  
   } 
    
    public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
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


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    
}  
