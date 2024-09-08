<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title> CarGO - Profile</title>
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
        
        .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
	    }
	
	    .welcome-message {
	        background-color: #007bff;
	        color: white;
	        padding: 10px;
	        border-radius: 5px;
	        margin-bottom: 20px;
	    }
	
	    .user-info {
	        margin-bottom: 20px;
	    }
	
	    table {
	        width: 100%;
	        border-collapse: collapse;
	        margin-bottom: 20px;
	    }
	
	    th, td {
	        border: 1px solid #ddd;
	        padding: 8px;
	        text-align: left;
	    }
	
	    th {
	        background-color: #007bff;
	        color: white;
	    }
	
	    tbody tr:nth-child(even) {
	        background-color: #f2f2f2;
	    }
    </style>
</head>
<body>
    <header class="bg-dark text-white py-3">
        <div class="container d-flex justify-content-between align-items-center">
            <a href="home.jsp"> 
                <img src="images/logo.jpg" alt="CarGO Logo" class="rounded-logo">
            </a>
            <h1 class="mb-0 title">CarGO - Profile</h1>
            <form action="index.jsp" method="post">
                <button type="submit" class="btn btn-danger">Sign Out</button>
            </form>
        </div>
    </header>
<%
    String username = (session.getAttribute("username") != null) ? (String) session.getAttribute("username") : null;

    String dbUrl = "jdbc:mysql://localhost:56148/cargo";
    String dbUsername = "root";
    String dbPassword = "password";

    int userId = 0;
    String userEmail = null;

    Connection connection = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        String userSql = "SELECT id, email FROM users WHERE username = ?";
        try (PreparedStatement userStatement = connection.prepareStatement(userSql)) {
            userStatement.setString(1, username);
            ResultSet userResultSet = userStatement.executeQuery();
            if (userResultSet.next()) {
                userId = userResultSet.getInt("id");
                userEmail = userResultSet.getString("email");
            }
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        out.println("<p>Error retrieving user information.</p>");
    }
%>


<div class="container">
<div class="welcome-message">
    <p>Welcome, <span class="user-name"><%= username %></span>! Your email: <%= userEmail %></p>
</div>

    <h2>Reservations</h2>
    <table class="table">
        <thead>
            <tr>
                <th>Car Brand</th>
                <th>Car Model</th>
                <th>Airport</th>
                <th>Drop-off</th>
                <th>Valid From</th>
                <th>Valid To</th>
                <th>Total Amount</th>
            </tr>
        </thead>
        <tbody>
 <%
                String reservationsSql = "SELECT carBrand, carModel, airport, dropOff, VALID_FROM_DTTM, VALID_TO_DTTM, totalAmount " +
                                        "FROM reservations WHERE userEmail = ?";
                try (PreparedStatement reservationsStatement = connection.prepareStatement(reservationsSql)) {
                    reservationsStatement.setString(1, userEmail);
                    ResultSet reservationsResultSet = reservationsStatement.executeQuery();
                    while (reservationsResultSet.next()) {
                        %>
                        <tr>
                            <td><%= reservationsResultSet.getString("carBrand") %></td>
                            <td><%= reservationsResultSet.getString("carModel") %></td>
                            <td><%= reservationsResultSet.getString("airport") %></td>
                            <td><%= reservationsResultSet.getString("dropOff") %></td>
                            <td><%= reservationsResultSet.getString("VALID_FROM_DTTM") %></td>
                            <td><%= reservationsResultSet.getString("VALID_TO_DTTM") %></td>
                            <td><%= reservationsResultSet.getString("totalAmount") %>$</td>

                        </tr>
                        <%
                    }
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



</body>
</html>
