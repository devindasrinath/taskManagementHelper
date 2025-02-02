package com.techbydev.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.techbydev.pojo.TaskPojo;

public class TasksDao extends CommonDao {
	public TasksDao() {
		super();
	}

	public int addTask(TaskPojo task) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);

			PreparedStatement st = con
					.prepareStatement("INSERT INTO tasks(name,description,estimation,project_id) VALUES(?,?,?,?)");
			st.setString(1, task.getName());
			st.setString(2, task.getDescription());
			st.setFloat(3, Float.parseFloat(task.getEstimation()));
			st.setInt(4, Integer.parseInt(task.getProjectId()));
			int res = st.executeUpdate();
			con.close();
			return res;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return 0;

	}

	public int deleteTask(String taskId) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);

			PreparedStatement st = con.prepareStatement("DELETE FROM tasks WHERE id=?");
			st.setInt(1, Integer.parseInt(taskId));
			int res = st.executeUpdate();
			con.close();
			return res;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return 0;
	}

	public int changeTaskStateById(String taskId, String status) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);

			PreparedStatement st = con.prepareStatement("UPDATE tasks SET status=? WHERE id=?");
			st.setString(1, status);
			st.setInt(2, Integer.parseInt(taskId));
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
			TaskPojo task = new TaskPojo(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
					rs.getString(5), rs.getString(6));
			return task;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;

	}

	public TaskPojo getTaskByNameProject(String taskName, String projectId) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);

			PreparedStatement st = con.prepareStatement("SELECT * FROM tasks WHERE name=? AND project_id=?");
			st.setInt(1, Integer.parseInt(taskName));
			st.setInt(2, Integer.parseInt(projectId));
			ResultSet rs = st.executeQuery();
			con.close();
			rs.next();
			TaskPojo task = new TaskPojo(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
					rs.getString(5), rs.getString(6));
			return task;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;

	}

	public ArrayList<TaskPojo> getAllTasks(String projectId) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);

			PreparedStatement st = con.prepareStatement("SELECT * FROM tasks WHERE tasks.project_id=?");
			st.setInt(1, Integer.parseInt(projectId));
			ResultSet rs = st.executeQuery();
			con.close();
			ArrayList<TaskPojo> taskPojos = new ArrayList<TaskPojo>();

			while (rs.next()) {
				taskPojos.add(new TaskPojo(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6)));
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

			PreparedStatement st = con.prepareStatement(
					"SELECT tasks.* FROM tasks_user_mapping LEFT JOIN tasks ON tasks_user_mapping.task_id=tasks.id WHERE tasks_user_mapping.user_id=? AND tasks.project_id=?");
			st.setInt(1, Integer.parseInt(userId));
			st.setInt(2, Integer.parseInt(projectId));
			ResultSet rs = st.executeQuery();
			con.close();
			ArrayList<TaskPojo> taskPojos = new ArrayList<TaskPojo>();

			while (rs.next()) {
				taskPojos.add(new TaskPojo(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6)));
			}
			return taskPojos;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;

	}

	public String getProjectIdByTaskId(String taskId) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("SELECT project_id FROM tasks WHERE id=?");
			st.setInt(1, Integer.parseInt(taskId));
			ResultSet rs = st.executeQuery();
			con.close();
			if (!rs.next()) {
				return null;
			}
			return rs.getString(1);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}

}
