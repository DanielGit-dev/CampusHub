<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Event</title>
    <link rel="stylesheet" href="css/AddEvent_style.css">

</head>
<body>
    <div class="form-container">
        <h2>Create a New Event</h2>
        
    <form action="AddEventServlet" method="post" enctype="multipart/form-data">
        <label for="title">Title:</label><br>
        <input type="text" name="title" id="title" required><br>

        <label for="description">Description:</label><br>
        <textarea name="description" id="description" rows="4" required></textarea><br>

        <label for="date">Date:</label><br>
        <input type="date" name="date" id="date" required><br>

        <label for="capacity">Capacity:</label><br>
        <input type="number" name="capacity" id="capacity" min="1" required><br>

        <label for="clubID">Select Your Club:</label><br>
        <select name="clubID" id="clubID" required>
            <option value="">-- Select Club --</option>
            <%
                try {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection conn = DriverManager.getConnection(
                        "jdbc:derby://localhost:1527/CampusHub", "app", "app");

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
                    e.printStackTrace();
                }
            %>
        </select><br>

        <label for="image">Event Image:</label><br>
        <input type="file" name="image" id="image" accept="image/*" required><br>

        <input type="submit" value="Create Event">
    </form>
    </div>


    
</body>
</html>
