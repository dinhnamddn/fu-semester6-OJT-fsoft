package fa.training.dao;

import fa.training.entities.OrderHistory;

import java.sql.SQLException;
import java.util.List;

public interface OrderHistoryDAO {
    List<OrderHistory> getOrderHistory(int customerId) throws SQLException;
}
