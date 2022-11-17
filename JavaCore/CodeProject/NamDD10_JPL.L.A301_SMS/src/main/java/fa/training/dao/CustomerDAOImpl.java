package fa.training.dao;

import fa.training.entities.Customer;
import fa.training.utils.JdbcConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAOImpl implements CustomerDAO {
    @Override
    public boolean addCustomer(Customer customer) {
        try (Connection connection = JdbcConnection.getConnection()) {
            String sql = "insert into Customer(customer_id, customer_name) values(?,?) ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, customer.getCustomerId());
            ps.setString(2, customer.getCustomerName());
            return  ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Customer> getAllCustomer() throws SQLException {
        List<Customer> customerList = new ArrayList<>();

        try (Connection connection = JdbcConnection.getConnection()) {
            String sql = "select * from Customer";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                customerList.add(new Customer(rs.getInt(1), rs.getString(2)));
            }
        }
        return customerList;
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        try (Connection connection = JdbcConnection.getConnection()){
            String sql = "update Customer set customer_name=? where customer_id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, customer.getCustomerName());
            ps.setInt(2, customer.getCustomerId());
            return ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteCustomer(int customerId) {
        try (Connection connection = JdbcConnection.getConnection()){
            String sql = "delete Customer where customer_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, customerId);
            return ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public Customer getCustomerByID(int customerID) {
        try (Connection connection = JdbcConnection.getConnection()){
            String sql = "SELECT customer_id, customer_name FROM Customer WHERE customer_id =?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, customerID);
            ResultSet rs = statement.executeQuery();
            rs.next();
            return new Customer(rs.getInt(1), rs.getString(2));
        } catch (SQLException e) {
        }
        return null;
    }
}
