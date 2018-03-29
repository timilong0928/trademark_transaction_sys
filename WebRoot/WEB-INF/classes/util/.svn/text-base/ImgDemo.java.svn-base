package util;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class ImgDemo {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String imgstr="iVBORw0KGgoAAAANSUhEUgAABPAAAAAXCAYAAACFzbEqAAACpUlEQVR4nO3dS46jMBRAUfa/2uwgPaL7ycIfMOnH5wyOKCAQZBhdmdTyXZYv9/X5fDhZ9j0FAAAAiJbsC2BOdux6oux7CgAAABAJeDeXHbueKPueAgAAAEQC3pFBmzjmyLEt2bHribKfLwAAAIBIwFsHovi7VPtsa1vr/Gddd3bseqLsZxEAAAAgEvDiYBTLcnttvbe93CfgXVv2cwgAAAAQCXhxMIplbftswDvTL0PWEs6/dL5r3d/73B1kP4cAAAAA0esDXut12N6ydc4RZ1z/TJjbuqZawOvFuSeEOwEPAAAAuKLXB7zvMj7jbuYfUVxtBl4r2I3MpmuFybvHveznEQAAACAS8Ja5gDc6q+5qAa8V7I68DnuVSHfGdWQ/jwAAAACRgBcHY+eydfzeV2aPvl77vwJebXadgAcAAADwWwJeHIydy9rxW+t7Z+eNRrxfhrvWb+CVr8zWXp2tvapb/g7f1jG1fa3ztF7lFfAAAACAOxLw1oHY+PvMgNc6Lu7fOwtvZqbaTMDbCnp7ZsVtxbgj39NbF/AAAACAu3t9wNsKZhkBb2/sW82EquyAdyTSCXgAAADA27w+4P0diMFtI9troW/P+QQ8AQ8AAADguwh4/waisr437JUz+Xqz+/Z+R2k23rWi10gs60U/AQ8AAABgjoC3DkRjfe9Mutbv2LVm523pXfdZ8W40ssXPt/bH9ajc3jr31ne0zlu7DgEPAAAAuDMBbx2Iyt9bnxkJa73fuxudYdczM9OsN9PtyOy2M2bAnXGOGdnPIgAAAEAk4JUDMrn/rO8ZlRm6fqE1807AAwAAAN5IwLu57OD2RNn3FAAAACAS8G4uO3Y9UfY9BQAAAIgEvJvLjl1PlH1PAQAAACIB7+ayY9cTZd9TAAAAgOgPYUmKapuV8ygAAAAASUVORK5CYII=";
		GenerateImage(imgstr, "D:\\");
	}
	
	
	
	public static String GetImageStr(String imgFilePath){
		byte[] data=null;
		try{
			InputStream in=new FileInputStream(imgFilePath);
			data=new byte[in.available()];
			in.read(data);
			in.close();
			
		}catch (Exception e) {
		e.printStackTrace();
		}
		BASE64Encoder encoder=new BASE64Encoder();
		return encoder.encode(data);
		
	}
	public static boolean GenerateImage(String imgstr,String imgFilePath){
		if(imgstr==null){
			return false;
		}
		 BASE64Decoder decoder=new BASE64Decoder();
		try {
			byte[] bytes=decoder.decodeBuffer(imgstr);
			System.out.println("bytes"+bytes.length);
			for(int i=0;i<bytes.length;i++){
				if(bytes[i]<0){
					bytes[i]+=256;
				}
			}
			OutputStream out=new FileOutputStream(imgFilePath);
			out.write(bytes);
			out.flush();
			out.close();
			return true;
			
		} catch (Exception e) {
			return false;
		}
	}

}
