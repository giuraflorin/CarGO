<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .rounded-logo {
            width: 150px; 
            height: 150px; 
            border-radius: 50%; 
            object-fit: cover; 
        }

        .title {
            display: inline-block;
            vertical-align: middle;
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

        .contact-container {
            margin-top: 20px;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 10px;
        }

        .contact-info {
            margin-top: 20px;
        }
        
         .contact-form {
            margin-top: 20px;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 10px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-group button {
            background-color: #3498db;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: #2980b9;
        }
         #map {
            height: 400px;
            margin-top: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
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

<div class="container mt-5">
        <h2>Contact Us</h2>
        <div class="contact-container">
            <div class="contact-info">
                <p><strong>CarGO Distribution S.A.</strong></p>
                <p><strong>Address:</strong> Splaiul Independentei nr 313</p>
                <p><strong>Email:</strong> info@cargo.com</p>
                <p><strong>Phone:</strong> +40770935654</p>
            </div>
            <div id="map"></div>
        </div>
    </div>

<div class="container mt-5">
	<div class="contact-form">
                <h3>Contact Form</h3>
                <form action="mailto:info@cargo.com" method="post" enctype="text/plain">
                    <div class="form-group">
                        <label for="userEmail">Your Email:</label>
                        <input type="text" id="userEmail" name="userEmail">
                    </div>
                    <div class="form-group">
                        <label for="subject">Subject:</label>
                        <input type="text" id="subject" name="subject">
                    </div>
                    <div class="form-group">
                        <label for="message">Message:</label>
                        <textarea id="message" name="message" rows="4"></textarea>
                    </div>
                    <div class="form-group">
                        <button type="submit">Send Email</button>
                    </div>
                </form>
            </div>
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB-pkbA7zU0_NmK-PHHRzytfZevp8sZyVk&callback=initMap" async defer></script>
<script>
        function initMap() {
            var myLatLng = {lat: 44.44234230678578, lng: 26.049830686358366};
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 15,
                center: myLatLng
            });
            var marker = new google.maps.Marker({
                position: myLatLng,
                map: map,
                title: 'CarGO Distribution S.A.'
            });
        }
    </script>
</body>
</html>
