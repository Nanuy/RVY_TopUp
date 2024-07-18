<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="css/register.css">
    <style>
        body {
            background-image: url('image/BackgroundSteam2.png');
            background-size: cover;
            background-position: center;
        }
    </style>
</head>
<body>
    <div class="container" id="container">
        <div class="form-container sign-up-container">
            <form action="users?action=register" method="post">
                <h1>Sign Up</h1>
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
                <% } %>
                <div>
                    <input placeholder="Username" type="text" name="username" required><br>
                </div>
                <div>
                    <input placeholder="Email" type="email" name="email" required><br>
                </div>
                <div>
                    <input placeholder="Password" type="password" name="password" required><br>
                </div>
                <input class="btn" type="submit" value="Register">
            </form>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-right">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button class="ghost" id="signUp"><a href="login.jsp">Sign In</a></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
