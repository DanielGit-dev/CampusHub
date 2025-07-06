package model.bean;

import java.util.Date;
import java.util.List;

public class Order {
    private int id;
    private int userId;
    private Date date;
    private double total;
    private List<OrderDetail> details;

    // Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }

    public double getTotal() { return total; }
    public void setTotal(double total) { this.total = total; }

    public List<OrderDetail> getDetails() { return details; }
    public void setDetails(List<OrderDetail> details) { this.details = details; }
}
