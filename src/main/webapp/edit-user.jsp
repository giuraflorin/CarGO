<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin CarGO - Edit User</title>
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
    <h2>Edit User</h2>

    <%
    String dbUrl = "jdbc:mysql://localhost:56148/cargo";
    String dbUsername = "root";
    String dbPassword = "password";

    if (request.getMethod().equalsIgnoreCase("post")) {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String newUsername = request.getParameter("username");
        String newEmail = request.getParameter("email");
        String newPassword = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
                 PreparedStatement statement = connection.prepareStatement("UPDATE users SET username=?, email=?, password=? WHERE id=?")) {

                statement.setString(1, newUsername);
                statement.setString(2, newEmail);
                statement.setString(3, newPassword);
                statement.setInt(4, userId);

                int rowsUpdated = statement.executeUpdate();

                if (rowsUpdated > 0) {
    %>
                    <p>User updated successfully. Returning to <a href="manage-users.jsp">Manage Users</a>.</p>
                    <script>
                        setTimeout(function () {
                            window.location.href = 'manage-users.jsp';
                        }, 2000);
                    </script>
    <%
                } else {
                    out.println("<p>Failed to update user.</p>");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<p>Error updating user information.</p>");
        }
    } else {
        int userId = Integer.parseInt(request.getParameter("userId"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
                 PreparedStatement statement = connection.prepareStatement("SELECT * FROM users WHERE id = ?")) {

                statement.setInt(1, userId);
                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    String username = resultSet.getString("username");
                    String email = resultSet.getString("email");
                    String password = resultSet.getString("password");
    %>
                    <form action="" method="post">
                        <input type="hidden" name="userId" value="<%= userId %>" />
                        <div class="form-group">
                            <label for="username">Username:</label>
                            <input type="text" class="form-control" id="username" name="username" value="<%= username %>" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" class="form-control" id="email" name="email" value="<%= email %>" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input type="password" class="form-control" id="password" name="password" value="<%= password %>" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Update User</button>
                    </form>
    <%
                } else {
                    out.println("<p>User not found.</p>");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<p>Error retrieving user information.</p>");
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
