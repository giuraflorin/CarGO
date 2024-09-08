<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin CarGO - Edit Reservation</title>
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
        <h1 class="mb-0 title">Admin CarGO - Manage Reservations</h1>
    </div>
</header>
<div class="container">
    <h2>Edit Reservation</h2>

    <%
    String dbUrl = "jdbc:mysql://localhost:56148/cargo";
    String dbUsername = "root";
    String dbPassword = "password";

    if (request.getMethod().equalsIgnoreCase("post")) {
        int reservationId = Integer.parseInt(request.getParameter("reservationId"));
        String userEmail = request.getParameter("userEmail");
        String carBrand = request.getParameter("carBrand");
        String carModel = request.getParameter("carModel");
        int carId = Integer.parseInt(request.getParameter("carId"));
        String airport = request.getParameter("airport");
        String dropOff = request.getParameter("dropOff");
        Date validFrom = Date.valueOf(request.getParameter("validFrom"));
        Date validTo = Date.valueOf(request.getParameter("validTo"));
        double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
                 PreparedStatement statement = connection.prepareStatement("UPDATE reservations SET userEmail=?, carBrand=?, carModel=?, carId=?, airport=?, dropOff=?, VALID_FROM_DTTM=?, VALID_TO_DTTM=?, totalAmount=? WHERE id=?")) {

                statement.setString(1, userEmail);
                statement.setString(2, carBrand);
                statement.setString(3, carModel);
                statement.setInt(4, carId);
                statement.setString(5, airport);
                statement.setString(6, dropOff);
                statement.setDate(7, validFrom);
                statement.setDate(8, validTo);
                statement.setDouble(9, totalAmount);
                statement.setInt(10, reservationId);

                int rowsUpdated = statement.executeUpdate();

                if (rowsUpdated > 0) {
    %>
                    <p>Reservation updated successfully. Returning to <a href="manage-reservations.jsp">Manage Reservations</a>.</p>
                    <script>
                        setTimeout(function () {
                            window.location.href = 'manage-reservations.jsp';
                        }, 2000);
                    </script>
    <%
                } else {
                    out.println("<p>Failed to update reservation.</p>");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<p>Error updating reservation information.</p>");
        }
    } else {
        int reservationId = Integer.parseInt(request.getParameter("reservationId"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
                 PreparedStatement statement = connection.prepareStatement("SELECT * FROM reservations WHERE id = ?")) {

                statement.setInt(1, reservationId);
                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    String userEmail = resultSet.getString("userEmail");
                    String carBrand = resultSet.getString("carBrand");
                    String carModel = resultSet.getString("carModel");
                    int carId = resultSet.getInt("carId");
                    String airport = resultSet.getString("airport");
                    String dropOff = resultSet.getString("dropOff");
                    Date validFrom = resultSet.getDate("VALID_FROM_DTTM");
                    Date validTo = resultSet.getDate("VALID_TO_DTTM");
                    double totalAmount = resultSet.getDouble("totalAmount");
    %>
                    <form action="" method="post">
                        <input type="hidden" name="reservationId" value="<%= reservationId %>" />
                        <div class="form-group">
                            <label for="userEmail">User Email:</label>
                            <input type="text" class="form-control" id="userEmail" name="userEmail" value="<%= userEmail %>" required>
                        </div>
                        <div class="form-group">
                            <label for="carBrand">Car Brand:</label>
                            <input type="text" class="form-control" id="carBrand" name="carBrand" value="<%= carBrand %>" required>
                        </div>
                        <div class="form-group">
                            <label for="carModel">Car Model:</label>
                            <input type="text" class="form-control" id="carModel" name="carModel" value="<%= carModel %>" required>
                        </div>
                        <div class="form-group">
                            <label for="carId">Car ID:</label>
                            <input type="text" class="form-control" id="carId" name="carId" value="<%= carId %>" required>
                        </div>
                        <div class="form-group">
                            <label for="airport">Airport:</label>
                            <input type="text" class="form-control" id="airport" name="airport" value="<%= airport %>" required>
                        </div>
                        <div class="form-group">
                            <label for="dropOff">Drop-off:</label>
                            <input type="text" class="form-control" id="dropOff" name="dropOff" value="<%= dropOff %>" required>
                        </div>
                        <div class="form-group">
                            <label for="validFrom">Valid From:</label>
                            <input type="date" class="form-control" id="validFrom" name="validFrom" value="<%= validFrom %>" required>
                        </div>
                        <div class="form-group">
                            <label for="validTo">Valid To:</label>
                            <input type="date" class="form-control" id="validTo" name="validTo" value="<%= validTo %>" required>
                        </div>
                        <div class="form-group">
                            <label for="totalAmount">Total Amount:</label>
                            <input type="text" class="form-control" id="totalAmount" name="totalAmount" value="<%= totalAmount %>" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Update Reservation</button>
                    </form>
    <%
                } else {
                    out.println("<p>Reservation not found.</p>");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<p>Error retrieving reservation information.</p>");
        }
    }
    %>
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

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>
