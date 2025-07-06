<%@ page import="java.util.*, model.Order, dao.OrderDAO" %>
<%@ page session="true" %>
<%
    int userId = (int) session.getAttribute("userId");
    OrderDAO orderDAO = new OrderDAO();
    List<Order> orderList = orderDAO.getOrdersByUserId(userId);
%>
<html>
<head>
    <title>Your Orders</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f7fa;
            padding: 50px;
        }
        .order {
            background: white;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #2f3e9e;
        }
    </style>
</head>
<body>
<h2>Your Orders</h2>
<%
    for (Order order : orderList) {
%>
    <div class="order">
        <p><strong>Order ID:</strong> <%= order.getId() %></p>
        <p><strong>Date:</strong> <%= order.getDate() %></p>
        <p><strong>Total:</strong> RM <%= order.getTotal() %></p>
        <p><strong>Items:</strong></p>
        <ul>
        <%
            for (OrderDetail d : order.getDetails()) {
        %>
            <li><%= d.getMerchName() %> x <%= d.getQuantity() %> = RM <%= d.getSubtotal() %></li>
        <%
            }
        %>
        </ul>
    </div>
<%
    }
%>
</body>
</html>
