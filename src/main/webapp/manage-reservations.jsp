<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin CarGO - Manage Reservations</title>
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
        <h1 class="mb-0 title">Admin CarGO - Manage Reservations</h1>
    </div>
</header>

<div class="container">
    <a href="add-reservation.jsp" class="btn btn-success">Add New Reservation</a>
    <h2>Manage Reservations</h2>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Reservation ID</th>
                <th>User ID</th>
                <th>User Email</th>
                <th>Car Brand</th>
                <th>Car Model</th>
                <th>Car ID</th>
                <th>Airport</th>
                <th>Drop-off</th>
                <th>Valid From</th>
                <th>Valid To</th>
                <th>Total Amount</th>
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
                     PreparedStatement statement = connection.prepareStatement("SELECT * FROM reservations");
                     ResultSet resultSet = statement.executeQuery()) {

                    while (resultSet.next()) {
                        int reservationId = resultSet.getInt("id");
                        int userId = resultSet.getInt("userId");
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
                    <tr>
                        <td><%= reservationId %></td>
                        <td><%= userId %></td>
                        <td><%= userEmail %></td>
                        <td><%= carBrand %></td>
                        <td><%= carModel %></td>
                        <td><%= carId %></td>
                        <td><%= airport %></td>
                        <td><%= dropOff %></td>
                        <td><%= validFrom %></td>
                        <td><%= validTo %></td>
                        <td><%= totalAmount %></td>
                        <td class="action-buttons">
                            <a href="edit-reservation.jsp?reservationId=<%= reservationId %>">Edit</a>
                            <a href="#" onclick="deleteReservation(<%= reservationId %>);">Delete</a>
                        </td>
                    </tr>
                    <%
                    }
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                out.println("<p>Error retrieving reservations.</p>");
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
    function deleteReservation(reservationId) {
        if (confirm('Are you sure you want to delete this reservation?')) {
            window.location.href = 'remove-reservation.jsp?reservationId=' + reservationId;
        }
    }
</script>
</body>
</html>
