<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Receipt</title>
    <link rel="stylesheet" href="css/receipt.css">
</head>
<body>
 <div class="receipt-container">
        <div class="receipt-header">
            <h1>Receipt</h1>
            <p>Thank you for your transaction!</p>
        </div>

    <main>  
        <div class="receipt-details">
            <div class="order-summary">
                 <div class="receipt-row">
                <% 
                    User user = (User) session.getAttribute("user");
                    double amount = Double.parseDouble(request.getParameter("amount"));
                %>
                </div>
                 <div class="receipt-row">
                <p>Username: <%= user.getUsername() %></p>
                </div>
                 <div class="receipt-row">
                <p>Email: <%= user.getEmail() %></p>
                </div>
                 <div class="receipt-row">
                <p>Product Name: Steam Wallet IDR <%= amount %></p>
                </div>
                 <div class="receipt-row">
                <p>Price: IDR <%= amount %></p>
                </div>
                 <div class="receipt-row">
                <p>Payment Method: QRIS</p>
                </div>
                 <div class="receipt-row">
                <p>Status: Completed</p>
                </div>
                <button>
                    <a href="index.jsp">
                       Home 
                     
                    </a>
                </button>
            </div>
        </div>

    </main>
        <div class="receipt-footer">
            <p>If you have any questions, please contact support.</p>
        </div>

 </div>
</body>
</html>
