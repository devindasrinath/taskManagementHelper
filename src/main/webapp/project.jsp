<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Task Management</title>
<style>
/* Global styles */
body {
	font-family: 'Arial', sans-serif;
	background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
	/* Soft gradient background */
	color: #333;
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 30px;
	margin: 0;
	min-height: 100vh;
	box-sizing: border-box;
}

/* Container for tasks */
.project-container {
	flex-direction: row;
	justify-content: space-between;
	width: 100%;
	max-width: 1200px;
	background-color: #ffffff;
	padding: 40px;
	border-radius: 12px;
	box-sizing: border-box;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
	position: relative;
}

h1 {
	text-align: left;
	color: #333;
	font-size: 2rem;
	margin-bottom: 20px;
}

.task-view {
	display: flex;
}

/* Task list */
.task-list {
	list-style: none;
	padding: 0;
	margin: 0;
	width: 60%;
	margin-right: 20px;
}

/* Task item */
.task-item {
	background-color: #607d8b21;
	padding: 15px;
	border-radius: 8px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	margin-bottom: 10px;
	text-align: left;
	text-decoration: none;
	color: #333;
	font-size: 1.2rem;
	transition: all 0.3s ease;
	display: block;
}

.task-item:hover {
	background-color: #f0f8ff;
	transform: translateY(-5px);
}

.delete-project {
	background-color: #673ab7ba;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 20px;
	cursor: pointer;
	font-size: 1rem;
	transition: all 0.3s ease;
	text-align: center;
	margin-left: 10px;
	text-decoration: none;
}

.delete-project:hover {
	background-color: #673ab7;
}

/* Assigned users section */
.assigned-users {
	margin-top: 30px;
	margin-left: auto;
	width: 30%;
	background-color: #f9f9f9;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	max-height: 400px;
	overflow-y: auto;
}

.assigned-users h2 {
	font-size: 1.5rem;
	color: #333;
}

.user-item {
	display: flex;
	justify-content: space-between;
	padding: 10px;
	background-color: #fff;
	border-radius: 8px;
	margin-bottom: 10px;
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.1);
}

.remove-user-btn {
	background-color: #f44336;
	color: white;
	border: none;
	padding: 5px 10px;
	border-radius: 5px;
	cursor: pointer;
}

.remove-user-btn:hover {
	background-color: #d32f2f;
}

/* Button styles */
.button-container {
	width: 100%;
	display: flex;
	justify-content: flex-end;
	margin-bottom: 20px;
}

.create-task {
	background-color: #0078d4;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 20px;
	cursor: pointer;
	font-size: 1rem;
	transition: all 0.3s ease;
	text-align: center;
	margin-left: 10px;
	text-decoration: none;
}

.create-task:hover {
	background-color: #005bb5;
}

.back-to-projects {
	background-color: #28a745;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 20px;
	cursor: pointer;
	font-size: 1rem;
	transition: all 0.3s ease;
	text-align: center;
	margin-left: 10px;
	text-decoration: none;
}

.back-to-projects:hover {
	background-color: #218838;
}

.logout-user {
	background: #d9534f;
	color: white;
	border: none;
	border-radius: 20px;
	padding: 10px 20px;
	cursor: pointer;
	font-size: 1rem;
	transition: all 0.3s ease;
	text-align: center;
	margin-left: 10px;
	text-decoration: none;
}

.logout-user:hover {
	background: #c9302c;
}

.no-tasks-message {
	text-align: center;
	color: #888;
	font-size: 1.1rem;
	margin-top: 20px;
}

/* Dropdown button */
.dropdown-button {
	background-color: #28a745;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 20px;
	cursor: pointer;
	font-size: 1rem;
	transition: all 0.3s ease;
	text-align: left;
	width: 100%;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

/* Icon for dropdown */
.dropdown-button::after {
	content: "▼";
	font-size: 0.8rem;
	margin-left: 10px;
}

/* Dropdown content (hidden by default) */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: white;
	width: 100%;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
	border-radius: 8px;
	z-index: 1;
	max-height: 200px;
	overflow-y: auto;
}

