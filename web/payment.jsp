<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment QRIS</title>
    <link rel="stylesheet" href="css/paymen_qris.css">
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
            <h2>Payment QRIS</h2>
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
                <div class="qris-code">
                    <img src="image/QRIS.png" alt="QRIS Code">
                </div>
                <form action="topups?action=confirmPayment" method="post">
                    <input type="hidden" name="amount" value="<%= amount %>">
                    <input type="submit" value="Sudah Bayar">
                </form>
            </div>
        </section>
    </main>
</body>
</html>
