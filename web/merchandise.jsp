<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Merchandise Dashboard</title>
    <style>
        body {
            font-family: Arial;
            text-align: center;
            padding: 40px;
        }
        h2 {
            margin-bottom: 30px;
        }
        .nav-buttons {
            display: flex;
            justify-content: center;
            gap: 30px;
        }
        .nav-buttons a {
            padding: 12px 24px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
        }
        .nav-buttons a:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>

    <h2>Merchandise Management</h2>

    <div class="nav-buttons">
        <a href="add_item.jsp">Add Merchandise</a>
        <a href="edit_item.jsp">Edit Merchandise</a>
        <a href="delete_item.jsp">Delete Merchandise</a>
    </div>

</body>
</html>
