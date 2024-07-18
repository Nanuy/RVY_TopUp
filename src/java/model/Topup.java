package model;

import java.sql.Timestamp;

public class Topup {
    private int id;
    private int userId;
    private double amount;
    private String username;
    private String paymentMethod;
    private String status;
    private Timestamp timestamp;

    public Topup(int id, int userId, double amount, String username, String paymentMethod, String status, Timestamp timestamp) {
        this.id = id;
        this.userId = userId;
        this.amount = amount;
        this.username = username;
        this.paymentMethod = paymentMethod;
        this.status = status;
        this.timestamp = timestamp;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }
}
