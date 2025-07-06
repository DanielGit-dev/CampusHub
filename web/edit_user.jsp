<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="model.User" scope="request" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f7fa;
            padding: 40px;
        }
        .form-container {
            max-width: 500px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #2f3e9e;
        }
        label {
            display: block;
            margin: 15px 0 5px;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        button {
            width: 100%;
            padding: 10px;
            background: #2f3e9e;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        button:hover {
            background: #1a2b8f;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Edit User</h2>
    <form action="EditUserServlet" method="post">
        <input type="hidden" name="userId" value="<%= user.getUserId() %>" />

        <label for="name">Name:</label>
        <input type="text" name="name" value="<%= user.getName() %>" required />

        <label for="email">Email:</label>
        <input type="email" name="email" value="<%= user.getEmail() %>" required />

        <label for="role">Role:</label>
        <select name="role">
            <option value="user" <%= user.getRole().equals("user") ? "selected" : "" %>>User</option>
            <option value="admin" <%= user.getRole().equals("admin") ? "selected" : "" %>>Admin</option>
        </select>

        <button type="submit">Update User</button>
    </form>
</div>
</body>
</html>
