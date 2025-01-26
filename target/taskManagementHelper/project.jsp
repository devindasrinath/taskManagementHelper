<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        /* Container for tasks */
        .project-container {
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

        h1 {
            text-align: left;
            color: #333;
            font-size: 2rem;
            margin-bottom: 20px;
        }

        /* Task list - force vertical stack */
        .task-list {
            list-style: none;
            padding: 0;
            margin: 0;
            display: block;  /* Explicitly set to block */
            margin-top: 40px;
        }

        /* Task item styles */
        .task-item {
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

        .task-item:hover {
            background-color: #f0f8ff;
            transform: translateY(-5px);
        }

        /* Button styles for creating and assigning tasks */
        .button-container {
            position: absolute;
            top: 20px;
            right: 110px;
            display: flex;
            flex-direction: row;
        }

        .btn {
            background-color: #0078d4;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 20px;  /* Adjusted to match the provided style */
            cursor: pointer;
            font-size: 1rem;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
            text-align: center;
            display: block;  /* To make sure it behaves like a button */
            text-decoration: none; /* Removed underline */
            margin-right: 10px; /* Add margin to the right of each button */
        }

        .btn:hover {
            background-color: #005bb5;
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

        .no-tasks-message {
            text-align: center;
            color: #888;
            font-size: 1.1rem;
            margin-top: 20px;
        }

    </style>
</head>
<body>
    <div class="project-container">
        <!-- Button Container (fixed to the top right of the white square container) -->
        <div class="button-container">
            <c:if test="${isAdmin == true}">
                <a href="/taskManagementHelper/createTask" class="btn">Create Task</a>
                <a href="/taskManagementHelper/assignProject" class="btn">Assign User</a>
            </c:if>
        </div>
        <form action="/taskManagementHelper/logoutUser" method="POST">
	        <button class="logout-user" type="submit" class="logout-button">
	            Logout
	        </button>
        </form>

        <h1>Your Tasks</h1>

        <!-- Task List -->
        <div class="task-list">
            <c:forEach items="${userTasks}" var="task">
                <a class="task-item" href="/taskManagementHelper/task?id=${task.getId()}" data-method="GET">
                    ${task.getName()}
                </a>
            </c:forEach>
        </div>

        <!-- Message when no tasks are available -->
        <c:if test="${userTasks == null || userTasks.isEmpty()}">
            <div class="no-tasks-message">No tasks for this project</div>
        </c:if>
    </div>
</body>
</html>
