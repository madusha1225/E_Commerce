<%@ page import="lk.ijse.ecommerce.dto.CategoriesDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: RedMark
  Date: 1/19/2025
  Time: 8:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Categories</title>
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

        .table th {
            background-color: #388e3c; /* Green table header */
            color: white;
        }

        .table td {
            background-color: #f1f8e9; /* Light green table cells */
        }

        .table {
            border: 1px solid #a5d6a7; /* Green table border */
        }

        .back-btn {
            font-size: 24px;
            color: #388e3c; /* Green back button */
            cursor: pointer;
            position: absolute;
            top: 2%;
            left: 2%;
        }

        .back-btn:hover {
            color: #2e7d32; /* Darker green on hover */
        }
    </style>
</head>
<body>
<a href="/E_Commerce_war_exploded/manageCustomers?message=" class="back-btn">&larr;</a>
<div class="container mt-5">
    <h2 class="manage-title text-center">View Categories</h2>

    <table class="table table-bordered text-center">
        <thead>
        <tr>
            <th>Category ID</th>
            <th>Category Name</th>
        </tr>
        </thead>
        <%
            List<CategoriesDTO> allCategories = (List<CategoriesDTO>) request.getAttribute("categories");
            if (allCategories != null && !allCategories.isEmpty()) {
        %>
        <tbody>
        <% for (CategoriesDTO categoriesDTO : allCategories) {%>
        <tr>
            <td><%=categoriesDTO.getCategoryId()%></td>
            <td><%=categoriesDTO.getCategoryName()%></td>
        </tr>
        <%}%>
        </tbody>
        <%
            }
        %>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
