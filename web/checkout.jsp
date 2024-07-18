<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link rel="stylesheet" href="css/checkout.css">
</head>
<body>
    <header class="header">
        <div class="logo">
            <img src="image/logo.png" alt="Logo">
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
                        <li><a href="topups?action=list">Top-Ups</a></li>
                    <% } %>
                    <li><a href="logout.jsp">Logout</a></li>
                    <li><span>Halo, <%= user.getUsername() %></span></li>
                <% } %>
            </ul>
        </nav>
    </header>
    <main>
        <section class="payment">
            <h2>Checkout</h2>
            <div class="order-summary">
                <% 
                    User user = (User) session.getAttribute("user");
                    double amount = Double.parseDouble(request.getParameter("amount"));
                %>
                <p>Username: <%= user.getUsername() %></p>
                <p>Email: <%= user.getEmail() %></p>
                <p>Product Name: Steam Wallet IDR <%= amount %></p>
                <p>Price: IDR <%= amount %></p>
                <p>Payment Method: QRIS</p>
                <form action="topups?action=pay" method="post">
                    <input type="hidden" name="amount" value="<%= amount %>">
                    <input type="submit" value="Bayar">
                </form>
            </div>
        </section>
    </main>
</body>
</html>
