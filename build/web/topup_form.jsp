<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Topup" %>
<!DOCTYPE html>
<html>
<head>
    <title>Top-Up Form</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <h1>Top-Up Form</h1>
    <form action="topups" method="post">
        <input type="hidden" name="id" value="<%= request.getAttribute("topup") != null ? ((Topup) request.getAttribute("topup")).getId() : "" %>">
        <label>User ID:</label>
        <input type="text" name="userId" value="<%= request.getAttribute("topup") != null ? ((Topup) request.getAttribute("topup")).getUserId() : "" %>"><br>
        <label>Amount:</label>
        <select name="amount">
            <option value="50">50</option>
            <option value="100">100</option>
            <option value="200">200</option>
            <option value="500">500</option>
            <option value="1000">1000</option>
        </select><br>
        <label>Payment Method:</label>
        <select name="paymentMethod">
            <option value="QRIS">QRIS</option>
        </select><br>
        <input type="submit" value="Save">
    </form>
</body>
</html>