/* Dropdown items */
.dropdown-content div {
	color: #333;
	padding: 10px 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

/* Hover effect for items */
.dropdown-content div:hover {
	background-color: #f0f8ff;
}

/* Show dropdown on button click */
.show {
	display: block;
}

.dropdown {
	position: relative;
	display: inline-block;
	margin-top: 20px;
}

.dropdown select {
	width: 100%;
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ccc;
	background-color: #f9f9f9;
	cursor: pointer;
}

.assign-user {
	margin-top: 20px;
	padding: 10px;
	font-size: 16px;
	background-color: #888888;
	color: white;
	border: none;
	cursor: pointer;
	margin-left: 0;
}

.assign-user:hover {
	background-color: #2c6e2f;
}
.span-letters{
	margin-top: 2%;
}
/* Responsive design */
@media ( max-width : 768px) {
	.project-container {
		flex-direction: column;
		padding: 20px;
	}
	.task-list, 
	.assigned-users {
		width: 100%;
		margin: 10px 0;
	}
	.assigned-users {
		max-height: none;
	}
}
</style>
</head>
<body>
	<div class="project-container">

		<!-- Button Container -->
		<div class="button-container">
			<c:if test="${isAdmin == true}">
				<a href="/taskManagementHelper/createTask?projectId=${projectId}">
					<button class="create-task">Create Task</button>
				</a>
			</c:if>
			<c:if test="${isAdmin == true}">
				<form action="/taskManagementHelper/deleteProject" method="POST">
					<button id="deleteTaskBtn" class="delete-project">Delete Project
					</button>
					<input type="hidden" name="projectId" value="${projectId}" />
				</form>
			</c:if>
			<a href="/taskManagementHelper/dashBoard">
				<button class="back-to-projects">DashBoard</button>
			</a>

			<form action="/taskManagementHelper/logoutUser" method="POST">
				<button class="logout-user" type="submit">Logout</button>
			</form>
		</div>

		<div class="task-view">
			<!-- Left side: Task List -->
			<div class="task-list">
				<h1>Your Tasks</h1>
				<c:forEach items="${userTasks}" var="task">
					<a class="task-item"
						href="/taskManagementHelper/task?id=${task.getId()}"
						data-method="GET"> ${task.getName()} </a>
				</c:forEach>

				<c:if test="${userTasks == null || userTasks.isEmpty()}">
					<div class="no-tasks-message">No tasks for this project</div>
				</c:if>
			</div>

			<!-- Right side: Assign new Users and Assigned Users -->
			<div class="assigned-users">
				<h2>Assigned Users</h2>
				<c:forEach items="${assignedUsers}" var="user">
					<div class="user-item">
						<span class="span-letters">ID: ${user.getId()} - Name: ${user.getName()}</span>
						<c:if test="${isAdmin == true}">
							<form action="/taskManagementHelper/project/removeUser"
								method="POST" style="display: inline;">
								<input type="hidden" name="projectId" value="${projectId}" /> <input
									type="hidden" name="userId" value="${user.getId()}" />
								<button type="submit" class="remove-user-btn">❌</button>
							</form>
						</c:if>
					</div>
				</c:forEach>

				<c:if test="${assignedUsers == null || assignedUsers.isEmpty()}">
					<div>No users assigned to this project yet.</div>
				</c:if>


				<c:if test="${isAdmin == true && selectedUsers.size()>0}">
					<div class="dropdown">
						<form action="/taskManagementHelper/bindUserProject" method="POST">
							<select id="userId" name="userId" required="required">
								<c:forEach var="user" items="${selectedUsers}">
									<option value="${user.getId()}">${user.getName()}(ID:
										${user.getId()})</option>
								</c:forEach>
							</select> <input type="hidden" name="projectId" value="${projectId}" /> <input
								type="submit" value="Assign to Task" class="assign-user" />
						</form>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>
