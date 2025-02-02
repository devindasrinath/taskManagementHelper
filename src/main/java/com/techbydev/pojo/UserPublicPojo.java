package com.techbydev.pojo;


import java.sql.Array;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

public class UserPublicPojo {
	private String id;
	private String name;
	private ArrayList<String> roles;
	
	public UserPublicPojo(String id, String name, Array roles) throws SQLException {
		super();
		this.id = id;
		this.name = name;
        this.roles = new ArrayList<>(Arrays.asList((String[])roles.getArray()));
    
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

	public ArrayList<String> getRoles() {
		return roles;
	}

	public void setRoles(ArrayList<String> roles) {
		this.roles = roles;
	}

	@Override
	public String toString() {
		return "UserPojo [id=" + id + ", name=" + name + ", roles=" + roles + "]";
	}





}
