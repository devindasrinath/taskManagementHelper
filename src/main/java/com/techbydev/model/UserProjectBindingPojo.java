package com.techbydev.model;

public class UserProjectBindingPojo {
	private String id;
	private String userid;
	private String projectId;


	public UserProjectBindingPojo(String id, String userid, String projectId) {
		super();
		this.id = id;
		this.userid = userid;
		this.projectId = projectId;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getProjectId() {
		return projectId;
	}


	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}


	@Override
	public String toString() {
		return "UserProjectBindingPojo1 [id=" + id + ", userid=" + userid + ", projectsId=" + projectId + "]";
	}


	
	

	

}
