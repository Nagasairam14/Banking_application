<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .dashboard-container {
            padding: 20px;
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            margin-top: 50px;
        }

        .dashboard-container h1 {
            text-align: center;
        }

        .dashboard-container p {
            font-size: 18px;
            line-height: 1.6;
        }

        .button-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .dashboard-button {
            width: 200px;
            padding: 10px;
            margin: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 4px;
            text-align: center;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
        }

        .dashboard-button:hover {
            background-color: #0056b3;
        }

        form label {
            display: block;
            margin-bottom: 5px;
            text-align: left;
        }

        form input[type="text"], form input[type="number"], form input[type="email"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        form button {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            border: none;
            border-radius: 4px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        form button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h1>Update Profile</h1>
        <form action="UpdateProfileServlet" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="${name != null ? name : ''}" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${email != null ? email : ''}" required>
            
            <label for="mobile">Mobile Number:</label>
            <input type="text" id="mobile" name="mobile" value="${mobile != null ? mobile : ''}" required>
            
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="${address != null ? address : ''}" required>
            
            <label for="aadhar">Aadhar Card Number:</label>
            <input type="text" id="aadhar" name="aadhar" value="${aadhar != null ? aadhar : ''}" required>
            
            <button type="submit" class="dashboard-button">Update</button>
        </form>
        <button class="dashboard-button" onclick="location.href='customerDashboard.jsp'">Back to Dashboard</button>
    </div>
</body>
</html>
