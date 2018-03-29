package com.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import org.apache.commons.codec.binary.Base64;

public class SecretUtil {
	public static String md5(String msg) throws NoSuchAlgorithmException{
		//md5加密
		MessageDigest md=MessageDigest.getInstance("MD5");
		byte[] input=msg.getBytes();
		byte[] output=md.digest(input);
		String res=Base64.encodeBase64String(output);
		return res;
	}
	
//	public static void main(String[] args) throws NoSuchAlgorithmException {
//		System.out.println(md5("1234"));
//	}

}
