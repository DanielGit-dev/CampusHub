<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.bean.Merchandise, dao.MerchandiseDAO" %>
<%@ page session="true" %>

<%
    MerchandiseDAO merchDAO = new MerchandiseDAO();
    List<Merchandise> merchList = merchDAO.getAllMerchandise();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Merchandise Catalog</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #2f3e9e;
        }
        .catalog-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            margin-top: 30px;
        }
        .card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            width: 250px;
            padding: 20px;
            text-align: center;
        }
        .card img {
            max-width: 100%;
            border-radius: 6px;
        }
        .card h3 {
            color: #2f3e9e;
        }
        .card form {
            margin-top: 10px;
        }
        input[type="submit"] {
            background-color: #2f3e9e;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 6px;
            width: 100%;
            font-weight: bold;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #1e2f80;
        }
    </style>
</head>
<body>
<h2>Merchandise Catalog</h2>
<div class="catalog-container">
    <%
        for (Merchandise m : merchList) {
    %>
        <div class="card">
            <img src="<%= m.getImageUrl() %>" alt="merch image">
            <h3><%= m.getName() %></h3>
            <p>RM <%= m.getPrice() %></p>
            <form action="placeOrder.jsp" method="get">
                <input type="hidden" name="merch_id" value="<%= m.getId() %>">
                <input type="submit" value="Order Now">
            </form>
        </div>
    <%
        }
    %>
</div>
</body>
</html>
