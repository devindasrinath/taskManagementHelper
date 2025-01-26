<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            margin-bottom: 15px;
        }

        .task-details span {
            font-weight: bold;
            color: #555;
        }

        .task-description {
            margin-top: 15px;
            font-style: italic;
            color: #666;
        }

        /* Button Container */
        .button-container {
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

        .button-container:hover {
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

        /* Responsive Layout */
        @media (max-width: 768px) {
            .task-card {
                width: 95%;
                padding: 20px;
            }

            .button-container {
                padding: 10px 15px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>

<body>

    <div class="task-card">
        <c:if test="${isAdmin == true}">
            <div class="button-container">
                <a href="/taskManagementHelper/assignTask" class="btn" style="color: white; text-decoration: none;">Assign User</a>
            </div>
        </c:if>
        <form action="/taskManagementHelper/logoutUser" method="POST">
	        <button class="logout-user" type="submit" class="logout-button">
	            Logout
	        </button>
        </form>
        <h1>Task Details</h1>
        <!-- Task Details -->
        <div class="task-details">
            <p><span>ID:</span> ${task.id}</p>
            <p><span>Task Name:</span> ${task.name}</p>
            <p><span>Project ID:</span> ${task.projectId}</p>

            <!-- Task Description -->
            <c:if test="${task.description != null}">
                <p><span>Description:</span> ${task.description}</p>
            </c:if>
            <c:if test="${task.description == null}">
                <p><span>Description:</span> No description available</p>
            </c:if>
        </div>
    </div>

</body>

</html>
