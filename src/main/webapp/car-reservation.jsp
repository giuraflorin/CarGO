<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reserve Car</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
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
            border-radius: 15px; 
            overflow: hidden; 
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
            margin-top: 20px; 
        }

        .car-info {
		    border: 1px solid #ddd;
		    border-radius: 10px;
		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		    padding: 20px;
		    margin: 10px;
		    width: 40%;
		    text-align: left;
		    font-size: 18px;
		    background-color: #fff; 
		    transition: box-shadow 0.3s ease; 
		}
		
		.car-info:hover {
		    box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
		}
		
		.car-info p {
		    margin: 10px 0; 
		}
		
		.car-info strong {
		    color: #333; 
		}
		
		.car-info p:last-child {
		    margin-bottom: 0; 
		}
		
		.car-info p strong {
		    display: inline-block;
		    width: 120px; 
		}

        .car-image {
            max-width: 100%;
            border-radius: 15px; 
        }

        .container {
            margin-top: 20px;
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
            <a href="home.jsp"> 
                <img src="images/logo.jpg" alt="CarGO Logo" class="rounded-logo">
            </a>
            <h1 class="mb-0 title">Reserve Car</h1>
        </div>
    </header>
    <div class="container">
        <%
        String dbUrl = "jdbc:mysql://localhost:56148/cargo";
        String dbUsername = "root";
        String dbPassword = "password";

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
                    String fuelType = resultSet.getString("fuelType");
                    int seats = resultSet.getInt("seats");
                    double dailyPrice = resultSet.getDouble("dailyPrice");
                    String imageUrl = resultSet.getString("imageurl");

        %>
                    <div class="car-container">
                        <div class="car-info">
                            <p><strong><%= brand %> <%= model %></strong></p>
                            <p><strong>Engine:</strong> <%= engine %></p>
                            <p><strong>Fuel Type:</strong> <%= fuelType %></p>
                            <p><strong>Seats:</strong> <%= seats %></p>
                            <p><strong>Daily Price:</strong> <%= dailyPrice %>$</p>
                        </div>
                        <div class="car-info">
                            <img src="<%= imageUrl %>" alt="<%= brand %> Image" class="car-image">
                               <form action="confirm-reservation.jsp" method="post">
                                <input type="hidden" name="carId" value="<%= carId %>">
                                <input type="hidden" name="carBrand" value="<%= brand %>">
                                <input type="hidden" name="carModel" value="<%= model %>">
                                <input type="hidden" name="dailyPrice" value="<%= dailyPrice %>">
                                
                                
                                <div class="form-group">
                                    <label for="airportSearch" style="font-size: 14px;">Airport:</label>
									<select class="form-control" name="dropOff">
									    <option value="null">Select</option>
									    <option value="ARW">Arad (ARW)</option>
									    <option value="BCM">Bacău (BCM)</option>
									    <option value="BAY">Baia Mare (BAY)</option>
									    <option value="GHV">Brașov (GHV)</option>
									    <option value="BBU">Aeroportul Aurel Vlaicu, București (BBU)</option>
									    <option value="OTP">Aeroportul Henri Coandă, București (OTP)</option>
									    <option value="CSB">Caransebeș (CSB)</option>
									    <option value="CLJ">Cluj (CLJ)</option>
									    <option value="CND">Constanța (CND)</option>
									    <option value="CRA">Craiova (CRA)</option>
									    <option value="IAS">Iași (IAS)</option>
									    <option value="OMR">Oradea (OMR)</option>
									    <option value="SUJ">Satu Mare (SUJ)</option>
									    <option value="SBZ">Sibiu (SBZ)</option>
									    <option value="SCV">Suceava (SCV)</option>
									    <option value="TGM">Târgu Mureș (TGM)</option>
									    <option value="TSR">Timișoara (TSR)</option>
									    <option value="TCE">Tulcea (TCE)</option>
									    <option value="LRTZ">Tuzla (LRTZ)</option>
									</select>
									
								<div class="form-group">
								    <label for="airportSearch" style="font-size: 14px;">Drop-off:</label>
								    <select class="form-control" name="airport">
									    <option value="null">Select</option>
									    <option value="ARW">Arad (ARW)</option>
									    <option value="BCM">Bacău (BCM)</option>
									    <option value="BAY">Baia Mare (BAY)</option>
									    <option value="GHV">Brașov (GHV)</option>
									    <option value="BBU">Aeroportul Aurel Vlaicu, București (BBU)</option>
									    <option value="OTP">Aeroportul Henri Coandă, București (OTP)</option>
									    <option value="CSB">Caransebeș (CSB)</option>
									    <option value="CLJ">Cluj (CLJ)</option>
									    <option value="CND">Constanța (CND)</option>
									    <option value="CRA">Craiova (CRA)</option>
									    <option value="IAS">Iași (IAS)</option>
									    <option value="OMR">Oradea (OMR)</option>
									    <option value="SUJ">Satu Mare (SUJ)</option>
									    <option value="SBZ">Sibiu (SBZ)</option>
									    <option value="SCV">Suceava (SCV)</option>
									    <option value="TGM">Târgu Mureș (TGM)</option>
									    <option value="TSR">Timișoara (TSR)</option>
									    <option value="TCE">Tulcea (TCE)</option>
									    <option value="LRTZ">Tuzla (LRTZ)</option>
								    </select>
								</div>

                                </div>



                                <div class="form-group" style="display: flex;">
                                    <div style="flex: 1; margin-right: 10px;">
                                        <label for="departureDate">Departure Date:</label>
                                        <input type="text" class="form-control datepicker" name="departureDate" placeholder="date and time">
                                    </div>

                                    <div style="flex: 1; margin-right: 10px;">
                                        <label for="arrivalDate">Arrival Date:</label>
                                        <input type="text" class="form-control datepicker" name="arrivalDate" placeholder="date and time">
                                    </div>
                                </div>

                                <button type="submit" class="btn btn-primary">Reserve Now</button>
                            </form>
                        </div>
                    </div>
        <%
                } else {
                    out.println("<p>Car not found.</p>");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<p>Error retrieving car information.</p>");
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.datepicker').datepicker({
                format: 'yyyy-mm-dd',
                autoclose: true,
                todayHighlight: true
            });
        });
    </script>
</body>
</html>
