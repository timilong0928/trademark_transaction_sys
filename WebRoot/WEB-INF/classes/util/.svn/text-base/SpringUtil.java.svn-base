package util;


import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

import pojo.Admin;

public class SpringUtil implements ApplicationContextAware {
	
	private static ApplicationContext ac;
	
	public static Object getBean(String beanname){
		return ac.getBean(beanname);
	}

	public void setApplicationContext(ApplicationContext ac)
			throws BeansException {
		SpringUtil.ac=ac;
	}
	
	
	public static void main(String[] args) {
		System.out.println(Admin.class.getName());
	}
	
	
	
}
