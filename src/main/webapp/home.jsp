<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>CarGO - Your Reliable Car Service</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr@4.6.9/dist/flatpickr.min.css">
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
        display: flex;
        justify-content: space-between;
        align-items: center;
        display: flex;
    }

    .search-box {
        display: flex;
        align-items: center;
    }

    .search-box img {
        width: 50px;  
        height: 50px;  
        border-radius: 50%;
        margin-right: 10px;
    }

    .welcome-message {
        font-size: 24px;
        margin-top: 20px;
        opacity: 0;
        transform: translateY(-20px);
        animation: slideIn 1s ease-in-out forwards;
    }

    .user-name {
        font-size: 18px;
        font-weight: bold;
    }

    .filter-container {
        display: flex;
        justify-content: space-between;
    }

    .filter-container .form-group {
        flex: 1;
        margin-right: 10px;
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
    .welcome-container {
        display: flex;
        align-items: center;
        flex-direction: column;
    }

    @keyframes slideIn {
        0% {
            opacity: 0;
            transform: translateY(-20px);
        }
        100% {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .search-button {
        margin-top: 8px;
    }
    
    @keyframes fadeInLeft {
        0% {
            opacity: 0;
            transform: translateX(-20px);
        }
        100% {
            opacity: 1;
            transform: translateX(0);
        }
    }

    @keyframes fadeInRight {
        0% {
            opacity: 0;
            transform: translateX(20px);
        }
        100% {
            opacity: 1;
            transform: translateX(0);
        }
    }
    @keyframes slideInFromTop {
    0% {
        opacity: 0;
        transform: translateY(-20px);
    }
    100% {
        opacity: 1;
        transform: translateY(0);
    }
	}
	.filter-container {
	    display: flex;
	    justify-content: flex-start;
	    align-items: center;
	    margin-left: 10px; 
	    background-color: rgba(255, 255, 255, 100); 
	    padding: 10px; 
	    border-radius: 5px; 
	    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); 
	}
	.filter-container .form-group label,
	.filter-container .search-button {
	    font-weight: bold; 
	}
	
	.search-button {
	    padding: 10px 20px;
	    background-color: #28a745;
	    color: white;
	    border: none;
	    border-radius: 5px;
	    cursor: pointer;
	    transition: background-color 0.3s;
	}
	
	.search-button:hover {
	    background-color: #218838;
	}


</style>

</head>
<body>
<header class="bg-dark text-white py-3">
    <div class="container header">
        <div class="welcome-container">
            <a href="home.jsp"> 
                <img src="images/logo.jpg" alt="CarGO Logo" class="rounded-logo">
            </a>
            <p class="welcome-message">Welcome to <br> CarGO</p>
        </div>
        <div class="search-box">
            <a href="profile.jsp">
                <img src="images/profile-image.jpg" alt="Profile Image" class="rounded-logo">
            </a>
            <span id="welcome-message" class="user-name"></span>
        </div>
    </div>
</header>

   <div class="filter-container">
        <div class="form-group">
            <label for="carType">Car Type:</label>
            <select class="form-control" id="carType" name="carType">
                <option value="normal">Normal</option>
                <option value="classy">Classy</option>
                <option value="sport">Sport</option>
            </select>
        </div>
        <div class="form-group">
            <label for="fuelType">Fuel Type:</label>
            <select class="form-control" id="fuelType" name="fuelType">
                <option value="petrol">Petrol</option>
                <option value="diesel">Diesel</option>
                <option value="hybrid">Hybrid</option>
                <option value="electric">Electric</option>
            </select>
        </div>
        <div class="form-group">
            <label for="transmission">Transmission:</label>
            <select class="form-control" id="transmission" name="transmission">
                <option value="automatic">Automatic</option>
                <option value="manual">Manual</option>
            </select>
        </div>
        <div>
            <button class="btn btn-primary search-button" onclick="searchCars()">GO For Some Cars!</button>
        </div>
    </div>


            
<div>
 <p class="container mt-3 slideInFromTop" style="font-size: 24px; font-weight: bold; font-style: italic; text-align: center;">
    "The Best Car Rental Service - CarGO"
</p>
</div>

<div class="row mt-5">
    <div class="col-md-6 text-center float-left">
        <img src="images/gr86.jpg" alt="CarGO Recommendation" style="width: 100%; max-width: 600px; height: auto; border-radius: 10px; animation: fadeInLeft 1s;">
    </div>
    <div class="col-md-6 text-center float-right">
        <img src="images/supra.jpg" alt="Supra Image" style="width: 100%; max-width: 600px; height: auto; border-radius: 10px; animation: fadeInRight 1s;">
    </div>
</div>
<input type="hidden" name="userId" value="<%= request.getParameter("userId") %>">
<input type="hidden" name="userEmail" value="<%= request.getParameter("userEmail") %>">
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
<script src="https://cdn.jsdelivr.net/npm/flatpickr@4.6.9/dist/flatpickr.min.js"></script>

<script>
    $(document).ready(function() {
        $.get("HomeServlet", function(data) {
            $("#welcome-message").html(data);
        });
    });
</script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var welcomeMessage = document.querySelector('.slideInFromTop');
        welcomeMessage.style.animation = 'slideInFromTop 1s ease-in-out';
    });
</script>
<script>
    function searchCars() {
        var carType = document.getElementById('carType').value;
        var fuelType = document.getElementById('fuelType').value;
        var transmission = document.getElementById('transmission').value;
        window.location.href = "search.jsp?carType=" + carType + "&fuelType=" + fuelType + "&transmission=" + transmission;
    }
</script>

</body>
</html>
