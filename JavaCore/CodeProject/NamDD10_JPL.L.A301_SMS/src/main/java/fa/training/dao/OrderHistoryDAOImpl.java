package fa.training.dao;

import fa.training.entities.OrderHistory;
import fa.training.utils.JdbcConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.jar.JarEntry;

public class OrderHistoryDAOImpl implements OrderHistoryDAO{
    @Override
    public List<OrderHistory> getOrderHistory(int customerId) throws SQLException {
        List<OrderHistory> orderHistoryList = new ArrayList<>();
        try (Connection connection = JdbcConnection.getConnection()){
            String sql = "SELECT TB.customer_name, TA.supervisor_name, TB.order_id, TB.order_date, TB.customer_id, TB.employee_id, TB.total FROM (\n" +
                    "SELECT a.employee_id, b.employee_name AS supervisor_name FROM Employee AS a JOIN Employee AS b ON a.employee_id = b.supervisor_id) AS TA\n" +
                    "JOIN (SELECT cus.customer_name, od.* FROM Customer AS cus JOIN Orders AS od ON cus.customer_id = od.customer_id) AS TB\n" +
                    "ON TA.employee_id = TB.employee_id\n" +
                    "WHERE customer_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                orderHistoryList.add(new OrderHistory(rs.getString(1), rs.getString(2),
                        rs.getInt(3), rs.getDate(4).toLocalDate(),
                        rs.getInt(5), rs.getInt(6), rs.getDouble(7)));
            }
        }
        return orderHistoryList;
    }
}
