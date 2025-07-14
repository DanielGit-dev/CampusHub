<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Event List</title>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 8px;
        }
        th {
            background-color: #e0f0ff;
        }
        button {
            padding: 4px 8px;
        }
    </style>
</head>
<body>

    <h2>Edit Event List</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Date</th>
            <th>Description</th>
            <th>Capacity</th>
            <th>Club ID</th>
            <th>Edit</th>
        </tr>

        <%
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection conn = DriverManager.getConnection(
                    "jdbc:derby://localhost:1527/CampusHub", "app", "app");

                String sql = "SELECT * FROM EVENTS";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);

                boolean hasData = false;
                while (rs.next()) {
                    hasData = true;
        %>
        <tr>
            <td><%= rs.getInt("EVENTID") %></td>
            <td><%= rs.getString("TITLE") %></td>
            <td><%= rs.getDate("DATE") %></td>
            <td><%= rs.getString("DESCRIPTION") %></td>
            <td><%= rs.getInt("CAPACITY") %></td>
            <td><%= rs.getInt("CLUBID") %></td>
            <td>
                <form action="edit_eventForm.jsp" method="get">
                    <input type="hidden" name="eventId" value="<%= rs.getInt("EVENTID") %>">
                    <button type="submit">Edit</button>
                </form>
            </td>
        </tr>
        <%
                }

                if (!hasData) {
        %>
        <tr><td colspan="8">No events available.</td></tr>
        <%
                }

                conn.close();
            } catch (Exception e) {
        %>
        <tr>
            <td colspan="8" style="color: red;">Error: <%= e.getMessage() %></td>
        </tr>
        <%
            }
        %>
    </table>

    <br>
    <a href="event.jsp">Back to Event Management</a>

</body>
</html>
