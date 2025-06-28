<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Login</title>
</head>
<body>
    
    <%
    String success = (String) request.getAttribute("success");
    String error = (String) request.getAttribute("error");

    if (success != null) {
%>
    <p style="color:green;"><%= success %></p>
<%
    } else if (error != null) {
%>
    <p style="color:red;"><%= error %></p>
<%
    }
%>

    <h2>Login</h2>

    <form action="LoginServlet" method="post">
        Email: <input type="email" name="email" required><br><br>
        Password: <input type="password" name="password" required><br><br>
        <input type="submit" value="Login">
    </form>

    <p>Don't have an account? <a href="Register.jsp">Register here</a></p>
</body>
</html>
