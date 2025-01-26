package com.techbydev.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.techbydev.pojo.UserPojo;

public class UsersDao {
	String url = "jdbc:postgresql://localhost:5432/taskManager";
	String username = "postgres";
	String password = "admin";

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
			return new UserPojo(rs.getString(1), rs.getString(2), rs.getString(3), rs.getArray(4));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;

	}

}
