<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%
    int eventId = Integer.parseInt(request.getParameter("eventId"));

    String title = "";
    String date = "";
    String description = "";
    int capacity = 0;
    int clubId = 0;

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn = DriverManager.getConnection(
            "jdbc:derby://localhost:1527/CampusHub", "app", "app");

        String sql = "SELECT * FROM EVENTS WHERE EVENTID = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, eventId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            title = rs.getString("TITLE");
            date = rs.getString("DATE");
            description = rs.getString("DESCRIPTION");
            capacity = rs.getInt("CAPACITY");
            clubId = rs.getInt("CLUBID");
        }

        conn.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error loading event: " + e.getMessage() + "</p>");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Event</title>
    <style>
        table {
            width: 50%;
            margin: 40px auto;
            border-collapse: collapse;
            background-color: #f9f9f9;
        }
        td {
            padding: 10px;
        }
        td:first-child {
            text-align: right;
            font-weight: bold;
            width: 40%;
        }
        td:last-child {
            text-align: left;
            width: 60%;
        }
        input, textarea {
            width: 100%;
            padding: 6px;
        }
        button {
            padding: 8px 16px;
            margin-top: 10px;
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
            margin-left: 15px;
            color: #555;
        }
    </style>
</head>
<body>

    <h2 style="text-align:center;">Edit Event</h2>

    <form action="EditEventServlet" method="post">
        <input type="hidden" name="eventId" value="<%= eventId %>">

        <table border="1">
            <tr>
                <td>Event Title:</td>
                <td><input type="text" name="title" value="<%= title %>" required></td>
            </tr>
            <tr>
                <td>Date:</td>
                <td><input type="date" name="date" value="<%= date %>" required></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td><textarea name="description" rows="4"><%= description %></textarea></td>
            </tr>
            <tr>
                <td>Capacity:</td>
                <td><input type="number" name="capacity" value="<%= capacity %>" required></td>
            </tr>
            <tr>
                <td>Club ID:</td>
                <td><input type="number" name="clubId" value="<%= clubId %>" required></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button type="submit">Update Event</button>
                    <a href="editEvent.jsp">Cancel</a>
                </td>
            </tr>
        </table>
    </form>

</body>
</html>
