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

.homepage {
	background-color: #ff5722f2;
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

.homepage:hover {
	background-color: #ff5722;
}

.login {
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

.login:hover {
	background-color: #218838;
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
			<a href="/taskManagementHelper/home">
				<button class="homepage" type="submit">HomePage</button>
			</a> <a href="/taskManagementHelper/login">
				<button class="login" type="submit">login</button>
			</a>
		</div>
		<h1>Create New User</h1>
		<!-- Form for project creation -->
		<form action="/taskManagementHelper/createUser" method="POST">
			<label for="userName">User Name:</label> 
			<input type="text"
				id="userName" name="userName" required="required"
				placeholder="Enter User Name" /> 
			<label for="password">password:</label>
			 <input type="text" id="password"
				name="password"
				placeholder="Enter Password" /> <input
				type="submit" value="Register" />
		</form>


	</div>

</body>

</html>
