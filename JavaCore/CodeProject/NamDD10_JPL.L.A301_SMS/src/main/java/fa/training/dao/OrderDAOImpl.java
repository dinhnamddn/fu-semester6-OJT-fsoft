package fa.training.dao;

import fa.training.entities.Customer;
import fa.training.entities.Order;
import fa.training.utils.JdbcConnection;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class OrderDAOImpl implements OrderDAO {
    public boolean addOrder(Order order) throws SQLException {
        try (Connection connection = JdbcConnection.getConnection()) {
            String sql = "insert into Orders (order_id, order_date, customer_id, employee_id, total) values(?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, order.getOrderId());
            ps.setDate(2, Date.valueOf((LocalDate) order.getOrderDate()));
            ps.setInt(3, order.getCustomerId());
            ps.setInt(4, order.getEmployeeId());
            ps.setDouble(5, order.getTotal());
            return ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Order> getALlOrdersByCustomerID(int customerId) throws SQLException {
        List<Order> orderList = new ArrayList<>();

        try (Connection connection = JdbcConnection.getConnection()) {
            String sql = "select * from Orders where customer_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                orderList.add(new Order(rs.getInt(1), rs.getDate(2).toLocalDate(),
                        rs.getInt(3), rs.getInt(4), rs.getDouble(5)));
            }
        }

        return orderList;
    }

    @Override
    public Order getOrderByID(int orderID) {
        try (Connection connection = JdbcConnection.getConnection()) {
            String sql = "SELECT * FROM Orders WHERE order_id =?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, orderID);
            ResultSet rs = statement.executeQuery();
            rs.next();
            return new Order(rs.getInt(1), rs.getDate(2).toLocalDate(),
                    rs.getInt(3), rs.getInt(4), rs.getDouble(5));
        } catch (SQLException e) {
        }
        return null;
    }
}
