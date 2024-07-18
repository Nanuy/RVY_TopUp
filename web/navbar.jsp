<%-- 
    Document   : navbar
    Created on : Jul 17, 2024, 7:24:07 PM
    Author     : IMAM
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/navbar.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>nav</title>
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
                        <li><a href="topups?action=list">Top-Ups</a></li>
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
    </body>
</html>
