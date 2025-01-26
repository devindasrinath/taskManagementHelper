package com.techbydev.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.techbydev.pojo.UserTaskBindingPojo;

public class UserTaskDao {
	String url = "jdbc:postgresql://localhost:5432/taskManager";
	String username = "postgres";
	String password = "admin";

	public int assignTask(UserTaskBindingPojo userTaskBindingPojo) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement(
					"INSERT INTO tasks_user_mapping(task_id,user_id) SELECT ?, ?  WHERE EXISTS(SELECT 1 FROM project_user_mapping up JOIN tasks ON up.project_id=tasks.project_id WHERE tasks.id = ? AND up.user_id = ?)");
			st.setInt(1, Integer.parseInt(userTaskBindingPojo.getTaskId()));
			st.setInt(2, Integer.parseInt(userTaskBindingPojo.getUserId()));
			st.setInt(3, Integer.parseInt(userTaskBindingPojo.getTaskId()));
			st.setInt(4, Integer.parseInt(userTaskBindingPojo.getUserId()));
			int rs = st.executeUpdate();
			con.close();
			return rs;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return -1;

	}

}
