<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>CarGO - Add Cars</title>
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
        <h1 class="mb-0 title">Welcome to CarGO - Add Cars</h1>
    </div>
</header>

<div class="container mt-5">
    <h2>Add Car</h2>
    <form action="AddCarServlet" method="post">
        <div class="form-group">
            <label for="brand">Brand:</label>
            <input type="text" class="form-control" id="brand" name="brand" required>
        </div>
        <div class="form-group">
            <label for="model">Model:</label>
            <input type="text" class="form-control" id="model" name="model" required>
        </div>
        <div class="form-group">
            <label for="engine">Engine:</label>
            <input type="text" class="form-control" id="engine" name="engine" required>
        </div>
 		<div class="form-group">
            <label for="carType">Car Type:</label>
            <select class="form-control" id="carType" name="carType" required>
                <option value="Normal">Normal</option>
                <option value="Classy">Classy</option>
                <option value="Sport">Sport</option>
            </select>
        </div>
        <div class="form-group">
            <label for="fuelType">Fuel Type:</label>
            <select class="form-control" id="fuelType" name="fuelType" required>
                <option value="Petrol">Petrol</option>
                <option value="Diesel">Diesel</option>
                <option value="Hybrid">Hybrid</option>
                <option value="Electric">Electric</option>
            </select>
        </div>
        <div class="form-group">
            <label for="seats">Seats:</label>
            <input type="number" class="form-control" id="seats" name="seats" required>
        </div>
		<div class="form-group">
	            <label for="transmission">Transmission:</label>
	            <select class="form-control" id="transmission" name="transmission" required>
	                <option value="Automatic">Automatic</option>
	                <option value="Manual">Manual</option>
	            </select>
        </div>
        <div class="form-group">
            <label for="dailyPrice">Daily Price:</label>
            <input type="text" class="form-control" id="dailyPrice" name="dailyPrice" required>
        </div>
        <div class="form-group">
            <label for="imageUrl">Image URL:</label>
            <input type="text" class="form-control" id="imageUrl" name="imageUrl">
        </div>
        <button type="submit" class="btn btn-primary">Add Car</button>
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
