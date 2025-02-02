<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create New Task</title>
<style>
/* Global Styles */
body {
	font-family: 'Arial', sans-serif;
	background-color: #f7f7f7;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	flex-direction: column;
}

/* Main Container */
.container {
	background-color: white;
	border-radius: 10px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	padding: 40px;
	width: 100%;
	max-width: 600px;
}

h1 {
	text-align: center;
	color: #0078d4;
	margin-bottom: 30px;
}

/* Form Styling */
form {
	display: flex;
	flex-direction: column;
}

label {
	font-size: 1.1rem;
	color: #333;
	margin-bottom: 5px;
	font-weight: bold;
}

input[type="text"] {
	padding: 12px;
	margin: 10px 0 20px;
	border-radius: 8px;
	border: 1px solid #ccc;
	font-size: 1rem;
	color: #333;
	outline: none;
	transition: border 0.3s ease;
}

input[type="text"]:focus {
	border-color: #0078d4;
}

input[type="submit"] {
	background-color: #0078d4;
	color: white;
	padding: 12px 25px;
	border: none;
	border-radius: 30px;
	cursor: pointer;
	font-size: 1.1rem;
	transition: all 0.3s ease;
	margin-top: 30px;
}

input[type="submit"]:hover {
	background-color: #005bb5;
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
/* Button Container */
.button-container {
	width: 100%;
	display: flex;
	justify-content: flex-end;
	margin-bottom: 20px;
}
/* Responsive Styling */
@media ( max-width : 768px) {
	.container {
		width: 90%;
		padding: 25px;
	}
	input[type="submit"] {
		width: 100%;
	}
}
</style>
</head>

<body>

	<div class="container">
		<div class="button-container">
			<form action="/taskManagementHelper/logoutUser" method="POST">
				<button class="logout-user" type="submit" class="logout-button">
					Logout</button>
			</form>
			<!-- Back to Project Button -->
			<a href="/taskManagementHelper/project?id=${param.projectId}">
				<button class="back-to-project">Back to Project</button>
			</a>
		</div>
		<h1>Create New Task</h1>
		<!-- Form for task creation -->
		<form action="/taskManagementHelper/addTask" method="POST">
			<label for="taskName">Task Name:</label> 
			<input type="text" id="taskName" name="taskName" required="required" placeholder="Enter task name" /> 
			<label for="taskDescription">Task Description:</label> 
			<input type="text" id="taskDescription" name="taskDescription" placeholder="Enter task description (optional)" />
			<label for="taskEstimation">Task Estimation(in Hours):</label> 
			<input type="number" id="taskEstimation" name="taskEstimation" required="required" value="0" min="0" step="0.1" placeholder="Enter task estimation in hours" /> 
			<input type="submit" value="Create New Task" /> 
			<input type="hidden" name="projectId" value="${param.projectId}" />
		</form>


	</div>

</body>

</html>
