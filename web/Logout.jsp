<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Logged Out - CampusHub</title>
    <style>
        body {
            background-color: #000;
            color: #fff;
            font-family: Arial;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .message {
            text-align: center;
            background-color: #111;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px #333;
        }

        a {
            color: #aaa;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="message">
        <h2>You have successfully logged out.</h2>
        <p><a href="Login.jsp">Login again</a></p>
    </div>
</body>
</html>
