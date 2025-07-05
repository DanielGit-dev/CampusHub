<%-- 
    Document   : eventRegisteration
    Created on : Jun 27, 2025, 12:25:35 PM
    Author     : ASUS
--%>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Event Registration</title>
</head>
<body>
    <h2>Register for an Event</h2>
    <form action="EventRegistrationServlet" method="post">
        <label for="userID">User ID:</label><br>
        <input type="number" name="userID" id="userID" required><br><br>

        <label for="eventID">Choose Event:</label><br>
        <select name="eventID" id="eventID" required>
            <%
                try {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection conn = DriverManager.getConnection(
                        "jdbc:derby://localhost:1527/CampusHub", "app", "app");

                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT EventID, Title FROM Events");

                    while (rs.next()) {
                        int eventId = rs.getInt("EventID");
                        String title = rs.getString("Title");
                        out.println("<option value='" + eventId + "'>" + eventId + " - " + title + "</option>");
                    }

                    conn.close();
                } catch (Exception e) {
                    out.println("<option disabled>Error loading events</option>");
                }
            %>
        </select><br><br>

        <input type="submit" value="Register">
    </form>
</body>
</html>

