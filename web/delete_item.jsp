<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Delete Merchandise</title>
    <style>
        table, th, td { border: 1px solid black; border-collapse: collapse; padding: 8px; }
        th { background-color: #ffe0e0; }
        button { padding: 4px 8px; }
    </style>
</head>
<body>
    <h2>Delete Merchandise List</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Product Name</th>
            <th>Price (RM)</th>
            <th>Stock</th>
            <th>Club ID</th>
            <th>Delete</th>
        </tr>

        <%
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection conn = DriverManager.getConnection(
                    "jdbc:derby://localhost:1527/CampusHub", "app", "app");

                String sql = "SELECT * FROM MERCHANDISE";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);

                boolean hasData = false;
                while (rs.next()) {
                    hasData = true;
        %>
        <tr>
            <td><%= rs.getInt("ITEMID") %></td>
            <td><%= rs.getString("NAME") %></td>
            <td><%= rs.getDouble("PRICE") %></td>
            <td><%= rs.getInt("STOCK") %></td>
            <td><%= rs.getInt("CLUBID") %></td>
            <td>
                <form action="DeleteMerchandiseServlet" method="post" onsubmit="return confirm('Are you sure?');">
                    <input type="hidden" name="itemId" value="<%= rs.getInt("ITEMID") %>">
                    <button type="submit">Delete</button>
                </form>
            </td>
        </tr>
        <%
                }

                if (!hasData) {
        %>
        <tr><td colspan="6">No merchandise to delete.</td></tr>
        <%
                }

                conn.close();
            } catch (Exception e) {
        %>
        <tr><td colspan="6" style="color:red;">Error: <%= e.getMessage() %></td></tr>
        <%
            }
        %>
    </table>

    <br>
    <a href="merchandise.jsp">Back to Merchandise</a>
</body>
</html>
