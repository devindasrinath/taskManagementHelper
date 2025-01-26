<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - Task Management Helper</title>
<!-- Styling -->
<style>
/* General Reset */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Arial', sans-serif;
	background:
		url('https://images.unsplash.com/photo-1517430816045-df4b7de11d1d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
		no-repeat center center fixed;
	background-size: cover;
	color: #fff;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	overflow: hidden;
}

.overlay {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.6); /* Dark overlay for contrast */
}

.container {
	position: relative;
	background: rgba(255, 255, 255, 0.9);
	/* Semi-transparent white background */
	border-radius: 10px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
	padding: 40px 30px;
	width: 90%;
	max-width: 400px;
	z-index: 1;
	text-align: center;
}

h1 {
	font-size: 1.8rem;
	margin-bottom: 20px;
	color: #0078d4;
}

label {
	font-size: 1rem;
	color: #333;
	margin-bottom: 10px;
	display: block;
	text-align: left;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 10px 15px;
	margin: 10px 0 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 1rem;
}

input[type="text"]:focus, input[type="password"]:focus {
	border-color: #0078d4;
	outline: none;
	box-shadow: 0 0 5px rgba(0, 120, 212, 0.5);
}

input[type="submit"] {
	background-color: #0078d4;
	color: #fff;
	border: none;
	padding: 10px 20px;
	font-size: 1rem;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
	background-color: #005bb5;
}

a {
	color: #0078d4;
	text-decoration: none;
	font-size: 0.9rem;
}

a:hover {
	text-decoration: underline;
}

p {
	margin-top: 20px;
	/* Adds vertical spacing between the form and the link */
	font-size: 0.9rem;
	color: #333;
}
</style>
</head>
<body>
	<div class="overlay"></div>
	<div class="container">
		<h1>Login</h1>
		<form action="/taskManagementHelper/loginUser" method="POST">
			<label for="userName">User Name:</label> <input type="text"
				name="userName" id="userName" required="required" /> <label
				for="password">Password:</label> <input type="password"
				name="password" id="password" required="required" /> <input
				type="submit" value="Login" />
		</form>
		<p>
			<a href="/taskManagementHelper/forgotPassword.jsp">Forgot
				Password?</a>
		</p>
	</div>
</body>
</html>
