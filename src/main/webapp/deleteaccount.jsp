<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
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
        .account-container {
            width: 400px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        .account-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #007bff;
        }
        .account-container label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        .account-container input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        .account-container button,
        .account-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            border-radius: 3px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
        .account-container button:hover,
        .account-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .message {
            text-align: center;
            color: #ff0000;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="account-container">
        <h2>Delete Account</h2>
        <form action="DeleteAccountServlet" method="post">
            <label for="accountNumber">Account Number:</label>
            <input type="text" id="accountNumber" name="accountNumber" required><br>
            <input type="submit" value="Delete Account">
        </form>

        <!-- Display messages here -->
        <c:if test="${not empty requestScope.message}">
            <div class="message">
                <p>${requestScope.message}</p>
            </div>
        </c:if>
    </div>
</body>
</html>

