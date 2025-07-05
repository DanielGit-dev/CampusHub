<%-- 
    Document   : view_events
    Created on : Jun 28, 2025, 12:13:48 AM
    Author     : ASUS
--%>
<%@ page import="java.sql.*" %>
<%
    String clubIDStr = request.getParameter("clubID");
    int clubID = Integer.parseInt(clubIDStr);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Your Events</title>
</head>
<body>
    <h2>Events for Club ID: <%= clubID %></h2>
    <table border="1">
        <tr>
            <th>Event ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Date</th>
            <th>Capacity</th>
        </tr>
        <%
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection conn = DriverManager.getConnection(
                    "jdbc:derby://localhost:1527/CampusHub", "app", "app");

                String sql = "SELECT EventID, Title, Description, Date, Capacity FROM Events WHERE ClubID = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, clubID);

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int eventID = rs.getInt("EventID");
                    String title = rs.getString("Title");
                    String description = rs.getString("Description");
                    Date date = rs.getDate("Date");
                    int capacity = rs.getInt("Capacity");

                    out.println("<tr>");
                    out.println("<td>" + eventID + "</td>");
                    out.println("<td>" + title + "</td>");
                    out.println("<td>" + description + "</td>");
                    out.println("<td>" + date + "</td>");
                    out.println("<td>" + capacity + "</td>");
                    out.println("</tr>");
                }

                conn.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='5'>Error loading events.</td></tr>");
                e.printStackTrace();
            }
        %>
    </table>

    <br>
    <a href="clubManages.jsp">Back to Dashboard</a>
</body>
</html>

