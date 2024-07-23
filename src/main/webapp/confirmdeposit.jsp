<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0;
        }
        .confirmation-container {
            text-align: center;
            padding: 30px;
            background-color: #fff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }
        .confirmation-container h2 {
            margin-bottom: 20px;
            font-size: 24px;
        }
        .confirmation-container p {
            font-size: 18px;
            margin-bottom: 20px;
        }
        .confirmation-container a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            color: #fff;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }
        .confirmation-container a:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="confirmation-container">
        <h2>Deposit Successful</h2>
        <p>Your deposit has been successfully processed.</p>
        <a href="dashboard.jsp">Go Back to Dashboard</a>
    </div>
</body>
</html>
