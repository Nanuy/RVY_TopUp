<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List</title>
    <link rel="stylesheet" href="css/user_list.css">
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
        <div class="container">
        <section class="user-list">
            <h1>User List</h1>
            <form action="users" method="get">
                <input type="hidden" name="action" value="list">
                <input type="text" name="search" placeholder="Search...">
                <button type="submit" class="btn edit-btn">Search</button>
            </form>
            <table>
                <thead>
                    <tr>
                        <th><a href="users?action=list&sort=id" class="atas">ID</a></th>
                        <th><a href="users?action=list&sort=username" class="atas">Username</a></th>
                        <th><a href="users?action=list&sort=email" class="atas">Email</a></th>
                        <th><a href="users?action=list&sort=status" class="atas">Status</a></th>
                        <th class="atas">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<User> userList = (List<User>) request.getAttribute("userList");
                        for (User user : userList) {
                    %>
                    <tr>
                        <td><%= user.getId() %></td>
                        <td><%= user.getUsername() %></td>
                        <td><%= user.getEmail() %></td>
                        <td><%= user.getStatus() %></td>
                        <td>
                            <a href="users?action=edit&id=<%= user.getId() %>" class="btn edit-btn">Edit</a>
                            <a href="users?action=delete&id=<%= user.getId() %>" class="btn delete-btn" onclick="return confirm('Are you sure?')">Deactivate</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </section>
       </div>
    </main>
</body>
</html>
