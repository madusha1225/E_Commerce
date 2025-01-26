<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommerce.dto.ProductsDTO" %><%--
  Created by IntelliJ IDEA.
  User: RedMark
  Date: 1/18/2025
  Time: 10:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Products</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #e8f5e9; /* Light green background */
        }

        .manage-title {
            color: #388e3c; /* Green for title */
            font-weight: bold;
            margin-bottom: 20px;
        }

        .table th {
            background-color: #388e3c; /* Green header */
            color: white;
        }

        .table td {
            background-color: #f1f8e9; /* Light green table cells */
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

        .product-card {
            border: 2px solid #a5d6a7; /* Green border */
            border-radius: 10px;
            padding: 15px;
            background-color: #f1f8e9; /* Light green background for cards */
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        }

        .product-card:hover {
            transform: scale(1.05);
            box-shadow: 0px 8px 12px rgba(0, 0, 0, 0.2);
        }

        .product-card img {
            width: 100%;
            border-radius: 10px;
            border: 2px solid #a5d6a7; /* Green border for images */
        }

        .product-card p {
            color: #388e3c; /* Green text for product details */
        }

        .price {
            font-weight: bold;
            font-size: 1.2rem;
            color: #2e7d32; /* Dark green for price */
        }
    </style>
</head>
<body>
<a href="/E_Commerce_war_exploded/manageCustomers?message=" class="back-btn">&larr;</a>

<div class="container mt-5">
    <h2 class="manage-title text-center">View Products</h2>
    <%
        List<ProductsDTO> allProducts = (List<ProductsDTO>) request.getAttribute("products");
        if (allProducts != null && !allProducts.isEmpty()) {
    %>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <% for (ProductsDTO productsDTO : allProducts) {%>
        <div class="col">
            <div class="product-card">
                <img src="<%=productsDTO.getImage()%>" alt="Product Image">
                <p><strong>Product ID : </strong><%=productsDTO.getProductId()%></p>
                <p><strong>Product Name : </strong><%=productsDTO.getProductName()%></p>
                <p><strong>Description : </strong><%=productsDTO.getDescription()%></p>
                <p><strong>Quantity : </strong><%=productsDTO.getQuantity()%></p>
                <p class="price"><strong>Price : </strong>RS. <%=productsDTO.getPrice()%></p>
                <p><strong>Category : </strong><%=productsDTO.getCategories().getCategoryName()%></p>
            </div>
        </div>
        <%}%>
    </div>
    <%
        }
    %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
