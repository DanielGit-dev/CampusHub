package dao;

import model.bean.Order;
import model.bean.OrderDetail;

import java.sql.*;
import java.util.*;

public class OrderDAO {
    private Connection conn;

    public OrderDAO() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/CampusHub", "app", "app");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void placeOrder(int userId, int merchId, int quantity, double total) {
        try {
            // Insert into orders table
            String sql1 = "INSERT INTO orders (user_id, total_amount, order_date) VALUES (?, ?, CURRENT_TIMESTAMP)";
            PreparedStatement ps1 = conn.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
            ps1.setInt(1, userId);
            ps1.setDouble(2, total);
            ps1.executeUpdate();

            ResultSet rs = ps1.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            // Insert into order_details
            String sql2 = "INSERT INTO order_details (order_id, merch_id, quantity, subtotal) VALUES (?, ?, ?, ?)";
            PreparedStatement ps2 = conn.prepareStatement(sql2);
            ps2.setInt(1, orderId);
            ps2.setInt(2, merchId);
            ps2.setInt(3, quantity);
            ps2.setDouble(4, total);
            ps2.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Order> getOrdersByUserId(int userId) {
        List<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT * FROM orders WHERE user_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order order = new Order();
                int orderId = rs.getInt("id");
                order.setId(orderId);
                order.setUserId(userId);
                order.setDate(rs.getTimestamp("order_date"));
                order.setTotal(rs.getDouble("total_amount"));
                order.setDetails(getOrderDetails(orderId));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    private List<OrderDetail> getOrderDetails(int orderId) {
        List<OrderDetail> details = new ArrayList<>();
        try {
            String sql = "SELECT od.*, m.name FROM order_details od JOIN merchandise m ON od.merch_id = m.id WHERE od.order_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                OrderDetail d = new OrderDetail();
                d.setOrderId(orderId);
                d.setMerchId(rs.getInt("merch_id"));
                d.setMerchName(rs.getString("name"));
                d.setQuantity(rs.getInt("quantity"));
                d.setSubtotal(rs.getDouble("subtotal"));
                details.add(d);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return details;
    }
}
