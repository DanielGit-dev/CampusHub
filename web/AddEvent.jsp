<%-- 
    Document   : Addevent
    Created on : Jun 28, 2025, 12:05:44 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Event</title>
</head>
<body>
    <h2>Create a New Event</h2>
    <form action="AddEventServlet" method="post">
        <label for="title">Title:</label><br>
        <input type="text" name="title" id="title" required><br><br>

        <label for="description">Description:</label><br>
        <textarea name="description" id="description" required></textarea><br><br>

        <label for="date">Date:</label><br>
        <input type="date" name="date" id="date" required><br><br>

        <label for="capacity">Capacity:</label><br>
        <input type="number" name="capacity" id="capacity" min="1" required><br><br>

        <label for="clubID">Select Your Club:</label><br>
        <select name="clubID" id="clubID" required>
            <%
                try {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection conn = DriverManager.getConnection(
                        "jdbc:derby://localhost:1527/event", "app", "app");

                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT ClubID, Club_Name FROM Clubs");

                    while (rs.next()) {
                        int clubID = rs.getInt("ClubID");
                        String clubName = rs.getString("Club_Name");
                        out.println("<option value='" + clubID + "'>" + clubID + " - " + clubName + "</option>");
                    }

                    conn.close();
                } catch (Exception e) {
                    out.println("<option disabled>Error loading clubs</option>");
                }
            %>
        </select><br><br>

        <input type="submit" value="Create Event">
    </form>
</body>
</html>

