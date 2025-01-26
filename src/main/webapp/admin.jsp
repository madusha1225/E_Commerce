<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #e6f9e6; /* Light green background */
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-box {
            border: 2px solid #2e8b57; /* Dark green border */
            border-radius: 15px;
            padding: 30px;
            background-color: white;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .login-title {
            color: #2e8b57; /* Dark green */
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-control {
            background-color: #f0fff0; /* Very light green */
        }

        .login-btn {
            background-color: #2e8b57; /* Dark green */
            color: white;
            border: none;
            width: 100%;
        }

        .login-btn:hover {
            background-color: #256b47; /* Slightly darker green */
        }

        .back-btn {
            font-size: 24px;
            color: #2e8b57; /* Dark green */
            cursor: pointer;
        }

        .back {
            top: 2%;
            left: 2%;
        }
    </style>
</head>
<body>
<!-- Main Container -->
<div class="container">
    <div class="back d-flex justify-content-start mb-3 position-absolute">
        <a href="index.jsp" class="back-btn">&larr;</a>
    </div>

    <!-- Centered Login Box -->
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-4">
            <div class="login-box">
                <h2 class="login-title">Login</h2>
                <form action="/E_Commerce_war_exploded/admin" method="get">
                    <!-- Username Field -->
                    <div class="mb-3">
                        <label for="username" class="form-label">User Name</label>
                        <input type="text" class="form-control" id="username" placeholder="Enter your username" name="username">
                    </div>

                    <!-- Password Field -->
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" placeholder="Enter your password" name="password">
                    </div>

                    <!-- Login Button -->
                    <button type="submit" class="btn login-btn">Login</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
