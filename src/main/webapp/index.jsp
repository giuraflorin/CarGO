<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>CarGO - Your Reliable Car Service</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa; 
            color: #495057; 
        }

        .rounded-logo {
            width: 150px; 
            height: 150px; 
            border-radius: 50%; 
            object-fit: cover; 
        }

        .title {
            display: inline-block;
            vertical-align: middle;
            margin-left: 20px; 
        }

        .intro {
            opacity: 0.8;
            margin-bottom: 30px; 
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
            margin-top: 50px; 
        }

        .modal-body {
            opacity: 0.8;
        }
        .intro {
		    opacity: 0.8;
		    margin-bottom: 30px; 
		    animation: fadeInUp 1s ease-out; 
		}
		
		@keyframes fadeInUp {
		    from {
		        opacity: 0;
		        transform: translateY(20px); 
		    }
		    to {
		        opacity: 0.8;
		        transform: translateY(0);
		    }
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

    <div class="container">
        <div class="intro">
            <h3 style="font-style: italic;">Your Reliable Car Service</h3>
            <p>Welcome to CarGO, your one-stop solution for all your car service needs. We provide high-quality and efficient car services to keep you on the road.</p>
        </div>
        <h2 class="mb-4">Login</h2>
        <form action="LoginServlet" method="post">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary mt-3">Sign In</button>
            <p class="mt-3">Don't have an account yet? <a href="register.jsp">Create one here!</a>.</p>
            <c:if test="${not empty error}">
                <p class="error" style="color: red;">${error}</p>
            </c:if>
        </form>
    </div>

    <div class="modal fade" id="loginFailureModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Login Failed</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Invalid email or password. Please try again.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
