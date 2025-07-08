<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - CampusHub</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body, html {
            height: 100%;
            overflow: hidden;
        }

        #bgVideo {
            position: fixed;
            top: 0;
            left: 0;
            min-width: 100%;
            min-height: 100%;
            object-fit: cover;
            z-index: -1;
            filter: brightness(0.6);
        }

        .container {
            position: relative;
            max-width: 400px;
            margin: 80px auto;
            padding: 40px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            box-shadow: 0 0 25px rgba(0, 123, 255, 0.4);
        }

        h2 {
            text-align: center;
            color: #007BFF;
            margin-bottom: 25px;
        }

        input[type="email"],
        input[type="password"],
        select {
            width: 100%;
            padding: 12px;
            margin: 12px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            outline: none;
            transition: border 0.3s;
        }

        input[type="email"]:focus,
        input[type="password"]:focus,
        select:focus {
            border-color: #007BFF;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007BFF;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        p {
            text-align: center;
            margin-top: 15px;
            color: #333;
        }

        a {
            color: #007BFF;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        @media (max-width: 500px) {
            .container {
                margin: 40px 20px;
                padding: 30px;
            }
        }
    </style>
</head>
<body>


    <div class="container">
        <h2>Login to CampusHub</h2>
        <form action="LoginServlet" method="post">
            <input type="email" name="email" placeholder="Enter Email" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <input type="submit" value="Login">
        </form>
        <p>Don't have an account? <a href="Register.jsp">Register here</a></p>
    </div>

</body>
</html>
