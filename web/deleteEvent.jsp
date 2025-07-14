<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Event</title>
</head>
<body>
    <h2>Delete Event</h2>
    
    <form action="DeleteEventServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this event?');">
        <input type="hidden" name="action" value="delete">
        
        <label for="eventId">Event ID:</label><br>
        <input type="number" name="eventId" id="eventId" required><br><br>
        
        <input type="submit" value="Delete Event">
    </form>
    
    <a href="event.jsp">Back to Event Management</a>
</body>
</html>
