<%@ page import="java.sql.*, model.bean.User" %>
<%
    User admin = (User) session.getAttribute("user");
    if (admin == null || !"Admin".equalsIgnoreCase(admin.getRole())) {
        response.sendRedirect("Login.jsp");
        return;
    }

    int userId = Integer.parseInt(request.getParameter("userId"));

    Class.forName("org.apache.derby.jdbc.ClientDriver");
    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/CampusHub", "app", "app");

    PreparedStatement ps = conn.prepareStatement("SELECT * FROM Users WHERE UserID = ?");
    ps.setInt(1, userId);
    ResultSet rs = ps.executeQuery();

    if (!rs.next()) {
        response.sendRedirect("edit_user.jsp?error=UserNotFound");
        return;
    }

    String name = rs.getString("Name");
    String email = rs.getString("Email");
    String role = rs.getString("Role");

    rs.close();
    ps.close();
    conn.close();
%>

<h2>Edit User</h2>
<form action="EditUserServlet" method="post">
    <input type="hidden" name="userId" value="<%= userId %>">

    Name: <input type="text" name="name" value="<%= name %>" required><br><br>
    Email: <input type="email" name="email" value="<%= email %>" required><br><br>
    Role: 
    <select name="role">
        <option value="User" <%= "User".equals(role) ? "selected" : "" %>>User</option>
        <option value="Admin" <%= "Admin".equals(role) ? "selected" : "" %>>Admin</option>
        <option value="ClubRep" <%= "ClubRep".equals(role) ? "selected" : "" %>>ClubRep</option>
    </select>


    <input type="submit" value="Update User">
</form>

<br>
<a href="manageUsers.jsp">? Back to User List</a>
