<%-- 
    Document   : ClubManages
    Created on : Jun 28, 2025, 12:12:41 AM
    Author     : ASUS
--%>

<!DOCTYPE html>
<html>
<head>
    <title>Club Dashboard</title>
</head>
<body>
    <h2>Welcome Club Representative!</h2>

    <!-- Suppose you pass the clubID when logging in / via session -->
    <form action="view_events.jsp" method="get">
        <input type="hidden" name="clubID" value="<!-- You can dynamically fill this -->">
        <input type="submit" value="View Existing Events">
    </form>

    <form action="AddEvent.jsp" method="get">
        <input type="submit" value="Add New Event">
    </form>
</body>
</html>

