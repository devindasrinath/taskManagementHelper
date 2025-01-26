<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assign Task</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        /* Form Container */
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px;
            text-align: center;
        }

        h1 {
            font-size: 1.8rem;
            color: #0078d4;
            margin-bottom: 20px;
        }

        p {
            font-size: 1rem;
            color: #555;
            margin-bottom: 20px;
        }

        /* Form Styles */
        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            color: #333;
            font-size: 1rem;
            text-align: left;
            margin-bottom: 5px;
        }

        input[type="text"] {
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 1rem;
            margin-bottom: 20px;
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
            border-radius: 25px;
            cursor: pointer;
            font-size: 1.1rem;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        input[type="submit"]:hover {
            background-color: #005bb5;
            transform: scale(1.03);
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

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
                width: 90%;
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
        <h1>Assign User</h1>
        <p>Assign a user to an existing task by entering the task and user IDs below.</p>
        <!-- Form for assigning task -->
        <form action="/taskManagementHelper/bindUserTask" method="POST">
            <label for="userId">User ID:</label>
            <input type="text" id="userId" name="userId" required="required" placeholder="Enter the User ID" />

            <input type="submit" value="Assign to Task" />
            <input type="hidden" name="taskId" value="${taskId}" />
        </form>
    </div>

</body>

</html>
