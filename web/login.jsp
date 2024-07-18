<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="css/login.css">
    <style>
        body {
            background-image: url('image/BackgroundSteam2.png');
            background-size: cover;
            background-position: center;
        }
    </style>
</head>
<body>
    <main>
        <div class="container" id="container">
            <div class="form-container sign-in-container">
                <section class="login">
                    <h1>Sign In</h1>
                    <% if (request.getAttribute("errorMessage") != null) { %>
                        <p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
                    <% } %>
                    <form action="users?action=login" method="post">
                        <div>
                            <input placeholder="Username" type="text" id="username" name="username" required>
                        </div>
                        <div>
                            <input placeholder="Password" type="password" id="password" name="password" required>
                        </div>
                        <div>
                            <input type="submit" value="Login" class="btn">
                        </div>
                    </form>
                    <div class="overlay-container">
                        <div class="overlay">
                            <div class="overlay-panel overlay-right">
                                <h1>Hello, Friend!</h1>
                                <p>Enter your personal details and start journey with us</p>
                                <button class="ghost" id="signUp"><a href="register.jsp">Sign Up</a></button>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </main>
</body>
</html>
