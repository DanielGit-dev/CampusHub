<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="model.User" scope="request" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f7fa;
            padding: 40px;
        }
        .confirm-container {
            max-width: 500px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        h2 {
            color: #d32f2f;
        }
        p {
            margin: 20px 0;
            font-size: 16px;
        }
        button {
            padding: 10px 20px;
            margin: 10px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }
        .confirm {
            background: #d32f2f;
            color: white;
        }
        .cancel {
            background: #ccc;
        }
    </style>
</head>
<body>
<div class="confirm-container">
    <h2>Confirm Delete</h2>
    <p>Are you sure you want to delete the following user?</p>
    <p><strong>Name:</strong> <%= user.getName() %></p>
    <p><strong>Email:</strong> <%= user.getEmail() %></p>
    <p><strong>Role:</strong> <%= user.getRole() %></p>

    <form action="DeleteUserServlet" method="post" style="display: inline;">
        <input type="hidden" name="userId" value="<%= user.getUserId() %>" />
        <button class="confirm" type="submit">Yes, Delete</button>
    </form>

    <form action="view_users.jsp" method="get" style="display: inline;">
        <button class="cancel" type="submit">Cancel</button>
    </form>
</div>
</body>
</html>
