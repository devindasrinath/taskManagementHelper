package com.techbydev.pojo;

public class ProjectPojo {
	public ProjectPojo(String id, String name, String description) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
	}

	private String id;
	private String name;
	private String description;

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

	public String getdescription() {
		return description;
	}

	public void setdescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "userPojo [id=" + id + ", name=" + name + ", description=" + description + "]";
	}

}
