<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #e9f7e9;
        }

        .manage-title {
            color: #228b22;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .table th {
            background-color: #228b22;
            color: #fff;
        }

        .table td {
            background-color: #f0fff0;
        }

        .back-btn {
            font-size: 24px;
            color: #228b22;
            cursor: pointer;
            position: absolute;
            top: 2%;
            left: 2%;
        }

        .manage-btn {
            background-color: #32cd32;
            color: white;
        }

        .manage-btn:hover {
            background-color: #228b22;
        }

        .details-box {
            background-color: #d4edda;
            padding: 15px;
            border-radius: 5px;
        }

        .image-container img {
            max-width: 100%;
            border-radius: 5px;
            border: 2px solid #32cd32;
        }

        .input-group .form-control {
            border-color: #32cd32;
            background-color: #f9fff9;
        }

        .input-group .btn-outline-primary {
            color: #228b22;
            border-color: #228b22;
        }

        .input-group .btn-outline-primary:hover {
            background-color: #32cd32;
            color: white;
        }
    </style>
</head>
<body>
<a href="/E_Commerce_war_exploded/index" class="back-btn">&larr;</a>
<div class="container mt-5">
    <div class="row mb-4">
        <div class="col-12 text-center">
            <h1 class="manage-title">My Orders</h1>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col-12 text-end">
            <div class="input-group">
                <input type="number" class="form-control" placeholder="Order ID" aria-label="Order ID" id="search-input">
                <button class="btn btn-outline-primary" type="button" id="search-button">
                    search
                </button>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- Table Section -->
        <div class="col-lg-8">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Date</th>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody id="tblBody">
                <!-- Data Rows Here -->
                </tbody>
            </table>
        </div>

        <!-- Details Section -->
        <div class="col-lg-4" id="visible-div">
            <div class="details-box mb-3">
                <p id="order-id"><strong>Order ID:</strong> 001</p>
                <p id="customer-id"><strong>Customer ID:</strong> C123</p>
                <p id="date"><strong>Date:</strong> 2025-01-18</p>
                <p id="product-id"><strong>Product ID:</strong> P456</p>
                <p id="description"><strong>Description:</strong> High-quality smartphone</p>
                <p id="category"><strong>Category:</strong> Electronics</p>
                <p id="qty"><strong>Order Quantity:</strong> 1</p>
                <p id="total"><strong>Total Price:</strong> $200</p>
            </div>
            <div class="image-container text-center">
                <img alt="Product Image" id="img">
            </div>
        </div>
    </div>
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
            const orderId = row.find('td:first').text();

            if (orderId === search) {
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

    $("#visible-div").hide();

    function tblButtonClick(orderDetailsIndex , productDetailsIndex) {
        $.ajax({
            url : "http://localhost:8080/E_Commerce_war_exploded/loadOrders",
            method : "GET",
            data : {
                orderDetailsIndex : orderDetailsIndex,
                productDetailsIndex : productDetailsIndex
            },
            success : function(response) {
                $("#order-id").text('Order ID : ' + response.orderId);
                $("#customer-id").text('Customer ID : ' + response.customerId);
                $("#date").text('Date : ' + response.orderDate);
                $("#product-id").text('Product Name : ' + response.productName);
                $("#description").text('Description : ' + response.description);
                $("#category").text('Category : ' + response.category);
                $("#qty").text('Quantity : ' + response.quantity);
                $("#total").text('Order Total : ' + response.total);
                $('#img').attr('src', response.image);

                $("#visible-div").show();
            },
            error : function(xhr, status, error) {
                console.log("Error: " + error);
            }
        });
    }
</script>
</body>
</html>
