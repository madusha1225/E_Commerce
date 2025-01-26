<%@ page import="lk.ijse.ecommerce.dto.UsersDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: RedMark
  Date: 1/16/2025
  Time: 7:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Products</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #e8f5e9; /* Light green background */
        }

        .text-green {
            color: #2e7d32; /* Dark green */
        }

        .navbar .dropdown-menu {
            border: none;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .navbar .dropdown-menu a {
            color: #2e7d32;
            font-weight: 500;
        }

        .navbar .dropdown-menu a:hover {
            background-color: #c8e6c9;
        }

        .navbar {
            border-bottom: #4caf50 solid 2px;
        }

        .form-control {
            background-color: #f1f8e9;
            border: 1px solid #4caf50;
        }

        .table thead {
            background-color: #4caf50;
            color: white;
        }

        .table td {
            background-color: #f9fbe7;
        }

        .form-container label {
            font-weight: bold;
        }

        .header {
            font-size: 2rem;
            font-weight: bold;
            color: #2e7d32;
            margin: 20px 0;
        }

        .search-container input {
            border: 1px solid #4caf50;
            border-radius: 20px;
            padding: 5px 15px;
            width: 250px;
            background-color: #f1f8e9;
        }

        .search-container button {
            border: none;
            background-color: #66bb6a;
            color: #fff;
            border-radius: 50%;
            padding: 8px 12px;
        }

        .search-container button:hover {
            background-color: #81c784;
        }

        .table th {
            background-color: #4caf50;
            color: #fff;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light px-4">
    <a class="navbar-brand text-green fw-bold" href="#">E-Commerce</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item">
                <a class="nav-link" href="manageCustomers?message=">View Customers</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/E_Commerce_war_exploded/viewOrders">View Orders</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="manageProductsDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Manage Products
                </a>
                <ul class="dropdown-menu" aria-labelledby="manageProductsDropdown">
                    <li><a class="dropdown-item" href="pages/saveProducts.jsp">Add Products</a></li>
                    <li><a class="dropdown-item" href="pages/deleteProducts.jsp">Delete Products</a></li>
                    <li><a class="dropdown-item" href="pages/updateProducts.jsp">Update Products</a></li>
                    <li><a class="dropdown-item" href="/E_Commerce_war_exploded/viewProducts">View Products</a></li>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="manageCategoriesDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Manage Categories
                </a>
                <ul class="dropdown-menu" aria-labelledby="manageCategoriesDropdown">
                    <li><a class="dropdown-item" href="pages/saveCategories.jsp">Add Categories</a></li>
                    <li><a class="dropdown-item" href="pages/deleteCategories.jsp">Delete Categories</a></li>
                    <li><a class="dropdown-item" href="pages/updateCategories.jsp">Update Categories</a></li>
                    <li><a class="dropdown-item" href="/E_Commerce_war_exploded/viewCategories">View Categories</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>

<div class="container mt-4">
    <!-- Header -->
    <h1 class="text-green text-center">View Customers</h1>
    <!-- Search Bar -->
    <div class="row mb-3">
        <div class="col-12 text-end">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Customer ID" aria-label="Customer ID" id="search-input">
                <button class="btn btn-outline-primary" type="button" id="search-button">
                    search
                </button>
            </div>
        </div>
    </div>

    <!-- Table -->
    <div class="table-responsive">
        <table class="table text-center">
            <thead>
            <tr>
                <th>Customer ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile Number</th>
                <th>User Name</th>
                <th>Password</th>
            </tr>
            </thead>
            <%
                List<UsersDTO> allCustomers = (List<UsersDTO>) request.getAttribute("customers");
                if (allCustomers != null && !allCustomers.isEmpty()) {
            %>
            <tbody id="tblBody">
            <% for (UsersDTO usersDTO : allCustomers) {%>
            <tr>
                <td><%=usersDTO.getUserId()%></td>
                <td><%=usersDTO.getName()%></td>
                <td><%=usersDTO.getEmail()%></td>
                <td><%=usersDTO.getTel()%></td>
                <td><%=usersDTO.getUserName()%></td>
                <td><%=usersDTO.getPassword()%></td>
            </tr>
            <%}%>
            </tbody>
            <%
                }
            %>
        </table>
    </div>

    <%
        String message = request.getParameter("message");

        if (!message.equals("") && !message.isEmpty() && message != null) {
    %>
    <script>
        alert("message : <%=message%>");
    </script>
    <% } %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
    $('#search-button').on('click', function() {
        const search = $('#search-input').val();
        const rows = $('#tblBody tr');

        let found = false;

        rows.each(function () {
            const row = $(this);
            const userId = row.find('td:first').text();

            if (userId === search) {
                row.show();
                found = true;
            } else {
                row.hide();
            }
        });

        if (!found) {
            alert('No matching record found!');
        }

    });
</script>
</body>
</html>
