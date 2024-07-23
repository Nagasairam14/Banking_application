<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            padding: 20px;
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            margin-top: 50px;
        }
        .container h1 {
            text-align: center;
        }
        .container form {
            display: flex;
            flex-direction: column;
        }
        .container form label {
            margin: 10px 0 5px;
        }
        .container form input, .container form textarea {
            padding: 10px;
            font-size: 16px;
            margin-bottom: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        .container form button {
            padding: 10px;
            font-size: 16px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .container form button:hover {
            background-color: #0056b3;
        }
        .container a {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #007BFF;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Deposit</h1>
        <form action="DepositServlet" method="post">
            <label for="accountNumber">Account Number:</label>
            <input type="text" id="accountNumber" name="accountNumber" required>

            <label for="amount">Amount:</label>
            <input type="number" id="amount" name="amount" step="0.01" required>

           

            <button type="submit">Deposit</button>
        </form>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
