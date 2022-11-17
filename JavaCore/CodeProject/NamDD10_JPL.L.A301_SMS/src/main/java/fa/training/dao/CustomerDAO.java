package fa.training.dao;

import fa.training.entities.Customer;

import java.sql.SQLException;
import java.util.List;

public interface CustomerDAO {
    boolean addCustomer(Customer customer) throws SQLException;

    List<Customer> getAllCustomer() throws SQLException;

    boolean updateCustomer(Customer customer) throws SQLException;

    boolean deleteCustomer(int customerId) throws SQLException;

    Customer getCustomerByID(int customerID) throws SQLException;
}
