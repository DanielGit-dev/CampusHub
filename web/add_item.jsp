<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Merchandise</title>
    <style>
        table {
            border-collapse: collapse;
            width: 50%;
            margin: auto;
        }
        td {
            padding: 8px;
        }
        h2 {
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>Add New Merchandise</h2>

    <form action="AddMerchandiseServlet" method="post">

        <table>
            <tr>
                <td>Product Name:</td>
                <td><input type="text" name="productName" required></td>
            </tr>
            <tr>
                <td>Price (RM):</td>
                <td><input type="number" name="price" step="0.01" required></td>
            </tr>
            <tr>
                <td>Stock Quantity:</td>
                <td><input type="number" name="stock" required></td>
            </tr>
            <tr>
                <td>Club ID:</td>
                <td><input type="number" name="clubId" required></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Add Merchandise"></td>
            </tr>
        </table>
    </form>
</body>
</html>
