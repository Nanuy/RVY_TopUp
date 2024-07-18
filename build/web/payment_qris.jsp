<%@page import="model.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment QRIS</title>
    <link rel="stylesheet" href="css/paymen_qris.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="images/logo.png" alt="Logo">
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <% if (session.getAttribute("user") == null) { %>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="register.jsp">Register</a></li>
                <% } else { 
                    User user = (User) session.getAttribute("user");
                    if (user.getUsername().equals("admin")) { %>
                        <li><a href="admin.jsp">Admin Dashboard</a></li>
                    <% } else { %>
                    <% } %>
                    <li><a href="logout.jsp">Logout</a></li>
                    <li><span>Halo, <%= user.getUsername() %></span></li>
                <% } %>
            </ul>
        </nav>
    </header>
    <main>
        <section class="payment">
            <h2>Payment QRIS</h2>
            <p>Please scan the QR code below to make payment.</p>
            <div class="qris-code">
                <img src="image/QRIS.png" alt="QRIS Code">
            </div>
            <p>Nominal: IDR <%= request.getAttribute("amount") %></p>
            <p>After payment, please return to <a href="index.jsp">Home</a>.</p>
        </section>
    </main>
</body>
</html>
