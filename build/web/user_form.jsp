<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%
    User user = (User) request.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
    <link rel="stylesheet" href="css/user_form.css">
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
    <main>
        <div class="form-container">
        <section class="edit-user">
            <h2>User Form</h2>
            
            <form action="users?action=update" method="post">
                <input type="hidden" name="id" value="<%= user.getId() %>">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" value="<%= user.getUsername() %>" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="text" id="password" name="password" value="<%= user.getPassword() %>" required>
                </div>
                <div class="form-group">
                    <input class="btn" type="submit" value="Update">
                </div>
            </form>
        </section>
        </div>
    </main>
</body>
</html>
