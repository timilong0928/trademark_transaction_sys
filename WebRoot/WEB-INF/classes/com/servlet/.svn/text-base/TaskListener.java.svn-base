package com.servlet;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import com.servlet.ReminderTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class TaskListener implements ServletContextListener {

	private Timer timer = null;
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub

		// 在这里初始化监听器，在tomcat启动的时候监听器启动，可以在这里实现定时器功能
		timer = new Timer(true);
		//   
		Calendar calendar = Calendar.getInstance();
		// calendar.set(Calendar.DAY_OF_MONTH, 01);
		calendar.set(Calendar.HOUR_OF_DAY, 23 );
		calendar.set(Calendar.MINUTE, 59);
		calendar.set(Calendar.SECOND, 00);
		Date date = calendar.getTime();
		
		timer.schedule(new ReminderTask(sce.getServletContext()),date, 24 * 60 * 60 * 1000);
		
	}

	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		timer.cancel();
	}

	public Timer getTimer() {
		return timer;
	}

	public void setTimer(Timer timer) {
		this.timer = timer;
	}

}
