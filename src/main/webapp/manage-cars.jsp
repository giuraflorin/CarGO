<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin CarGO - Manage Cars</title>
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
        <h1 class="mb-0 title">Admin CarGO - Manage Cars</h1>
    </div>
</header>

<div class="container">
    <a href="add-cars.jsp" class="btn btn-success">Add New Car</a>

    <h2>Manage Cars</h2>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Brand</th>
                <th>Model</th>
                <th>Engine</th>
                <th>Car Type</th>
                <th>Fuel Type</th>
                <th>Seats</th>
                <th>Transmission</th>
                <th>Daily Price</th>
                <th>Image URL</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
            String dbUrl = "jdbc:mysql://localhost:56148/cargo";
            String dbUsername = "root";
            String dbPassword = "password";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
                     PreparedStatement statement = connection.prepareStatement("SELECT id, brand, model, engine, carType, fuelType, seats, transmission, dailyPrice, imageUrl FROM cars");
                     ResultSet resultSet = statement.executeQuery()) {

                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String brand = resultSet.getString("brand");
                        String model = resultSet.getString("model");
                        String engine = resultSet.getString("engine");
                        String carType = resultSet.getString("carType");
                        String fuelType = resultSet.getString("fuelType");
                        int seats = resultSet.getInt("seats");
                        String transmission = resultSet.getString("transmission");
                        double dailyPrice = resultSet.getDouble("dailyPrice");
                        String imageUrl = resultSet.getString("imageUrl");

                    %>
                    <tr>
                        <td><%= id %></td>
                        <td><%= brand %></td>
                        <td><%= model %></td>
                        <td><%= engine %></td>
                        <td><%= carType %></td>
                        <td><%= fuelType %></td>
                        <td><%= seats %></td>
                        <td><%= transmission %></td>
                        <td><%= dailyPrice %></td>
                        <td><%= imageUrl %></td>
                        <td class="action-buttons">
                            <a href="edit-car.jsp?carId=<%= id %>">Edit</a>
                            <a href="#" onclick="deleteCar(<%= id %>);">Delete</a>
                        </td>
                    </tr>
                    <%
                    }
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                out.println("<p>Error retrieving cars.</p>");
            }
            %>
        </tbody>
    </table>
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
<script>
    function deleteCar(carId) {
        if (confirm('Are you sure you want to delete this car?')) {
            window.location.href = 'remove-car.jsp?carId=' + carId;
        }
    }
</script>
</body>
</html>
