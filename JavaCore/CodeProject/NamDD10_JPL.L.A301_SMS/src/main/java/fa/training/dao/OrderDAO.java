package fa.training.dao;

import fa.training.entities.Order;

import java.sql.SQLException;
import java.util.List;

public interface OrderDAO {
    boolean addOrder(Order order) throws SQLException;

    List<Order> getALlOrdersByCustomerID(int customerId) throws SQLException;

    Order getOrderByID(int orderID) throws SQLException;
}
