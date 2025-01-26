<%--
  Created by IntelliJ IDEA.
  User: RedMark
  Date: 1/19/2025
  Time: 8:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Categories</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #e8f5e9; /* Light green background */
        }

        .manage-title {
            color: #388e3c; /* Green title color */
            font-weight: bold;
            margin-bottom: 20px;
        }

        .form-control {
            background-color: #f1f8e9; /* Light green form input background */
            border-color: #a5d6a7; /* Border color for inputs */
        }

        .form-control:focus {
            border-color: #388e3c;
            box-shadow: 0 0 5px #81c784;
        }

        .table thead {
            background-color: #388e3c;
            color: white;
        }

        .btn-primary {
            background-color: #388e3c; /* Green button background */
            border: none;
        }

        .btn-primary:hover {
            background-color: #2e7d32;
        }

        .back-btn {
            font-size: 24px;
            color: #388e3c; /* Green back button color */
            cursor: pointer;
            position: absolute;
            top: 2%;
            left: 2%;
        }

        .container {
            background: #ffffff; /* White container */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<a href="/E_Commerce_war_exploded/manageCustomers?message=" class="back-btn">&larr;</a>
<div class="container mt-4">

    <h2 class="manage-title text-center">Add Categories</h2>

    <!-- Form Inputs -->
    <div class="col-lg-8 mx-auto">
        <form action="/E_Commerce_war_exploded/saveCategories" method="post">
            <div class="mb-3">
                <label for="categoryName" class="form-label">Category Name</label>
                <input type="text" id="categoryName" name="categoryName" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Save Category</button>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
