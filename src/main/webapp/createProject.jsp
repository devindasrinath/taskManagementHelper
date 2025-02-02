<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create New Project</title>
<style>
/* Global Styles */
body {
	font-family: 'Arial', sans-serif;
	background-color: #f4f7fb;
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
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	padding: 30px;
	width: 100%;
	max-width: 600px;
}

h1 {
	text-align: center;
	color: #0078d4;
	margin-bottom: 20px;
}

/* Form Styling */
form {
	display: flex;
	flex-direction: column;
}

label {
	font-size: 1rem;
	color: #333;
	margin-bottom: 5px;
	font-weight: bold;
}

input[type="text"] {
	padding: 12px;
	margin: 8px 0 15px;
	border-radius: 5px;
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
	padding: 12px 20px;
	border: none;
	border-radius: 25px;
	cursor: pointer;
	font-size: 1rem;
	transition: all 0.3s ease;
	margin-top: 15px;
}

input[type="submit"]:hover {
	background-color: #005bb5;
}

/* Button styles */
.button-container {
	width: 100%;
	display: flex;
	justify-content: flex-end;
	margin-bottom: 20px;
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

/* Responsive Styling */
@media ( max-width : 768px) {
	.container {
		width: 90%;
		padding: 20px;
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
				<button class="logout-user" type="submit">Logout</button>
			</form>
			<!-- Back to Projects button -->
			<a href="/taskManagementHelper/dashBoard">
				<button class="back-to-projects" type="submit">DashBoard</button>
			</a>
		</div>
		<h1>Create New Project</h1>
		<!-- Form for project creation -->
		<form action="/taskManagementHelper/addProject" method="POST">
			<label for="projectName">Project Name:</label> <input type="text"
				id="projectName" name="projectName" required="required"
				placeholder="Enter project name" /> <label for="projectDescription">Project
				Description:</label> <input type="text" id="projectDescription"
				name="projectDescription"
				placeholder="Enter project description (optional)" /> <input
				type="submit" value="Create New Project" />
		</form>


	</div>

</body>

</html>
