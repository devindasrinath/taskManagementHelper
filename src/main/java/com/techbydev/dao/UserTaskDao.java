package com.techbydev.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.techbydev.model.UserTaskBindingPojo;

public class UserTaskDao extends CommonDao{
	public UserTaskDao() {
		super();
	}

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
	
	public int unassignTask(UserTaskBindingPojo userTaskBindingPojo) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement(
					"DELETE FROM tasks_user_mapping WHERE task_id=?  AND user_id=?");
			st.setInt(1, Integer.parseInt(userTaskBindingPojo.getTaskId()));
			st.setInt(2, Integer.parseInt(userTaskBindingPojo.getUserId()));
			int rs = st.executeUpdate();
			con.close();
			return rs;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return -1;

	}
	
	
}
