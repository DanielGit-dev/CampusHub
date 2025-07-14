<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%
    int itemId = Integer.parseInt(request.getParameter("itemId"));

    String name = "";
    double price = 0.0;
    int stock = 0;
    int clubId = 0;

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn = DriverManager.getConnection(
            "jdbc:derby://localhost:1527/CampusHub", "app", "app");

        String sql = "SELECT * FROM MERCHANDISE WHERE ITEMID=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, itemId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            name = rs.getString("NAME");
            price = rs.getDouble("PRICE");
            stock = rs.getInt("STOCK");
            clubId = rs.getInt("CLUBID");
        }

        conn.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error loading merchandise: " + e.getMessage() + "</p>");
    }
%>

<html>
<head>
    <title>Edit Merchandise</title>
    <style>
        form {
            border: 1px solid #ccc;
            padding: 20px;
            width: 400px;
            margin: 40px auto;
            background-color: #f7f7f7;
            border-radius: 10px;
        }
        label {
            font-weight: bold;
        }
        input {
            width: 100%;
            padding: 6px;
            margin: 6px 0 12px;
        }
        button {
            padding: 8px 16px;
            background-color: #4caf50;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        a {
            text-decoration: none;
            margin-left: 10px;
            color: #555;
        }
    </style>
</head>
<body>

    <h2 style="text-align: center;">Edit Merchandise Item</h2>

    <form action="EditMerchandiseServlet" method="post">
        <input type="hidden" name="itemId" value="<%= itemId %>">

        <label>Product Name:</label>
        <input type="text" name="productName" value="<%= name %>" required>

        <label>Price (RM):</label>
        <input type="number" step="0.01" name="price" value="<%= price %>" required>

        <label>Stock:</label>
        <input type="number" name="stock" value="<%= stock %>" required>

        <label>Club ID:</label>
        <input type="number" name="clubId" value="<%= clubId %>" required>

        <button type="submit">Update Merchandise</button>
        <a href="edit_merchandise.jsp">Cancel</a>
    </form>

</body>
</html>
