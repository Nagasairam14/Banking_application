<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            background-image: url('images/costomerrlogin.jpg'); /* Add your background image path here */
            background-size: cover; /* Scale the image to cover the entire body */
            background-position: center; /* Center the image */
            background-repeat: no-repeat; /* Prevent the image from repeating */
            min-height: 100vh; /* Ensure the body takes up at least the full viewport height */
            display: flex;
            align-items: center; /* Center content vertically */
            justify-content: center; /* Center content horizontally */
        }
        .navbar {
            background-color: rgba(0, 123, 255, 0.8); /* Add opacity to the navbar background */
            color: #fff;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: absolute;
            top: 0;
            width: 100%;
            max-width: 1000px;
        }
        .navbar h1 {
            margin: 0;
        }
        .container {
            padding: 20px;
            max-width: 1000px;
            width: 100%;
            margin: 0 auto;
        }
        .dashboard-section {
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background */
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }
        .dashboard-section h2 {
            margin-top: 0;
            color: #007bff;
        }
        .button-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: center;
        }
        .dashboard-button {
            padding: 10px 20px;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
            display: inline-block;
            transition: background-color 0.3s;
        }
        .dashboard-button:hover {
            background-color: #0056b3;
        }
        .logout-button {
            width: 200px;
            padding: 10px;
            margin-top: 20px;
            background-color: #dc3545; /* Red color for the logout button */
            color: white;
            border: none;
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
        }
        .logout-button:hover {
            background-color: #c82333; /* Darker red for hover effect */
        }
    </style>
    <script>
        // Function to handle session expiration
        function sessionExpired() {
            alert('Your session has expired. Please log in again.');
            window.location.href = 'login.jsp'; // Redirect to login page
        }

        // Check for session expiration after page load
        window.onload = function() {
            // You can implement session checking logic here
            // For demonstration, we'll simply call sessionExpired on reload
            if (performance.navigation.type === 1) { // Check if the page is reloaded
                sessionExpired();
            }
        };

        // Logout and expire session
        function logout() {
            // Perform logout actions (e.g., invalidate session on server-side)
            alert('You have been logged out.');
            sessionExpired();
        }
    </script>
</head>
<body>
    <div class="navbar">
        <h1>Customer Dashboard</h1>
        <button class="logout-button" onclick="logout()">Logout</button>
    </div>
    <div class="container">
        <div class="dashboard-section">
            <h2>Account Options</h2>
            <div class="button-container">
                <a href="viewbalance.jsp" class="dashboard-button">View Balance</a>
                <a href="transfer.jsp" class="dashboard-button">Transfer Funds</a>
                <a href="deleteccount.jsp" class="dashboard-button">Close Account</a>
                <a href="changepassword.jsp" class="dashboard-button">Change Password</a>
               
            </div>
        </div>
    </div>
</body>
</html>
