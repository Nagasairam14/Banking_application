<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>
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
        .account-container input[type="text"],
        .account-container input[type="password"],
        .account-container input[type="email"],
        .account-container input[type="date"],
        .account-container input[type="number"],
        .account-container select {
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
        .error {
            color: red;
            font-size: 0.875em;
            margin-top: -10px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="account-container">
        <h2>Create Account</h2>
        <form id="createAccountForm" action="CreateAccountServlet" method="post"> <!-- Ensure method is POST -->
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" required><br>
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required><br>
            <label for="mobileNo">Mobile No:</label>
            <input type="text" id="mobileNo" name="mobileNo" required><br>
            <label for="emailId">Email ID:</label>
            <input type="email" id="emailId" name="emailId" required><br>
            <label for="accountType">Account Type:</label>
            <select id="accountType" name="accountType" required>
                <option value="" disabled selected>Select Account Type</option>
                <option value="Savings">Savings</option>
                <option value="Current">Current</option>
            </select><br>
            <label for="initialBalance">Initial Balance:</label>
            <input type="number" id="initialBalance" name="initialBalance" min="1" step="1" required><br>
            <label for="dateOfBirth">Date of Birth:</label>
            <input type="date" id="dateOfBirth" name="dateOfBirth" required><br>
            <label for="idProof">ID Proof Type:</label>
            <select id="idProof" name="idProof" required>
                <option value="" disabled selected>Select ID Proof Type</option>
                <option value="Aadhar">Aadhar Number</option>
                <option value="Pancard">Pancard</option>
            </select><br>
            <input type="submit" value="Create Account">
        </form>
    </div>
    <script>
        document.getElementById('createAccountForm').addEventListener('submit', function(event) {
            const initialBalanceInput = document.getElementById('initialBalance');
            const initialBalance = initialBalanceInput.value;
            if (initialBalance <= 0 || !Number.isInteger(Number(initialBalance))) {
                event.preventDefault(); // Prevent the form from being submitted
                if (initialBalance <= 0) {
                    alert('Initial Balance must be greater than zero.');
                } else {
                    alert('Initial Balance must be an integer.');
                }
            }
        });
    </script>
</body>
</html>
