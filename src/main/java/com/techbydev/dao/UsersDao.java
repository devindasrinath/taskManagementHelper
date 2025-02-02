package com.techbydev.dao;

import java.sql.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import com.techbydev.pojo.UserPojo;
import com.techbydev.pojo.UserPublicPojo;

public class UsersDao extends CommonDao{
	public UsersDao() {
		super();
	}

	public UserPojo getUserByName(String userName) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("SELECT * FROM users WHERE user_name=?");
			st.setString(1, userName);
			ResultSet rs = st.executeQuery();
			con.close();
			if (!rs.next()) {
				return null;
			}
			String[] data = (String[]) rs.getArray(4).getArray(); // Cast to appropriate type
			return new UserPojo(rs.getString(1), rs.getString(2), rs.getString(3), new ArrayList<>(Arrays.asList(data)));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;

	}
	
	public int createUser(UserPojo userPojo) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("INSERT INTO users(user_name, password, roles) VALUES(?,?,?)");
			st.setString(1, userPojo.getName());
			st.setString(2, userPojo.getPassword());
			String[] rolesArray = new String[]{"member"};  // Explicitly create a String array
			Array sqlArray = con.createArrayOf("varchar", rolesArray); // Use "varchar" since column type is VARCHAR[]

			st.setArray(3, sqlArray);
			st.executeUpdate();
			con.close();
			return 0;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return -1;

	}
	
	public ArrayList<UserPublicPojo> getUsersByTaskId(String taskId) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("SELECT users.* FROM tasks_user_mapping tu LEFT JOIN users ON tu.user_id=users.id WHERE tu.task_id=?");
			st.setInt(1, Integer.parseInt(taskId));
			ResultSet rs = st.executeQuery();
			con.close();
			ArrayList<UserPublicPojo> userPublicPojos = new ArrayList<UserPublicPojo>();
			while(rs.next()) {
				userPublicPojos.add(new UserPublicPojo(rs.getString(1), rs.getString(2), rs.getArray(4)));
			}
			return userPublicPojos;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;

	}
	
	public ArrayList<UserPublicPojo> getUsersByprojectId(String projectId) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("SELECT users.* FROM project_user_mapping pu LEFT JOIN users ON pu.user_id=users.id WHERE pu.project_id=?");
			st.setInt(1, Integer.parseInt(projectId));
			ResultSet rs = st.executeQuery();
			con.close();
			ArrayList<UserPublicPojo> userPublicPojos = new ArrayList<UserPublicPojo>();
			while(rs.next()) {
				userPublicPojos.add(new UserPublicPojo(rs.getString(1), rs.getString(2), rs.getArray(4)));
			}
			return userPublicPojos;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;

	}
	
	public ArrayList<UserPublicPojo> getAllUsers() {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("SELECT * FROM users");
			ResultSet rs = st.executeQuery();
			con.close();
			ArrayList<UserPublicPojo> userPublicPojos = new ArrayList<UserPublicPojo>();
			while(rs.next()) {
				userPublicPojos.add(new UserPublicPojo(rs.getString(1), rs.getString(2), rs.getArray(4)));
			}
			return userPublicPojos;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;

	}


}
