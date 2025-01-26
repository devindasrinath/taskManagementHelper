<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background: linear-gradient(135deg, #f5f7fa, #c3cfe2); /* Soft gradient background */
        color: #333;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 30px;
        margin: 0;
        min-height: 100vh; /* Use min-height instead of height */
        box-sizing: border-box; /* Include padding in height calculations */
    }
    .dashboard-container {
        display: flex;
        flex-direction: column;
        align-items: stretch; /* Ensure it stretches for all child content */
        width: 100%;
        max-width: 1200px;
        background-color: #ffffff; /* Light background for content */
        padding: 40px;
        border-radius: 12px;
        box-sizing: border-box; /* Include padding in width and height */
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        position: relative;
    }
    .h1 {
         text-align: left;
         color: #333;
         font-size: 2rem;
         margin-bottom: 20px;
     }
    .project-list {
        list-style: none;
        padding: 0;
        margin: 0;
        display: block;  /* Explicitly set to block */
        margin-top: 40px;
    }
    .project-item {
        background-color: #ffffff;
        padding: 15px;
        border-radius: 8px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        margin-bottom: 10px;
        text-align: left;
        text-decoration: none;
        color: #333;
        font-size: 1.2rem;
        transition: all 0.3s ease;
        display: block;  /* Ensure each task item is a block element */
    }
    .project-item:hover {
        background-color: #f0f8ff;
        transform: translateY(-5px);
    }
    .create-project {
        position: absolute;
        top: 20px;
        right: 115px;
        background: #0078d4;
        color: white;
        border: none;
        border-radius: 20px;
        padding: 10px 20px;
        cursor: pointer;
        font-size: 1rem;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        transition: all 0.3s ease;
    }
    .create-project:hover {
        background: #005bb5;
    }
    .logout-user {
        position: absolute;
        top: 20px;
        right: 20px;
        background: #d9534f;
        color: white;
        border: none;
        border-radius: 20px;
        padding: 10px 20px;
        cursor: pointer;
        font-size: 1rem;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        transition: all 0.3s ease;
    }
    .logout-user:hover {
        background: #c9302c;
    }
</style>
</head>
<body>
    <div class="dashboard-container">
     	<c:if test="${isAdmin == true}">
	        <button class="create-project" onclick="window.location.href='/taskManagementHelper/createProject'">
	            Create Project
	        </button>
        </c:if>
       <form action="/taskManagementHelper/logoutUser" method="POST">
              <button class="logout-user" type="submit" class="logout-button">
                  Logout
              </button>
        </form>
        <h1>Your Projects</h1>
        <div class="project-list">
            <c:forEach items="${userProjects}" var="project">
                <a class="project-item" 
                   href="/taskManagementHelper/project?id=${project.getId()}"
                   data-method="GET">
                   ${project.getName()}
                </a>
            </c:forEach>
        </div>
    </div>

    <!-- Script for random background colors -->
    <script>
        function getRandomColor() {
            const colors = ["#FFB6C1", "#D8BFD8", "#E0FFFF", "#F5F5DC", "#F5DEB3", "#D3D3D3", "#D1C4E9", "#FFEB3B"];
            return colors[Math.floor(Math.random() * colors.length)];
        }

        // Apply random colors to each project box
        document.addEventListener("DOMContentLoaded", () => {
            const projectItems = document.querySelectorAll('.project-item');
            projectItems.forEach(item => {
                item.style.backgroundColor = getRandomColor();
            });
        });
    </script>
</body>
</html>
