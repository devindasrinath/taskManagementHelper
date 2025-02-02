<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Task Details</title>
<style>
/* Global styles */
body {
	font-family: 'Arial', sans-serif;
	background-color: #f4f7fb;
	color: #333;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	flex-direction: column;
}

/* Task Card */
.task-card {
	background-color: white;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	padding: 30px;
	width: 90%;
	max-width: 800px;
	margin-top: 20px;
	position: relative;
}

.task-card h1 {
	color: #0078d4;
	font-size: 2rem;
	text-align: center;
	margin-bottom: 20px;
}

/* Task Details */
.task-details {
	display: flex;
}

.task-description {
	margin-top: 15px;
	font-style: italic;
	color: #666;
}

/* User List */
.user-list {
	margin-top: 30px;
	padding: 10px;
	background-color: #f9f9f9;
	border-radius: 8px;
}

.user-list h2 {
	color: #0078d4;
	font-size: 1.5rem;
	margin-bottom: 10px;
}

.user-list ul {
	list-style: none;
	padding: 0;
}

.user-list ul li {
	padding: 5px 0;
	font-size: 1rem;
	color: #555;
}

.user-list ul li span {
	font-weight: bold;
}

/* Button Container */
.button-container {
	width: 100%;
	display: flex;
	justify-content: flex-end;
	margin-bottom: 20px;
}

/* Back to Project Button */
.back-to-project {
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

.back-to-project:hover {
	background: #218838;
}

.delete-task {
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

.delete-task:hover {
	background-color: #005bb5;
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

.task-fields {
	list-style: none;
	padding: 0;
	margin: 0;
	width: 60%;
	margin-right: 20px;
}
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
.user-item {
	display: flex;
	justify-content: space-between;
	padding: 10px;
	background-color: #fff;
	border-radius: 8px;
	margin-bottom: 10px;
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.1);
}
.span-letters{
	margin-top: 2%;
}
/* Responsive Layout */
@media ( max-width : 768px) {
	.task-card {
		flex-direction: column;
		padding: 20px;
	}
	.task-list, 
	.assigned-users {
		width: 100%;
		margin: 10px 0;
		max-height: none;
	}
}
</style>
</head>

<body>

	<div class="task-card">
		<div class="button-container">
			<c:if test="${isAdmin == true}">
				<form action="/taskManagementHelper/deleteTask" method="POST">
					<button id="deleteTaskBtn" class="delete-task">Delete Task
					</button>
					<input type="hidden" name="taskId" value="${task.id}" />
				</form>
			</c:if>
			<a href="/taskManagementHelper/project?id=${task.projectId}">
				<button type="submit" class="back-to-project">Back to
					Project</button>
			</a>
			<form action="/taskManagementHelper/logoutUser" method="POST">
				<button type="submit" class="logout-user">Logout</button>
			</form>
		</div>

		<!-- Task Details -->
		<div class="task-details">
			<div class="task-fields">
				<h1>Task Details</h1>
				<p>
					<span>ID:</span> ${task.getId()}
				</p>
				<p>
					<span>Task Name:</span> ${task.getName()}
				</p>
				<p>
					<span>Estimation:</span> ${task.getEstimation()}
				</p>
				<p>
					<span>Project ID:</span> ${task.getProjectId()}
				</p>

				<!-- Task Description -->
				<c:if test="${task.getDescription() != null}">
					<p>
						<span>Description:</span> ${task.getDescription()}
					</p>
				</c:if>
				<c:if test="${task.getDescription() == null}">
					<p>
						<span>Description:</span> No description available
					</p>
				</c:if>

				<div class="dropdown">
					<form action="/taskManagementHelper/changeTaskState" method="POST">
						<select id="taskState" name="taskState" required="required" onchange="this.form.submit()">
							<option value="TODO" ${task.getStatus().equals("TODO")?'selected':''}>Todo</option>
							<option value="IN PROGRESS" ${task.getStatus().equals("IN PROGRESS")?'selected':''}>In Progress</option>
							<option value="DEV REVIEW" ${task.getStatus().equals("DEV REVIEW")?'selected':''}>Dev Review</option>
							<option value="DONE" ${task.getStatus().equals("DONE")?'selected':''}>Done</option>
						</select>
						<input type="hidden" name="taskId" value="${task.getId()}" />
					</form>
				</div>
			</div>
			<div class="assigned-users">
			
				<!-- User List -->
				<h2>Assigned Users</h2>				
				<c:forEach items="${assignedUsers}" var="user">
					<div class="user-item">
						<span  class="span-letters">ID: ${user.getId()} - Name: ${user.getName()}</span>
						<c:if test="${isAdmin == true}">
							<form action="/taskManagementHelper/task/removeUser"
								method="POST" style="display: inline;">
								<input type="hidden" name="taskId" value="${task.getId()}" /> <input
									type="hidden" name="userId" value="${user.getId()}" />
								<button type="submit" class="remove-user-btn">❌</button>
							</form>
						</c:if>
					</div>
				</c:forEach>
				
				<c:if test="${isAdmin == true && selectedUsers.size()>0}">
					<div class="dropdown">
						<form action="/taskManagementHelper/bindUserTask" method="POST">
							<select id="userId" name="userId" required="required">
								<c:forEach var="user" items="${selectedUsers}">
									<option value="${user.getId()}">${user.getName()}(ID:${user.getId()})</option>
								</c:forEach>
							</select> <input type="hidden" name="taskId" value="${task.getId()}" /> <input
								type="submit" value="Assign to Task" class="assign-user" />
						</form>
					</div>
				</c:if>

			</div>
		</div>

	</div>

</body>

</html>
