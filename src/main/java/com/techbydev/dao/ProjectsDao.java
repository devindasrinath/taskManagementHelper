package com.techbydev.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.techbydev.pojo.ProjectPojo;

public class ProjectsDao extends CommonDao{
	public ProjectsDao() {
		super();
	}

	public int addProject(ProjectPojo project) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("INSERT INTO projects(name,description) VALUES(?,?)");
			st.setString(1, project.getName());
			st.setString(2, project.getdescription());
			int res = st.executeUpdate();
			con.close();
			return res;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return 0;

	}
	
	public int deleteProject(String projectId) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("DELETE FROM projects WHERE id=?");
			st.setInt(1, Integer.parseInt(projectId));
			int res = st.executeUpdate();
			con.close();
			return res;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return 0;

	}
	
	public ProjectPojo getProjectByName(String projectName) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("SELECT * FROM projects WHERE name=?");
			st.setString(1, projectName);
			ResultSet rs = st.executeQuery();
			con.close();
			rs.next();
			return new ProjectPojo(rs.getString(1), rs.getString(2), rs.getString(3));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;

	}
	
	public ProjectPojo getProjectById(String projectId) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("SELECT * FROM projects WHERE id=?");
			st.setString(1, projectId);
			ResultSet rs = st.executeQuery();
			con.close();
			rs.next();
			return new ProjectPojo(rs.getString(1), rs.getString(2), rs.getString(3));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;

	}
	
	public ArrayList<ProjectPojo> getAllProjects() {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			
			PreparedStatement st = con.prepareStatement("SELECT * FROM projects");
			ResultSet rs = st.executeQuery();
			con.close();
			ArrayList<ProjectPojo> projectPojos = new ArrayList<ProjectPojo>();

			while(rs.next()) {
				projectPojos.add(new ProjectPojo(rs.getString(1), rs.getString(2), rs.getString(3)));
			}
			return projectPojos;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;

	}
	
	public ArrayList<ProjectPojo> getProjectsByAssignedUserId(String userId) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("SELECT projects.* FROM project_user_mapping LEFT JOIN projects ON project_user_mapping.project_id=projects.id WHERE user_id=?");
			st.setInt(1, Integer.parseInt(userId));
			ResultSet rs = st.executeQuery();
			con.close();
			ArrayList<ProjectPojo> projectPojos = new ArrayList<ProjectPojo>();
			while(rs.next()) {
				projectPojos.add(new ProjectPojo(rs.getString(1), rs.getString(2), rs.getString(3)));
			}
			return projectPojos;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;

	}
	

}
