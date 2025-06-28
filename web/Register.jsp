<%@ page contentType="text/html" %>
<html>
<head><title>User Registration</title></head>
<body>
    
    <%
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
    <p style="color:red;"><%= error %></p>
<%
    }
%>
  
<h2>Register</h2>

<form action="RegisterUser" method="post">
    Name: <input type="text" name="name" required><br>
    Email: <input type="email" name="email" required><br>
    Password: <input type="password" name="password" required><br>
    Role:
    <select name="role">
        <option value="Student">Student</option>
        <option value="ClubRep">Club Representative</option>
    </select><br>
    <input type="submit" value="Register">
</form>

</body>

</html>
