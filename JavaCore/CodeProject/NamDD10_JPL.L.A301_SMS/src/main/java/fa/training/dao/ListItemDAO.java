package fa.training.dao;

import fa.training.entities.LineItem;

import java.sql.SQLException;
import java.util.List;

public interface ListItemDAO {
    boolean addLineItem(LineItem item) throws SQLException;

    List<LineItem> getAllItemsByOrderId(int orderId) throws SQLException;

    Double computeOrderTotal(int orderId) throws SQLException;
}
