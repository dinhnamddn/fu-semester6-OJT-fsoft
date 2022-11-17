package fa.training.dao;

import fa.training.entities.LineItem;
import fa.training.utils.JdbcConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.jar.JarEntry;

public class ListItemDAOImpl implements ListItemDAO {
    @Override
    public boolean addLineItem(LineItem item) {
        try (Connection connection = JdbcConnection.getConnection()) {
            String sql = "insert into LineItem(order_id, product_id, quantity, price) values(?,?,?,?)";
            PreparedStatement ps = JdbcConnection.getConnection().prepareStatement(sql);
            ps.setInt(1, item.getOrderId());
            ps.setInt(2, item.getProductId());
            ps.setInt(3, item.getQuantity());
            ps.setDouble(4, item.getPrice());
            return ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public List<LineItem> getAllItemsByOrderId(int orderId) throws SQLException {
        List<LineItem> lineItemsList = new ArrayList<>();
        try (Connection connection = JdbcConnection.getConnection()) {
            String sql = "select * from LineItem where order_id =?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                lineItemsList.add(new LineItem(rs.getInt(1), rs.getInt(2),
                        rs.getInt(3), rs.getDouble(4)));
            }
        }

        return lineItemsList;
    }

    @Override
    public Double computeOrderTotal(int orderId) throws SQLException {
        double orderTotal = 0;
        try (Connection connection = JdbcConnection.getConnection()) {
            String sql = "select sum(price) as 'total' from LineItem where order_id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                orderTotal = rs.getDouble(1);
            }
        }

        return orderTotal;
    }


}
