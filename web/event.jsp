<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Event Dashboard</title>
    <style>
        body {
            font-family: Arial;
            text-align: center;
            padding: 40px;
        }
        h2 {
            margin-bottom: 30px;
        }
        .nav-buttons {
            display: flex;
            justify-content: center;
            gap: 30px;
        }
        .nav-buttons a {
            padding: 12px 24px;
            background-color: #2196F3;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
        }
        .nav-buttons a:hover {
            background-color: #1565c0;
        }
    </style>
</head>
<body>

    <h2>Event Management</h2>

    <div class="nav-buttons">
        <a href="AddEvent.jsp">Create Event</a>
        <a href="editEvent.jsp">Edit Event</a>
        <a href="deleteEvent.jsp">Delete Event</a>
    </div>

</body>
</html>
