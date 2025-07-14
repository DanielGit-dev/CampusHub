<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Merchandise Orders</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
            background-color: #f4f8fa;
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }

        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #ccc;
            text-align: left;
        }

        th {
            background-color: #d0eaff;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .back-link {
            text-align: center;
            margin-top: 25px;
        }

        .back-link a {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }

        .back-link a:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>

    <h2>Merchandise Orders from Students</h2>

    <%
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/CampusHub", "app", "app");

           String sql = "SELECT od.OrderDetail_ID, o.OrderID, u.UserID, u.Name AS FullName, u.Email, " +
             "m.Name AS ProductName, od.Unit_Price, od.Quantity, od.Subtotal, o.Order_date " +
             "FROM Order_Details od " +
             "JOIN Orders o ON od.OrderID = o.OrderID " +
             "JOIN Users u ON o.UserID = u.UserID " +
             "JOIN Merchandise m ON od.ItemID = m.ItemID " +
             "ORDER BY o.Order_date DESC";


            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            boolean hasData = false;
    %>
    <table>
        <tr>
            <th>Order ID</th>
            <th>Student ID</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Product</th>
            <th>Price (RM)</th>
            <th>Quantity</th>
            <th>Total (RM)</th>
            <th>Order Date</th>
        </tr>
    <%
            while (rs.next()) {
                hasData = true;
                double price = rs.getDouble("PRICE");
                int quantity = rs.getInt("QUANTITY");
                double total = price * quantity;
    %>
        <tr>
            <td><%= rs.getInt("ORDERID") %></td>
            <td><%= rs.getString("STUDENTID") %></td>
            <td><%= rs.getString("FULLNAME") %></td>
            <td><%= rs.getString("EMAIL") %></td>
            <td><%= rs.getString("PRODUCT_NAME") %></td>
            <td><%= String.format("%.2f", price) %></td>
            <td><%= quantity %></td>
            <td><%= String.format("%.2f", total) %></td>
            <td><%= rs.getDate("ORDER_DATE") %></td>
        </tr>
    <%
            }

            if (!hasData) {
    %>
        <tr>
            <td colspan="9" style="text-align:center;">No merchandise orders found.</td>
        </tr>
    <%
            }

            conn.close();
        } catch (Exception e) {
    %>
        <p style="color:red; text-align:center;">Error: <%= e.getMessage() %></p>
    <%
        }
    %>
    </table>

    <div class="back-link">
        <a href="club_dashboard.jsp">⬅ Back to Club Dashboard</a>
    </div>

</body>
</html>
