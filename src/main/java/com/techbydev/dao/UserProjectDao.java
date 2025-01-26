package com.techbydev.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.techbydev.pojo.UserProjectBindingPojo;

public class UserProjectDao {
	String url = "jdbc:postgresql://localhost:5432/taskManager";
	String username = "postgres";
	String password = "admin";

	
	public int assignProject(UserProjectBindingPojo userProjectBindingPojo) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("INSERT INTO project_user_mapping(project_id,user_id) VALUES(?,?)");
			st.setInt(1, Integer.parseInt(userProjectBindingPojo.getProjectId()));
			st.setInt(2, Integer.parseInt(userProjectBindingPojo.getUserid()));
			int rs = st.executeUpdate();
			con.close();
			return rs;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return -1;

	}

}
