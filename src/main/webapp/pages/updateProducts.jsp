<%--
  Created by IntelliJ IDEA.
  User: RedMark
  Date: 1/18/2025
  Time: 10:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Products</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #e8f5e9; /* Light green background */
        }

        .manage-title {
            color: #388e3c; /* Green for the title */
            font-weight: bold;
            margin-bottom: 20px;
        }

        .form-control, .form-select {
            background-color: #f1f8e9; /* Light green input background */
            border-color: #a5d6a7; /* Green border for inputs */
        }

        .form-control:focus, .form-select:focus {
            border-color: #388e3c;
            box-shadow: 0 0 5px #81c784; /* Green glow on focus */
        }

        .table thead {
            background-color: #388e3c; /* Green header background for tables */
            color: white;
        }

        .btn-primary {
            background-color: #388e3c; /* Green primary button */
            border: none;
        }

        .btn-primary:hover {
            background-color: #2e7d32; /* Darker green on hover */
        }

        .btn-success {
            background-color: #4caf50; /* Green success button */
            border: none;
        }

        .btn-success:hover {
            background-color: #388e3c; /* Match the green theme */
        }

        .back-btn {
            font-size: 24px;
            color: #388e3c; /* Green back button */
            cursor: pointer;
            position: absolute;
            top: 2%;
            left: 2%;
        }

        textarea {
            resize: none; /* Prevent textarea resizing */
        }
    </style>
</head>
<body>
<a href="/E_Commerce_war_exploded/manageCustomers?message=" class="back-btn">&larr;</a>
<div class="container mt-4">

    <h2 class="manage-title text-center">Update Products</h2>

    <!-- Form Inputs -->
    <div class="col-lg-8 mx-auto">
        <form class="d-flex mb-3">
            <input class="form-control me-2" type="search" placeholder="Search" id="search-input">
            <button class="btn btn-primary" id="search-button" type="button">Search</button>
        </form>
        <form action="/E_Commerce_war_exploded/updateProducts" method="post">
            <input class="form-control me-2" type="search" placeholder="Search" name="search" id="disable-search-input">
            <div class="mb-3">
                <label for="productName" class="form-label">Product Name</label>
                <input type="text" id="productName" name="productName" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea id="description" name="description" class="form-control" rows="3" required></textarea>
            </div>
            <div class="mb-3">
                <label for="quantity" class="form-label">Quantity</label>
                <input type="number" id="quantity" name="quantity" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="price" class="form-label">Price</label>
                <input type="number" id="price" name="price" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="categories" class="form-label">Category</label>
                <select id="categories" name="categories" class="form-select" required>
                    <option value="Food">Food</option>
                    <option value="Beverages">Beverages</option>
                    <option value="Electronics">Electronics</option>
                </select>
            </div>
            <button type="submit" class="btn btn-success">Update Product</button>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
    $('#disable-search-input').hide();
    $('#search-button').click(function() {
        const productId = $('#search-input').val();
        $.ajax({
            url: 'http://localhost:8080/E_Commerce_war_exploded/searchProducts?action=id&productsId=' + productId,
            type: 'GET',
            success: function(response) {
                $('#disable-search-input').val(response.productId);
                $('#productName').val(response.productName);
                $('#description').val(response.description);
                $('#quantity').val(response.quantity);
                $('#price').val(response.price);
                $('#categories').val(response.categories);
            }
        });
    });

    let loadDropDown = function () {
        $.ajax({
            url: 'http://localhost:8080/E_Commerce_war_exploded/getCategoryNames',
            type: 'GET',
            success: function(response) {
                console.log(response); // Check the response format
                const select = $('#categories');
                select.empty();
                $.each(response, function(index, value) {
                    $('<option>').val(value).text(value).appendTo(select);
                });
            }
        });
    };

    loadDropDown();
</script>
</body>
</html>
