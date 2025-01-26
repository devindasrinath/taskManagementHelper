package com.techbydev.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.techbydev.pojo.TaskPojo;

public class TasksDao {
	String url = "jdbc:postgresql://localhost:5432/taskManager";
	String username = "postgres";
	String password = "admin";

	public int addTask(TaskPojo task) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			
			PreparedStatement st = con.prepareStatement("INSERT INTO tasks(name,description,project_id) VALUES(?,?,?)");
			System.out.println(task.toString());
			st.setString(1, task.getName());
			st.setString(2, task.getDescription());
			st.setInt(3, Integer.parseInt(task.getProjectId()));
			int res = st.executeUpdate();
			con.close();
			return res;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return 0;

	}
	
	public TaskPojo getTaskById(String taskId) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			
			PreparedStatement st = con.prepareStatement("SELECT * FROM tasks WHERE id=?");
			st.setInt(1, Integer.parseInt(taskId));
			ResultSet rs = st.executeQuery();
			con.close();
			rs.next();
			TaskPojo task = new TaskPojo(rs.getString(1), rs.getString(2), rs.getString(3),rs.getString(4));
			return task;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;

	}
	
	public TaskPojo getTaskByNameProject(String taskName,String projectId) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			
			PreparedStatement st = con.prepareStatement("SELECT * FROM tasks WHERE name=? AND project_id=?");
			st.setInt(1, Integer.parseInt(taskName));
			st.setInt(2, Integer.parseInt(projectId));
			ResultSet rs = st.executeQuery();
			con.close();
			rs.next();
			TaskPojo task = new TaskPojo(rs.getString(1), rs.getString(2), rs.getString(3),rs.getString(4));
			return task;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;

	}
	
	public ArrayList<TaskPojo> getAllTasks() {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			
			PreparedStatement st = con.prepareStatement("SELECT * FROM tasks");
			ResultSet rs = st.executeQuery();
			con.close();
			ArrayList<TaskPojo> taskPojos = new ArrayList<TaskPojo>();

			while(rs.next()) {
				taskPojos.add(new TaskPojo(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			}
			return taskPojos;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;

	}
	

	public ArrayList<TaskPojo> getTasksByUserId(String userId, String projectId) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			
			PreparedStatement st = con.prepareStatement("SELECT tasks.* FROM tasks_user_mapping LEFT JOIN tasks ON tasks_user_mapping.task_id=tasks.id WHERE tasks_user_mapping.user_id=? AND tasks.project_id=?");
			st.setInt(1, Integer.parseInt(userId));
			st.setInt(2, Integer.parseInt(projectId));
			ResultSet rs = st.executeQuery();
			con.close();
			ArrayList<TaskPojo> taskPojos = new ArrayList<TaskPojo>();

			while(rs.next()) {
				taskPojos.add(new TaskPojo(rs.getString(1), rs.getString(2), rs.getString(3),rs.getString(4)));
			}
			return taskPojos;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;

	}

}
