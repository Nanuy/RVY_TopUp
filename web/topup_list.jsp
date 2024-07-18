<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Topup" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Topup List</title>
    <link rel="stylesheet" href="css/topup_list.css">
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
        <section class="topup-list">
            <h2>Topup List</h2>
            <form action="topups" method="get">
                <input type="hidden" name="action" value="list">
                <input type="text" name="search" placeholder="Search by username...">
                <input type="date" name="filterDate" placeholder="Filter by date...">
                <input type="number" name="filterYear" placeholder="Filter by year...">
                <button type="submit">Search</button>
            </form>
            <table>
                <thead>
                    <tr>
                        <th><a href="topups?action=list&sort=id">ID</a></th>
                        <th><a href="topups?action=list&sort=user_id">User ID</a></th>
                        <th><a href="topups?action=list&sort=amount">Amount</a></th>
                        <th><a href="topups?action=list&sort=username">Username</a></th>
                        <th><a href="topups?action=list&sort=payment_method">Payment Method</a></th>
                        <th><a href="topups?action=list&sort=status">Status</a></th>
                        <th><a href="topups?action=list&sort=timestamp">Date</a></th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Topup> topupList = (List<Topup>) request.getAttribute("topupList");
                        for (Topup topup : topupList) {
                    %>
                    <tr>
                        <td><%= topup.getId() %></td>
                        <td><%= topup.getUserId() %></td>
                        <td><%= topup.getAmount() %></td>  
                        <td><%= topup.getUsername() %></td> <!-- Display username -->
                        <td><%= topup.getPaymentMethod() %></td>
                        <td><%= topup.getStatus() %></td>
                        <td><%= topup.getTimestamp() %></td>
                        <td>
                            <a href="topups?action=delete&id=<%= topup.getId() %>" class="delete" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>                                             
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </section>
    </main>
</body>
</html>
