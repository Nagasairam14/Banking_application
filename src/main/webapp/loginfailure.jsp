<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Failed</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }
        .failure-box {
            text-align: center;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        .failure-box h2 {
            margin-bottom: 20px;
            color: #ff0000;
        }
        .failure-box p {
            margin: 10px 0;
        }
        .failure-box a {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 3px;
            transition: background-color 0.3s;
        }
        .failure-box a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="failure-box">
        <h2>Login Failed</h2>
        <p>Invalid username or password. Please try again.</p>
        <p><a href="login.jsp">Back to Login</a></p>
    </div>
</body>
</html>
