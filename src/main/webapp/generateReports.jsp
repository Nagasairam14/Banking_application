<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Reports</title>
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
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #007bff;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .form-group button {
            padding: 10px 20px;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            text-align: center;
            display: inline-block;
        }
        .form-group button:hover {
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
        <h1>Generate Reports</h1>
        <a href="adminDashboard.jsp" class="dashboard-button">Back to Dashboard</a>
    </div>
    <div class="container">
        <div class="dashboard-section">
            <h2>Select Report Type</h2>
            <form action="GenerateReportServlet" method="post">
                <div class="form-group">
                    <label for="reportType">Report Type</label>
                    <select name="reportType" id="reportType" required>
                        <option value="">Select a Report</option>
                        <option value="transactions">Transactions Report</option>
                        <option value="accounts">Accounts Report</option>
                        <!-- Add more report types as needed -->
                    </select>
                </div>
                <div class="form-group">
                    <label for="startDate">Start Date</label>
                    <input type="date" id="startDate" name="startDate" required>
                </div>
                <div class="form-group">
                    <label for="endDate">End Date</label>
                    <input type="date" id="endDate" name="endDate" required>
                </div>
                <div class="form-group">
                    <button type="submit">Generate Report</button>
                </div>
            </form>
            <a href="adminDashboard.jsp" class="back-button">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
