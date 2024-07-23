<%@ page import="java.util.List" %>
<%@ page import="com.Transaction" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Recent Transactions</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 90%;
            max-width: 1000px;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        td[colspan="6"] {
            text-align: center;
            color: #888;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Recent Transactions</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Account Number</th>
                    <th>Transaction Type</th>
                    <th>Amount</th>
                    <th>Description</th>
                    <th>Transaction Date</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
                    if (transactions != null && !transactions.isEmpty()) {
                        for (Transaction transaction : transactions) {
                %>
                            <tr>
                                <td><%= transaction.getId() %></td>
                                <td><%= transaction.getAccountNumber() %></td>
                                <td><%= transaction.getTransactionType() %></td>
                                <td><%= transaction.getAmount() %></td>
                                <td><%= transaction.getDescription() %></td>
                                <td><%= transaction.getTransactionDate() %></td>
                            </tr>
                <% 
                        }
                    } else {
                %>
                        <tr>
                            <td colspan="6">No transactions found.</td>
                        </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
