<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<html>
<head><title>Dashboard</title></head>
<body>
    <h2>Welcome, <%= user.getName() %>!</h2>
    <p>You are logged in as: <%= user.getRole() %></p>
    <a href="LogoutServlet">Logout</a>
</body>
</html>
