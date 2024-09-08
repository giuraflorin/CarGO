<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Results</title>
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

        .car-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

		.car-info {
		    border: 1px solid #ddd;
		    padding: 10px;
		    margin: 10px 0; 
		    width: 100%; 
		    text-align: center;
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
	
	    .car-image {
	        max-width: 100%;
	        max-height: 200px; 
	        margin-bottom: 10px;
	    }
    </style>
</head>
<body>
<header class="bg-dark text-white py-3">
    <div class="container">
        <a href="home.jsp"> 
            <img src="images/logo.jpg" alt="CarGO Logo" class="rounded-logo">
        </a>
        <h1 class="mb-0 title">Search Results</h1>
    </div>
</header>

<div class="container car-container">
    <% 
        String dbUrl = "jdbc:mysql://localhost:56148/cargo";
        String dbUsername = "root";
        String dbPassword = "password";
        String carType = request.getParameter("carType");
        String fuelType = request.getParameter("fuelType");
        String transmission = request.getParameter("transmission");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword)) {
                
                String sqlQuery = "SELECT * FROM cars WHERE 1=1";
                if (carType != null && !carType.isEmpty()) {
                    sqlQuery += " AND carType = ?";
                }
                if (fuelType != null && !fuelType.isEmpty()) {
                    sqlQuery += " AND fuelType = ?";
                }
                if (transmission != null && !transmission.isEmpty()) {
                    sqlQuery += " AND transmission = ?";
                }

                try (PreparedStatement statement = connection.prepareStatement(sqlQuery)) {
                    int parameterIndex = 1;
                    if (carType != null && !carType.isEmpty()) {
                        statement.setString(parameterIndex++, carType);
                    }
                    if (fuelType != null && !fuelType.isEmpty()) {
                        statement.setString(parameterIndex++, fuelType);
                    }
                    if (transmission != null && !transmission.isEmpty()) {
                        statement.setString(parameterIndex++, transmission);
                    }

                    try (ResultSet resultSet = statement.executeQuery()) {
                    	while (resultSet.next()) {
                    	    String brand = resultSet.getString("brand");
                    	    String model = resultSet.getString("model");
                    	    String engine = resultSet.getString("engine");
                    	    String fuelTypeResult = resultSet.getString("fuelType");
                    	    int seats = resultSet.getInt("seats");
                    	    double dailyPrice = resultSet.getDouble("dailyPrice");
                    	    String imageUrl = resultSet.getString("imageurl");
                    	    int carId = resultSet.getInt("id");  

                    	%>
                    	    <a href="car-reservation.jsp?carId=<%= carId %>">
                    	        <div class="car-info">
                    	            <img src="<%= imageUrl %>" alt="<%= brand %> Image" class="car-image">
                    	            <p><strong><%= brand %> <%= model %></strong></p>
                    	            <p><strong>Engine:</strong> <%= engine %></p>
                    	            <p><strong>Fuel Type:</strong> <%= fuelTypeResult %></p>
                    	            <p><strong>Seats:</strong> <%= seats %></p>
                    	            <p><strong>Daily Price:</strong> <%= dailyPrice %>$</p>
                    	        </div>
                    	    </a>
                    	<%
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<p>Error retrieving cars.</p>");
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
                <a href="admin-login.jsp">Admin Login</a>
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
