<%@ page import="java.util.List" %>
<%@ page import="java.sql.*, model.User" %>
<%
    User admin = (User) session.getAttribute("user");
    if (admin == null || !"Admin".equalsIgnoreCase(admin.getRole())) {
        response.sendRedirect("Login.jsp");
        return;
    }

    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/CampusHub", "app", "app");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM Users");
%>

<h2>All Registered Users</h2>
<table border="1">
    <tr>
        <th>UserID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Role</th>
    </tr>
<%
    while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("UserID") %></td>
        <td><%= rs.getString("Name") %></td>
        <td><%= rs.getString("Email") %></td>
        <td><%= rs.getString("Role") %></td>
    </tr>
    
    <a href="EditUserServlet?userId=<%= rs.getInt("UserID") %>">Edit User</a>
    <a href="DeleteUserServlet?userId=<%= rs.getInt("UserID") %>">Delete</a>

<%
    }
    rs.close(); stmt.close(); conn.close();
%>
</table>


