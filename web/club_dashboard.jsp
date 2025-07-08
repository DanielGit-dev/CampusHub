<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, model.bean.User" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    int userID = user.getUserID();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Club Dashboard</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f0f4fc;
            padding: 40px;
        }

        h2, h3 {
            color: #2f3e9e;
        }

        .button-container {
            margin-bottom: 30px;
        }

        .button-container form {
            display: inline-block;
            margin-right: 20px;
        }

        input[type="submit"] {
            background-color: #2f3e9e;
            color: white;
            padding: 12px 25px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #1a2b8f;
        }

        .event-section {
            margin-top: 50px;
            background-color: #fff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }

        .event-card {
            display: flex;
            gap: 30px;
            align-items: center;
            margin-bottom: 30px;
        }

        .event-card img {
            width: 200px;
            height: 150px;
            object-fit: cover;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .event-details p {
            margin: 6px 0;
            font-size: 16px;
        }

        .event-details span {
            font-weight: bold;
            color: #333;
        }
    </style>
</head>
<body>

<h2>Welcome Club Representative! <%= user.getName() %> </h2>

<div class="button-container">
    <form action="view_events.jsp" method="get">
        <input type="submit" value="View Existing Events">
    </form>

    <form action="AddEvent.jsp" method="get">
        <input type="submit" value="Add New Event">
    </form>
</div>

<!-- ✅ Section: All Events for Club -->
<div class="event-section">
    <h3>Your Club's Events</h3>

<%
    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/CampusHub", "app", "app");

        String sql = "SELECT C.Club_Name, E.Title, E.Date, E.Capacity, E.Image_Path " +
                     "FROM Users U " +
                     "JOIN Clubs C ON U.UserID = C.UserID " +
                     "JOIN Events E ON C.ClubID = E.ClubID " +
                     "WHERE U.UserID = ? ORDER BY E.Date";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, userID);

        ResultSet rs = ps.executeQuery();
        boolean hasEvents = false;

        while (rs.next()) {
            hasEvents = true;
            String clubName = rs.getString("Club_Name");
            String title = rs.getString("Title");
            Date date = rs.getDate("Date");
            int capacity = rs.getInt("Capacity");
            String imagePath = rs.getString("Image_Path");
%>
            <div class="event-card">
                <img src="<%= imagePath %>" alt="Event Image">
                <div class="event-details">
                    <p><span>Club:</span> <%= clubName %></p>
                    <p><span>Title:</span> <%= title %></p>
                    <p><span>Date:</span> <%= date %></p>
                    <p><span>Capacity:</span> <%= capacity %></p>
                </div>
            </div>
<%
        }

        if (!hasEvents) {
%>
        <p>No events found for your club.</p>
<%
        }

        conn.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error fetching events.</p>");
      
    }
%>

</div>

</body>
</html>
