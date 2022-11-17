package fa.training.entities;

import java.time.LocalDate;

public class OrderHistory {
    String customerName;
    String spvrName;
    int orderId;
    LocalDate orderDate;
    int customerId;
    int employeeId;
    double total;

    public OrderHistory() {
    }

    public OrderHistory(String customerName, String spvrName, int orderId, LocalDate orderDate, int customerId, int employeeId, double total) {
        this.customerName = customerName;
        this.spvrName = spvrName;
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.customerId = customerId;
        this.employeeId = employeeId;
        this.total = total;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getSpvrName() {
        return spvrName;
    }

    public void setSpvrName(String spvrName) {
        this.spvrName = spvrName;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public LocalDate getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDate orderDate) {
        this.orderDate = orderDate;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "OrderHistory{" +
                "customerName='" + customerName + '\'' +
                ", spvrName='" + spvrName + '\'' +
                ", orderId=" + orderId +
                ", orderDate=" + orderDate +
                ", customerId=" + customerId +
                ", employeeId=" + employeeId +
                ", total=" + total +
                '}';
    }
}
