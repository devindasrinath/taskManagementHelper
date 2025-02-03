<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About Us - Task Manager Tool</title>
<!-- Styling -->
<style>
/* Base styles */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Arial', sans-serif;
	background:
		url('https://images.unsplash.com/photo-1472289065668-ce650ac443d2?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
		no-repeat center center fixed;
	background-size: cover;
	position: relative;
	color: #fff;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	padding: 20px;
	overflow: hidden;
}

body::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5); /* Transparency for the background */
	z-index: 1; /* Place behind the content */
}

.container {
	position: relative;
	z-index: 2; /* Content stays above the background overlay */
	background: #ffffff; /* Solid color for container background */
	border: 1px solid #e0e0e0;
	padding: 40px;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	max-width: 800px;
	width: 100%;
	text-align: center;
}

h1 {
	font-size: 2.5rem;
	margin-bottom: 15px;
	color: #0078d4;
}

p {
	font-size: 1.2rem;
	margin: 15px 0;
	line-height: 1.6;
	color: #555;
}

.button-container {
	margin-top: 20px;
}

a {
	display: inline-block;
	margin: 10px;
	text-decoration: none;
	font-size: 1rem;
	color: #fff;
	background-color: #0078d4;
	border-radius: 5px;
	padding: 10px 20px;
	transition: all 0.3s ease;
}

a:hover {
	background-color: #005bb5;
}

footer {
	margin-top: 30px;
	font-size: 0.9rem;
	color: #888;
}
</style>
</head>
<body>
	<div class="container">
		<h1>About Us</h1>
		<p>Welcome to the Task Manager Tool! We are committed to helping
			you stay organized and efficient in managing your tasks.</p>
		<p>Our platform is designed to offer simplicity and productivity,
			ensuring you can focus on what matters most.</p>
		<p>Whether you're managing a personal project or coordinating a
			team, we provide the tools you need to achieve success effortlessly.</p>
		<div class="button-container">
			<a href="/taskManagementHelper/home.jsp">Home</a>
		</div>
		<footer> &copy; 2025 Task Manager Tool | Designed with care
			for productivity. </footer>
	</div>
</body>
</html>
