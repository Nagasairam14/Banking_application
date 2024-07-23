<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Account</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
        }
        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
        }
        h2 {
            color: #333333;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .form-control {
            border: 1px solid #ced4da;
            border-radius: 4px;
        }
        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }
        .alert {
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Edit Account</h2>

        <!-- Display success or error message -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">
                <c:out value="${errorMessage}"/>
            </div>
        </c:if>
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">
                <c:out value="${successMessage}"/>
            </div>
        </c:if>

        <form action="EditAccountServlet" method="post">
            <!-- Include hidden field to hold the account number -->
            <input type="hidden" name="accountNumber" value="${param.accountNumber}" />

            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" id="fullName" name="fullName" class="form-control" value="${param.fullName}" required />
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" class="form-control" value="${param.address}" required />
            </div>

            <div class="form-group">
                <label for="mobileNo">Mobile Number</label>
                <input type="text" id="mobileNo" name="mobileNo" class="form-control" value="${param.mobileNo}" required />
            </div>

            <div class="form-group">
                <label for="emailId">Email ID</label>
                <input type="email" id="emailId" name="emailId" class="form-control" value="${param.emailId}" required />
            </div>

            <div class="form-group">
                <label for="accountType">Account Type</label>
                <select id="accountType" name="accountType" class="form-control" required>
                    <option value="Savings" ${param.accountType == 'Savings' ? 'selected' : ''}>Savings</option>
                    <option value="Checking" ${param.accountType == 'Checking' ? 'selected' : ''}>Checking</option>
                    <!-- Add more account types as needed -->
                </select>
            </div>

            <div class="form-group">
                <label for="initialBalance">Initial Balance</label>
                <input type="number" id="initialBalance" name="initialBalance" class="form-control" step="0.01" value="${param.initialBalance}" required />
            </div>

            <div class="form-group">
                <label for="dateOfBirth">Date of Birth</label>
                <input type="date" id="dateOfBirth" name="dateOfBirth" class="form-control" value="${param.dateOfBirth}" required />
            </div>

            <div class="form-group">
                <label for="idProof">ID Proof</label>
                <input type="text" id="idProof" name="idProof" class="form-control" value="${param.idProof}" required />
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" class="form-control" value="${param.password}" required />
            </div>

            <button type="submit" class="btn btn-primary">Update Account</button>
        </form>

        <br>
        <a href="adminDashboard.jsp" class="btn btn-secondary">Back to Admin Dashboard</a>
    </div>

    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
