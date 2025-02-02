package com.techbydev.model;


public class UserTaskBindingPojo {
	private String id;
	private String userId;
	private String taskId;
	
	public UserTaskBindingPojo(String id, String userId, String taskId) {
		super();
		this.id = id;
		this.userId = userId;
		this.taskId = taskId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	@Override
	public String toString() {
		return "UserTaskBindingPojo [id=" + id + ", userId=" + userId + ", taskId=" + taskId + "]";
	}

	

}
