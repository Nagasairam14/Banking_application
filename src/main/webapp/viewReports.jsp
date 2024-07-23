<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Reports</title>
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
        <h1>View Reports</h1>
        <a href="adminDashboard.jsp" class="dashboard-button">Back to Dashboard</a>
    </div>
    <div class="container">
        <div class="dashboard-section">
            <h2>Reports List</h2>
            <table>
                <thead>
                    <tr>
                        <th>Report ID</th>
                        <th>Report Type</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Generated On</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Fetch reports from the database and display them here --%>
                    <% 
                        // Example code to fetch reports from a list or database
                        // Replace this with actual data fetching logic
                        List<Report> reports = (List<Report>) request.getAttribute("reports");
                        for (Report report : reports) {
                    %>
                    <tr>
                        <td><%= report.getId() %></td>
                        <td><%= report.getType() %></td>
                        <td><%= report.getStartDate() %></td>
                        <td><%= report.getEndDate() %></td>
                        <td><%= report.getGeneratedOn() %></td>
                        <td>
                            <a href="<%= report.getDownloadLink() %>" class="dashboard-button">Download</a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <a href="adminDashboard.jsp" class="back-button">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
