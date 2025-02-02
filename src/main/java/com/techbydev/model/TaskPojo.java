package com.techbydev.model;

public class TaskPojo {
	
	private String id;
	private String name;
	private String description;
	private String estimation;
	private String status;
	private String projectId;
	
	public TaskPojo(String id, String name, String description, String estimation, String status, String projectId) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.estimation = estimation;
		this.status = status;
		this.projectId = projectId;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getEstimation() {
		return estimation;
	}
	public void setEstimation(String estimation) {
		this.estimation = estimation;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	@Override
	public String toString() {
		return "TaskPojo [id=" + id + ", name=" + name + ", description=" + description + ", estimation=" + estimation
				+ ", projectId=" + projectId + "]";
	}



	
	

}
