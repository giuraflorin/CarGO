<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>CarGO - Add Reservation</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .rounded-logo {
            width: 150px; 
            height: 150px; 
            border-radius: 50%; 
            object-fit: cover; 
        }

        .header {
            background-color: #343a40;
            color: white;
            padding: 10px;
        }

        .search-box {
            float: right;
            margin-top: 10px;
        }

        .welcome-message {
            font-size: 24px;
            margin-top: 20px;
        }

        .user-name {
            font-size: 18px;
            font-weight: bold;
        }

        .car-info {
            border: 1px solid #ddd;
            padding: 10px;
            margin: 10px;
            display: inline-block;
        }

		.footer {
		    background-color: #343a40;
		    color: white;
		    padding: 10px;
		    margin-top: auto; 
		    width: 100%;
		}

        .footer-links {
            float: right;
            margin-top: 10px;
        }

        .footer-links a {
            color: white;
            text-decoration: none;
            margin-left: 10px;
        }
    </style>
</head>
<body>
<header class="bg-dark text-white py-3">
    <div class="container">
        <a href="admin-home.jsp"> 
            <img src="images/logo.jpg" alt="CarGO Logo" class="rounded-logo">
        </a>
        <h1 class="mb-0 title">Welcome to CarGO - Manage Reservations</h1>
    </div>
</header>
<div class="container mt-5">
    <h2>Add Reservation</h2>
    <form action="AddReservationServlet" method="post">
        <div class="form-group">
            <label for="userId">User ID:</label>
            <input type="text" class="form-control" id="userId" name="userId" required>
        </div>
        <div class="form-group">
            <label for="userEmail">User Email:</label>
            <input type="email" class="form-control" id="userEmail" name="userEmail" required>
        </div>
        <div class="form-group">
            <label for="carBrand">Car Brand:</label>
            <input type="text" class="form-control" id="carBrand" name="carBrand" required>
        </div>
        <div class="form-group">
            <label for="carModel">Car Model:</label>
            <input type="text" class="form-control" id="carModel" name="carModel" required>
        </div>
        <div class="form-group">
            <label for="carId">Car ID:</label>
            <input type="text" class="form-control" id="carId" name="carId" required>
        </div>
        <div class="form-group">
            <label for="airport">Airport:</label>
            <input type="text" class="form-control" id="airport" name="airport" required>
        </div>
        <div class="form-group">
            <label for="dropOff">Drop-off:</label>
            <input type="text" class="form-control" id="dropOff" name="dropOff" required>
        </div>
        <div class="form-group">
            <label for="validFrom">Valid From:</label>
            <input type="date" class="form-control" id="validFrom" name="validFrom" required>
        </div>
        <div class="form-group">
            <label for="validTo">Valid To:</label>
            <input type="date" class="form-control" id="validTo" name="validTo" required>
        </div>
        <div class="form-group">
            <label for="totalAmount">Total Amount:</label>
            <input type="text" class="form-control" id="totalAmount" name="totalAmount" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Reservation</button>
    </form>
</div>

<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <p>&copy; 2023 CarGO</p>
            </div>
            <div class="col-md-6 text-right footer-links">
                <a href="index.jsp">User Login</a>
                <a href="contact.jsp">Contact</a>
                <a href="about-us.jsp">About Us</a>
            </div>
        </div>
    </div>
</footer>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
