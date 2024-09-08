<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
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
        form {
	    max-width: 600px;
	    margin: 0 auto;
	    padding: 20px;
	    border: 1px solid #ddd;
	    border-radius: 10px;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	    background-color: #fff;
		}
		
		form p {
		    margin: 10px 0;
		}
		
		form button {
		    background-color: #3498db;
		    color: #fff;
		    padding: 10px 20px;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    font-size: 16px;
		}
		
		form button:hover {
		    background-color: #2980b9;
		}
		
		form input[type="hidden"] {
		    display: none;
		}
        
    </style>
</head>
<body>
<header class="bg-dark text-white py-3">
    <div class="container">
        <a href="index.jsp"> 
            <img src="images/logo.jpg" alt="CarGO Logo" class="rounded-logo">
        </a>
        <h1 class="mb-0 title">Welcome to CarGO</h1>
    </div>
</header>

<body>
    

    <%
        int carId = (request.getParameter("carId") != null) ? Integer.parseInt(request.getParameter("carId")) : 0;
        String username = (session.getAttribute("username") != null) ? (String) session.getAttribute("username") : null;
        String carBrand = request.getParameter("carBrand");
        String carModel = request.getParameter("carModel");
        String airport = request.getParameter("airport");
        String dropOff = request.getParameter("dropOff");
        String validFrom = request.getParameter("departureDate");
        String validTo = request.getParameter("arrivalDate");
        double dailyPrice = (request.getParameter("dailyPrice") != null) ? Double.parseDouble(request.getParameter("dailyPrice")) : 0.0;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        Date fromDate = null;
        Date toDate = null;
        if (validFrom != null && validTo != null) {
            fromDate = dateFormat.parse(validFrom);
            toDate = dateFormat.parse(validTo);
        }

        String dbUrl = "jdbc:mysql://localhost:56148/cargo";
        String dbUsername = "root";
        String dbPassword = "password";

        String userEmail = null;
        int userId = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
                 PreparedStatement statement = connection.prepareStatement("SELECT * FROM users WHERE username = ?")) {

                statement.setString(1, username);
                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    userEmail = resultSet.getString("email");
                    userId = resultSet.getInt("id");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<p>Error retrieving user information.</p>");
        }

        double totalAmount = 0.0;
        long diffInDays = 0;

        if (fromDate != null && toDate != null && request.getParameter("dailyPrice") != null) {
            try {
                long diffInMillies = Math.abs(toDate.getTime() - fromDate.getTime());
                diffInDays = diffInMillies / (24 * 60 * 60 * 1000); 
                dailyPrice = Double.parseDouble(request.getParameter("dailyPrice"));

                if (!Double.isNaN(dailyPrice)) {
                    totalAmount = diffInDays * dailyPrice;
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                out.println("<p>Error parsing dailyPrice.</p>");
            }
        }
    %>

     <form action="ReservationServlet" method="post">
    <input type="hidden" name="userId" value="<%= userId %>">
    <input type="hidden" name="userEmail" value="<%= userEmail %>">
    <input type="hidden" name="carId" value="<%= carId %>">
    <input type="hidden" name="dailyPrice" value="<%= dailyPrice %>">
    <input type="hidden" name="validFrom" value="<%= validFrom %>">
    <input type="hidden" name="validTo" value="<%= validTo %>">
     <input type="hidden" name="totalAmount" value="<%= totalAmount %>">
      <input type="hidden" name="carBrand" value="<%= carBrand %>">
       <input type="hidden" name="carModel" value="<%= carModel %>">
        <input type="hidden" name="carId" value="<%= carId %>">
        <input type="hidden" name="airport" value="<%= airport %>">
        <input type="hidden" name="dropOff" value="<%= dropOff %>">
        <h2>Confirm Reservation</h2>

    <p>Username: <%= username %></p>
    <p>User Email: <%= userEmail %></p>
    <p>Car Brand: <%= carBrand %></p>
    <p>Car Model: <%= carModel %></p>
    <p>Airport: <%= airport %></p>
    <p>Drop-off: <%= dropOff %></p>
    <p>Valid From: <%= validFrom %></p>
    <p>Valid To: <%= validTo %></p>
    <p>Daily Price: <%= dailyPrice %></p>
    <p>Number of Days: <%= diffInDays %></p>
    <p>Total Amount: <%= totalAmount %>$</p>
     <button type="submit">Confirm Reservation</button>
    </form>

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
</body>
</html>
