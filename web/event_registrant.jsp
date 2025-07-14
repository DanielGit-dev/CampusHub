<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, model.bean.User" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    int userID = user.getUserID();
    String selectedClubId = request.getParameter("clubId");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Event Registrants by Club</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4fc;
            padding: 40px;
        }

        h2, h3 {
            color: #2f3e9e;
        }

        select, input[type="submit"] {
            padding: 10px;
            font-size: 16px;
            margin-top: 10px;
        }

        .form-box {
            margin-bottom: 30px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 30px;
            background-color: white;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
        }

        th {
            background-color: #e0f0ff;
        }
    </style>
</head>
<body>

<h2>View Event Registrants</h2>

<!-- Club Selection Form -->
<div class="form-box">
    <form method="get" action="event_registrant.jsp">
        <label for="clubId"><strong>Select a Club:</strong></label><br>
        <select name="clubId" id="clubId" required>
            <option value="">-- Choose a Club --</option>
<%
    // Load clubs for the logged-in user
    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/CampusHub", "app", "app");

        String clubSql = "SELECT ClubID, Club_Name FROM Clubs WHERE UserID = ?";
        PreparedStatement clubStmt = conn.prepareStatement(clubSql);
        clubStmt.setInt(1, userID);
        ResultSet clubRs = clubStmt.executeQuery();

        while (clubRs.next()) {
            int clubId = clubRs.getInt("ClubID");
            String clubName = clubRs.getString("Club_Name");
            String selected = (selectedClubId != null && selectedClubId.equals(String.valueOf(clubId))) ? "selected" : "";
%>
            <option value="<%= clubId %>" <%= selected %>><%= clubName %></option>
<%
        }

        conn.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error loading clubs.</p>");
    }
%>
        </select><br>
        <input type="submit" value="View Registrants">
    </form>
</div>

<%
    if (selectedClubId != null && !selectedClubId.isEmpty()) {
        try {
            int clubId = Integer.parseInt(selectedClubId);

            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/CampusHub", "app", "app");

            String sql = "SELECT e.Title, u.UserID, u.Name, u.Email, r.Reg_date " +
                         "FROM Event_Registration r " +
                         "JOIN Users u ON r.UserID = u.UserID " +
                         "JOIN Events e ON r.EventID = e.EventID " +
                         "WHERE e.ClubID = ? ORDER BY e.Title, r.Reg_date";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, clubId);
            ResultSet rs = ps.executeQuery();

            boolean hasData = false;
%>
    <h3>Registered Students for Club ID: <%= clubId %></h3>
    <table>
        <tr>
            <th>Event Title</th>
            <th>User ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Registration Date</th>
        </tr>
<%
            while (rs.next()) {
                hasData = true;
%>
        <tr>
            <td><%= rs.getString("Title") %></td>
            <td><%= rs.getInt("UserID") %></td>
            <td><%= rs.getString("Name") %></td>
            <td><%= rs.getString("Email") %></td>
            <td><%= rs.getDate("Reg_date") %></td>
        </tr>
<%
            }

            if (!hasData) {
%>
        <tr>
            <td colspan="5">No registrants found for this club's events.</td>
        </tr>
<%
            }

            conn.close();
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error fetching registrants: " + e.getMessage() + "</p>");
        }
    }
%>

</body>
</html>
