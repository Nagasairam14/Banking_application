<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Account Created Successfully</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        margin: 0;
        padding: 20px;
        text-align: center;
    }
    .container {
        max-width: 600px;
        margin: auto;
        background: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    }
    h2 {
        margin-bottom: 20px;
    }
    p {
        font-size: 18px;
        margin-bottom: 20px;
    }
    button {
        background-color: #007bff;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.3s;
    }
    button:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }
</style>
</head>
<body>
<div class="container">
    <h2>Account Created Successfully</h2>
    <p>Your account has been successfully created.</p>
    <button onclick="redirectToHome()">Go to Home</button>
</div>

<script>
    function redirectToHome() {
        // Redirect to the home page or any other relevant page
        window.location.href = "index.html";
    }
</script>

</body>
</html>
