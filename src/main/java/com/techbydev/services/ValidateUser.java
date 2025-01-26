package com.techbydev.services;

import com.techbydev.dao.UsersDao;
import com.techbydev.pojo.UserPojo;

public class ValidateUser{
	
	private UserPojo cachedUserPojo;
	
	public String validateCredentials(String userName, String password) {
		if(cachedUserPojo==null || cachedUserPojo.getName()!=userName) {
			UsersDao userDao = new UsersDao();
			cachedUserPojo = userDao.getUserByName(userName);
		}
		return (cachedUserPojo!=null && cachedUserPojo.getName().equals(userName) && cachedUserPojo.getPassword().equals(password)) ? cachedUserPojo.getId():null;
	}
	
	public boolean isUserAdmin(String userName) {
		if(cachedUserPojo==null || cachedUserPojo.getName()!=userName) {
			UsersDao userDao = new UsersDao();
			cachedUserPojo = userDao.getUserByName(userName);
		}
		return cachedUserPojo.getRoles().contains("admin");
	}
	
	
	
}