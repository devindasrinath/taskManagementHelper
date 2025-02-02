package com.techbydev.dao;

import utils.ConfigReader;

public class CommonDao {

	protected String url;
	protected String username;
	protected String password;
	
	public CommonDao() {
		url = ConfigReader.getProperty("db.url");
		username = ConfigReader.getProperty("db.username");
		password = ConfigReader.getProperty("db.password");
	}
	

}
