<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
        }

        .rounded-logo {
            width: 150px; 
            height: 150px; 
            border-radius: 50%; 
            object-fit: cover; 
        }

        header {
            background-color: #343a40;
            color: white;
            padding: 20px;
            text-align: center;
        }

        header h1 {
            margin: 0;
        }

        .container {
            margin-top: 20px;
        }

        h2 {
            color: #343a40;
            border-bottom: 2px solid #343a40;
            padding-bottom: 5px;
        }

        .about-content {
            text-align: justify;
            color: #495057;
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
            <a href="index.jsp"> 
                <img src="images/logo.jpg" alt="CarGO Logo" class="rounded-logo">
            </a>
            <h1 class="mb-0 title">Welcome to CarGO</h1>
        </div>
    </header>

    <div class="container mt-5">
        <h2>About Us</h2>
        <div class="row">
            <div class="about-content">
                <p>Welcome to CarGO, where excellence meets convenience in the realm of automotive services. As your trusted car service provider, our mission goes beyond merely keeping you on the road; it's about elevating your driving experience to new heights.</p>

                <p>At CarGO, we take pride in delivering high-quality and efficient car services tailored to meet the diverse needs of our valued customers. Our team of skilled professionals is dedicated to ensuring that your vehicle not only runs smoothly but also performs at its optimal best.</p>

                <p>Whether you find yourself in need of routine maintenance, intricate repairs, or any other car-related service, rest assured that CarGO has you covered. Our commitment to excellence extends to every aspect of your vehicle's well-being, from engine diagnostics and brake services to tire rotations and beyond.</p>

                <p>We understand the significance of your time and the importance of a reliable vehicle in your daily life. That's why CarGO offers a seamless and hassle-free service experience, providing you with the peace of mind that comes with knowing your vehicle is in expert hands.</p>

                <p>Discover the difference of CarGO – where automotive excellence meets unparalleled customer service. Trust us to keep you on the road, ensuring every journey is a smooth and enjoyable ride. Your satisfaction is our priority, and your vehicle's performance is our commitment.</p>

                <p>Experience the next level of car service with CarGO – Your Journey, Our Expertise.</p>
            </div>
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

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
