<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
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
            margin-top: 20px;
        }

        input[type="submit"]:hover {
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

        /* Responsive Styling */
        @media (max-width: 768px) {
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
        <form action="/taskManagementHelper/logoutUser" method="POST">
	        <button class="logout-user" type="submit" class="logout-button">
	            Logout
	        </button>
        </form>
        <h1>Create New Task</h1>
        <!-- Form for task creation -->
        <form action="/taskManagementHelper/addTask" method="POST">
            <label for="taskName">Task Name:</label>
            <input type="text" id="taskName" name="taskName" required="required" placeholder="Enter task name" />

            <label for="taskDescription">Task Description:</label>
            <input type="text" id="taskDescription" name="taskDescription" placeholder="Enter task description (optional)" />

            <input type="submit" value="Create New Task" />
            <input type="hidden" name="projectId" value="${projectId}" />
        </form>
    </div>

</body>

</html>
