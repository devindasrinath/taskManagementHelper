<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome to Task Management Helper</title>
<!-- Include CSS for styling -->
<style>
    /* General Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    body {
        font-family: 'Arial', sans-serif;
        background: url('https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') no-repeat center center fixed;
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
        text-align: center;
        background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent card */
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        padding: 30px 20px;
        max-width: 350px;
        width: 90%;
        z-index: 1;
    }
    h1 {
        font-size: 2rem;
        margin-bottom: 20px;
        color: #0078d4;
    }
    p {
        font-size: 1rem;
        margin-bottom: 20px;
        color: #555;
    }
    a {
        display: inline-block;
        margin: 10px 0;
        text-decoration: none;
        font-size: 1.1em;
        color: #fff;
        background-color: #0078d4;
        border-radius: 5px;
        padding: 10px 20px;
        transition: all 0.3s ease;
    }
    a:hover {
        background-color: #005bb5;
    }
</style>
</head>
<body>
    <div class="overlay"></div>
    <div class="container">
        <h1>Task Management Helper</h1>
        <p>Manage your tasks effortlessly with our tool.</p>
        <a href="/taskManagementHelper/login">Login</a>
        <a href="/taskManagementHelper/aboutUs">About Us</a>
    </div>
</body>
</html>
