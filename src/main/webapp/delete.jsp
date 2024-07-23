<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Account</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: url('background.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        .delete-container {
            width: 400px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        .delete-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #dc3545;
        }
        .delete-container label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        .delete-container input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        .delete-container button {
            width: 100%;
            padding: 10px;
            background-color: #dc3545;
            border: none;
            border-radius: 3px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
        .delete-container button:hover {
            background-color: #c82333;
        }
        .delete-container .error {
            color: red;
            font-size: 0.9em;
        }
        .delete-container .success {
            color: green;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <div class="delete-container">
        <h2>Delete Account</h2>
        <form action="DeleteAccountServlet" method="post">
            <label for="accountNumber">Account Number:</label>
            <input type="text" id="accountNumber" name="accountNumber" required>
            <span class="error"><%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %></span>
            <span class="success"><%= request.getAttribute("successMessage") != null ? request.getAttribute("successMessage") : "" %></span>
            <button type="submit">Delete Account</button>
        </form>
    </div>
</body>
</html>
