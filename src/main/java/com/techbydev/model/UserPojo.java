package com.techbydev.model;

import java.sql.SQLException;
import java.util.ArrayList;

public class UserPojo {
	private String id;
	private String name;
	private String password;
	private ArrayList<String> roles;

	public UserPojo(String id, String name, String password, ArrayList<String> roles) throws SQLException {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.roles = roles;

	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public ArrayList<String> getRoles() {
		return roles;
	}

	public void setRoles(ArrayList<String> roles) {
		this.roles = roles;
	}

	@Override
	public String toString() {
		return "UserPojo [id=" + id + ", name=" + name + ", password=" + password + ", roles=" + roles + "]";
	}

}
