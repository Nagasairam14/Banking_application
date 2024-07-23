<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Account Balance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background: url('background.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        .container {
            max-width: 900px;
            width: 100%;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            text-align: center;
        }
        .container h2 {
            color: #007bff;
            margin-bottom: 20px;
        }
        .container label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            text-align: left;
        }
        .container input {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .container button {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
        .container button:hover {
            background-color: #0056b3;
        }
        .container .error {
            color: red;
            font-size: 1em;
            margin-top: 10px;
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
        }
        .back-button:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>View Account Balance</h2>
        <form action="ViewBalanceServlet" method="post">
            <label for="accountNumber">Account Number:</label>
            <input type="text" id="accountNumber" name="accountNumber" required>
            <button type="submit">Check Balance</button>
        </form>

        <% 
            // Fetch the response from the servlet
            String accountNumber = request.getParameter("accountNumber");
            if (accountNumber != null) {
                String fullName = request.getAttribute("fullName") != null ? (String) request.getAttribute("fullName") : "";
                Double balance = request.getAttribute("balance") != null ? (Double) request.getAttribute("balance") : null;

                if (fullName.isEmpty() && balance == null) {
                    out.println("<div class=\"error\">Account not found!</div>");
                } else {
                    out.println("<div>");
                    out.println("<h3>Account Balance</h3>");
                    out.println("<p>Account Number: " + accountNumber + "</p>");
                    out.println("<p>Account Holder: " + fullName + "</p>");
                    out.println("<p>Current Balance: $" + String.format("%.2f", balance) + "</p>");
                    out.println("</div>");
                }
            }
        %>

        <button class="back-button" onclick="location.href='customerdashboard.jsp'">Back to Dashboard</button>
    </div>
</body>
</html>
