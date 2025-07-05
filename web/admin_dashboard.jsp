<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<html>
<head><title>Admin Dashboard</title></head>
<body>
<h2>Welcome, Admin <%= user.getName() %></h2>

<ul>
    <li><a href="view_users.jsp">Manage Users</a></li>
    <li><a href="view_all_events.jsp">View All Events</a></li>
    <li><a href="view_merchandise.jsp">View All Merchandise</a></li>
    <li><a href="reports.jsp">View Reports</a></li>
    <li><a href="LogoutServlet">Logout</a></li>
</ul>
</body>
</html>
