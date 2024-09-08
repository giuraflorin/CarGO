<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>CarGO - Admin Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .rounded-logo {
            width: 150px; 
            height: 150px; 
            border-radius: 50%; 
            object-fit: cover; 
            }
        

        .admin-option {
            display: inline-block;
            margin: 20px;
            text-align: center;
        }

        .admin-option img {
            width: 100px;
            height: 100px;
            cursor: pointer;
        }

        .admin-option p {
            margin-top: 10px;
            font-size: 16px;
        }

 		.footer {
		    background-color: #343a40;
		    color: white;
		    padding: 10px;
		    margin-top: auto; 
		    width: 100%;
		}

        .footer-links a {
            color: white;
            text-decoration: none;
            margin-left: 10px;
        }
        
		.admin-container {
		    background-color: #f8f9fa; 
		    padding: 20px;
		    border-radius: 10px;
		    margin-top: 20px; 
		    text-align: center; 
		}
		
		.admin-option {
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    margin: 20px auto; 
		}
		
		.admin-option img {
		    width: 120px; 
		    height: 120px; 
		    object-fit: cover; 
		}
		
		.admin-option p {
		    margin-top: 10px;
		    font-size: 16px;
		}
        
    </style>
</head>
<body>
<header class="bg-dark text-white py-3">
    <div class="container">
        <a href="admin-home.jsp"> 
            <img src="images/logo.jpg" alt="CarGO Logo" class="rounded-logo">
        </a>
        <h1 class="mb-0 title">CarGO Admin</h1>
    </div>
</header>

<div class="container mt-4 admin-container">
    <div class="row">
        <div class="col-md-2 admin-option">
            <a href="manage-users.jsp">
                <img src="images/manage_users_icon.jpg" alt="Manage Users">
                <p>Manage Users</p>
            </a>
        </div>
        <div class="col-md-2 admin-option">
            <a href="manage-cars.jsp">
                <img src="images/manage_cars_icon.jpg" alt="Manage Cars">
                <p>Manage Cars</p>
            </a>
        </div>
        <div class="col-md-2 admin-option">
            <a href="manage-reservations.jsp">
                <img src="images/manage_reservations_icon.jpg" alt="Manage Reservations">
                <p>Manage Reservations</p>
            </a>
        </div>
    </div>
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
