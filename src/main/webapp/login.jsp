<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Login Selection</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-image: url('images/login.jpg'); /* Replace with your image path */
            background-size: cover; /* Ensures the image covers the entire background */
            background-position: center; /* Centers the background image */
            background-repeat: no-repeat; /* Prevents repeating the image */
            background-attachment: fixed; /* Keeps the background fixed while scrolling */
            color: #fff;
        }
        .selection-container {
            text-align: center;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.7); /* Transparent white background for the content */
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }
        .selection-container h2 {
            margin-bottom: 20px;
            font-size: 24px;
            background-color: #007bff; /* Background color for the header */
            color: #000; /* Text color */
            padding: 10px; /* Add padding to create space around the text */
            border-radius: 5px; /* Optional: Add rounded corners */
        }
        .selection-container button {
            width: 150px;
            padding: 10px;
            margin: 10px;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }
        .selection-container button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="selection-container">
        <h2>Select Login Type</h2>
        <form action="customerlogin.jsp" method="get" style="display:inline;">
            <button type="submit">Customer</button>
        </form>
        <form action="adminlogin.jsp" method="get" style="display:inline;">
            <button type="submit">Admin</button>
        </form>
    </div>
</body>
</html>
