package model.bean;

public class OrderDetail {
    private int orderId;
    private int merchId;
    private String merchName;
    private int quantity;
    private double subtotal;

    // Getters & Setters
    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }

    public int getMerchId() { return merchId; }
    public void setMerchId(int merchId) { this.merchId = merchId; }

    public String getMerchName() { return merchName; }
    public void setMerchName(String merchName) { this.merchName = merchName; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getSubtotal() { return subtotal; }
    public void setSubtotal(double subtotal) { this.subtotal = subtotal; }
}
