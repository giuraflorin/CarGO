<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin CarGO - Edit Car</title>
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
    </style>
</head>
<body>
<header class="bg-dark text-white py-3">
    <div class="container">
        <a href="admin-home.jsp"> 
            <img src="images/logo.jpg" alt="CarGO Logo" class="rounded-logo">
        </a>
        <h1 class="mb-0 title">Admin CarGO - Edit Car</h1>
    </div>
</header>
<div class="container">
    <h2>Edit Car</h2>

    <%
    String dbUrl = "jdbc:mysql://localhost:56148/cargo";
    String dbUsername = "root";
    String dbPassword = "password";

    if (request.getMethod().equalsIgnoreCase("post")) {
        int carId = Integer.parseInt(request.getParameter("carId"));
        String newBrand = request.getParameter("brand");
        String newModel = request.getParameter("model");
        String newEngine = request.getParameter("engine");
        String newCarType = request.getParameter("carType");
        String newFuelType = request.getParameter("fuelType");
        int newSeats = Integer.parseInt(request.getParameter("seats"));
        String newTransmission = request.getParameter("transmission");
        double newDailyPrice = Double.parseDouble(request.getParameter("dailyPrice"));
        String newImageUrl = request.getParameter("imageUrl");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
                 PreparedStatement statement = connection.prepareStatement("UPDATE cars SET brand=?, model=?, engine=?, carType=?, fuelType=?, seats=?, transmission=?, dailyPrice=?, imageUrl=? WHERE id=?")) {

                statement.setString(1, newBrand);
                statement.setString(2, newModel);
                statement.setString(3, newEngine);
                statement.setString(4, newCarType);
                statement.setString(5, newFuelType);
                statement.setInt(6, newSeats);
                statement.setString(7, newTransmission);
                statement.setDouble(8, newDailyPrice);
                statement.setString(9, newImageUrl);
                statement.setInt(10, carId);

                int rowsUpdated = statement.executeUpdate();

                if (rowsUpdated > 0) {
    %>
                    <p>Car updated successfully. Returning to <a href="manage-cars.jsp">Manage Cars</a>.</p>
                    <script>
                        setTimeout(function () {
                            window.location.href = 'manage-cars.jsp';
                        }, 2000);
                    </script>
    <%
                } else {
                    out.println("<p>Failed to update car.</p>");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<p>Error updating car information.</p>");
        }
    } else {
        int carId = Integer.parseInt(request.getParameter("carId"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
                 PreparedStatement statement = connection.prepareStatement("SELECT * FROM cars WHERE id = ?")) {

                statement.setInt(1, carId);
                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {
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
                    <form action="" method="post">
                        <input type="hidden" name="carId" value="<%= carId %>" />
                        <div class="form-group">
                            <label for="brand">Brand:</label>
                            <input type="text" class="form-control" id="brand" name="brand" value="<%= brand %>" required>
                        </div>
                        <div class="form-group">
                            <label for="model">Model:</label>
                            <input type="text" class="form-control" id="model" name="model" value="<%= model %>" required>
                        </div>
                        <div class="form-group">
                            <label for="engine">Engine:</label>
                            <input type="text" class="form-control" id="engine" name="engine" value="<%= engine %>" required>
                        </div>
                        <div class="form-group">
                            <label for="carType">Car Type:</label>
                            <input type="text" class="form-control" id="carType" name="carType" value="<%= carType %>" required>
                        </div>
                        <div class="form-group">
                            <label for="fuelType">Fuel Type:</label>
                            <input type="text" class="form-control" id="fuelType" name="fuelType" value="<%= fuelType %>" required>
                        </div>
                        <div class="form-group">
                            <label for="seats">Seats:</label>
                            <input type="number" class="form-control" id="seats" name="seats" value="<%= seats %>" required>
                        </div>
                        <div class="form-group">
                            <label for="transmission">Transmission:</label>
                            <input type="text" class="form-control" id="transmission" name="transmission" value="<%= transmission %>" required>
                        </div>
                        <div class="form-group">
                            <label for="dailyPrice">Daily Price:</label>
                            <input type="text" class="form-control" id="dailyPrice" name="dailyPrice" value="<%= dailyPrice %>" required>
                        </div>
                        <div class="form-group">
                            <label for="imageUrl">Image URL:</label>
                            <input type="text" class="form-control" id="imageUrl" name="imageUrl" value="<%= imageUrl %>" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Update Car</button>
                    </form>
    <%
                } else {
                    out.println("<p>Car not found.</p>");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<p>Error retrieving car information.</p>");
        }
    }
    %>
</div>

<footer class="footer mt-5">
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

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>
