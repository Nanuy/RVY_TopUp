<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="css/admin.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="image/logo.png" alt="Logo">
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="admin.jsp">Admin Dashboard</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>
    <h1>Admin Dashboard</h1>
            <h2><a href="users?action=list">Manage Users</a></h2>
            <h2><a href="topups?action=list">Manage Top-Ups</a></h2>
            <h2><a href="logout.jsp">Logout</a></h2>
</body>
</html>
