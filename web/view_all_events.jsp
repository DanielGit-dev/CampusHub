<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Events</title>
</head>
<body>
    <h2>All Events</h2>
    <table border="1">
        <tr>
            <th>Event ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Date</th>
            <th>Capacity</th>
            <th>Club ID</th>
        </tr>
        <%
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection conn = DriverManager.getConnection(
                    "jdbc:derby://localhost:1527/CampusHub", "app", "app");

                String sql = "SELECT EventID, Title, Description, Date, Capacity, ClubID FROM Events";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);

                while (rs.next()) {
                    int eventID = rs.getInt("EventID");
                    String title = rs.getString("Title");
                    String description = rs.getString("Description");
                    Date date = rs.getDate("Date");
                    int capacity = rs.getInt("Capacity");
                    int clubID = rs.getInt("ClubID");

                    out.println("<tr>");
                    out.println("<td>" + eventID + "</td>");
                    out.println("<td>" + title + "</td>");
                    out.println("<td>" + description + "</td>");
                    out.println("<td>" + date + "</td>");
                    out.println("<td>" + capacity + "</td>");
                    out.println("<td>" + clubID + "</td>");
                    out.println("</tr>");
                }

                conn.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='6'>Error loading events.</td></tr>");
                e.printStackTrace();
            }
        %>
    </table>

    <br>
    <a href="admin_dashboard.jsp">Back to Admin Dashboard</a>
</body>
</html>
