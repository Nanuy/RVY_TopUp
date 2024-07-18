<%@page import="model.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Steam Wallet Top-Up</title>
    <link rel="stylesheet" href="css/index.css">
    <style>
        body {
            background-image: url('image/BackgroundSteam2.png');
            background-size: cover;
            background-position: center;
        }
    </style>
</head>
<body>
    <header>
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
                        <li><a href="topups?action=list">Top-Ups</a></li>
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
        <div class="container">
        <section class="banner">
            <img src="image/RvyNew.png" alt="Banner">
        </section>
        <section class="products">
            <h2>Buy Voucher Steam Wallet Code - IDR</h2>
            <div class="product-list">
                <div class="product-item">
                    <img src="image/CardSteam.jpg" alt="Steam 50K">
                    <p>IDR 50,000</p>
                    <% if (session.getAttribute("user") == null) { %>
                        <button onclick="location.href='login.jsp'">Buy Now</button>
                    <% } else { %>
                        <button onclick="location.href='topups?action=checkout&amount=50000'">Buy Now</button>
                    <% } %>
                </div>
                <div class="product-item">
                    <img src="image/CardSteam.jpg" alt="Steam 100K">
                    <p>IDR 100,000</p>
                    <% if (session.getAttribute("user") == null) { %>
                        <button onclick="location.href='login.jsp'">Buy Now</button>
                    <% } else { %>
                        <button onclick="location.href='topups?action=checkout&amount=100000'">Buy Now</button>
                    <% } %>
                </div>
                <div class="product-item">
                    <img src="image/CardSteam.jpg" alt="Steam 200K">
                    <p>IDR 200,000</p>
                    <% if (session.getAttribute("user") == null) { %>
                        <button onclick="location.href='login.jsp'">Buy Now</button>
                    <% } else { %>
                        <button onclick="location.href='topups?action=checkout&amount=200000'">Buy Now</button>
                    <% } %>
                </div>
                <div class="product-item">
                    <img src="image/CardSteam.jpg" alt="Steam 500K">
                    <p>IDR 500,000</p>
                    <% if (session.getAttribute("user") == null) { %>
                        <button onclick="location.href='login.jsp'">Buy Now</button>
                    <% } else { %>
                        <button onclick="location.href='topups?action=checkout&amount=500000'">Buy Now</button>
                    <% } %>
                </div>
                <div class="product-item">
                    <img src="image/CardSteam.jpg" alt="Steam 1.000K">
                    <p>IDR 1,000,000</p>
                    <% if (session.getAttribute("user") == null) { %>
                        <button onclick="location.href='login.jsp'">Buy Now</button>
                    <% } else { %>
                        <button onclick="location.href='topups?action=checkout&amount=1000000'">Buy Now</button>
                    <% } %>
                </div>
                <div class="product-item">
                    <img src="image/CardSteam.jpg" alt="Steam 1.250K">
                    <p>IDR 1,250,000</p>
                    <% if (session.getAttribute("user") == null) { %>
                        <button onclick="location.href='login.jsp'">Buy Now</button>
                    <% } else { %>
                        <button onclick="location.href='topups?action=checkout&amount=1250000'">Buy Now</button>
                    <% } %>
                </div>
                 <div class="product-item">
                    <img src="image/CardSteam.jpg" alt="Steam 1.500K">
                    <p>IDR 1,500,000</p>
                    <% if (session.getAttribute("user") == null) { %>
                        <button onclick="location.href='login.jsp'">Buy Now</button>
                    <% } else { %>
                        <button onclick="location.href='topups?action=checkout&amount=1500000'">Buy Now</button>
                    <% } %>
                </div>
                 <div class="product-item">
                    <img src="image/CardSteam.jpg" alt="Steam 1.750K">
                    <p>IDR 1,750,000</p>
                    <% if (session.getAttribute("user") == null) { %>
                        <button onclick="location.href='login.jsp'">Buy Now</button>
                    <% } else { %>
                        <button onclick="location.href='topups?action=checkout&amount=1750000'">Buy Now</button>
                    <% } %>
                </div>
            </div>
        </section>
        </div>
    </main>
    <footer>
        <div class="footer-content">
            <div class="footer-section about">
                <h3>About Us</h3>
                <p>RVY TopUp is a digital entertainment product sales platform that offers the most 
                    attractive prices and services for all customers.
                    The merchants and parties we cooperate with are all from trusted companies.</p>
            </div>
            <div class="footer-section links">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Login</a></li>
                    <li><a href="#">Register</a></li>
                </ul>
            </div>
            <div class="footer-section contact">
                <h3>Contact Us</h3>
                <p>Email: Yunanimam64@gmail.com</p>
                <p>Phone: +62 851 5632 6254</p>
            </div>
        </div>
        <div class="footer-bottom">
            &copy; 2023 M&M.com | Designed by RVY
        </div>
    </footer>
</body>
</html>
