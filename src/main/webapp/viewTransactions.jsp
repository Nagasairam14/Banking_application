<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Transactions</title>
    <style>
        /* Include your existing styles here */
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: white;
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
        <h1>View Transactions</h1>
        <a href="adminDashboard.jsp" class="dashboard-button">Back to Dashboard</a>
    </div>
    <div class="container">
        <div class="dashboard-section">
            <h2>Transactions List</h2>
            <table>
                <thead>
                    <tr>
                        <th>Transaction ID</th>
                        <th>Account Number</th>
                        <th>Transaction Type</th>
                        <th>Amount</th>
                        <th>Date</th>
                        <th>Description</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Fetch transactions from the database and display them here --%>
                    <% 
                        // Example code to fetch transactions from a list or database
                        // Replace this with actual data fetching logic
                        List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
                        for (Transaction transaction : transactions) {
                    %>
                    <tr>
                        <td><%= transaction.getId() %></td>
                        <td><%= transaction.getAccountNumber() %></td>
                        <td><%= transaction.getType() %></td>
                        <td><%= transaction.getAmount() %></td>
                        <td><%= transaction.getDate() %></td>
                        <td><%= transaction.getDescription() %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <a href="adminDashboard.jsp" class="back-button">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
