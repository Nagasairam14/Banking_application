<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .navbar {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar h1 {
            margin: 0;
        }
        .navbar a {
            color: #fff;
            text-decoration: none;
            padding: 10px;
            border-radius: 4px;
            background-color: #0056b3;
            transition: background-color 0.3s;
        }
        .navbar a:hover {
            background-color: #003d7a;
        }
        .container {
            padding: 20px;
            max-width: 1200px;
            width: 100%;
            margin: 0 auto;
        }
        .dashboard-section {
            background-color: #fff;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }
        .dashboard-section h2 {
            margin-top: 0;
            color: #007bff;
        }
        .dashboard-section .button-container {
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
        .back-button {
            width: 200px;
            padding: 10px;
            margin-top: 20px;
            background-color: #6c757d;
            color: white;
            border: none;
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
        }
        .back-button:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1>Bank Admin Dashboard</h1>
        
    </div>
    <div class="container">
        <div class="dashboard-section">
            <h2>Account Management</h2>
            <div class="button-container">
                <a href="createaccount.jsp" class="dashboard-button">Create Account</a>
                <a href="editaccount.jsp" class="dashboard-button">Edit Account</a>
                <a href="deposit.jsp" class="dashboard-button">Deposit</a>
                <a href="withdrawal.jsp" class="dashboard-button">Withdrawal</a>
                <a href="deleteAccount.jsp" class="dashboard-button">Delete Account</a>
            </div>
        </div>

        
        <div class="dashboard-section">
            <h2>Report Generation</h2>
            <div class="button-container">
                <a href="generateReports.jsp" class="dashboard-button">Generate Reports</a>
                <a href="viewReports.jsp" class="dashboard-button">View Reports</a>
            </div>
        </div>

        <a href="login.jsp" class="back-button">Back to Login</a>
    </div>
</body>
</html>
