package fa.training.dao;

import fa.training.models.Account;
import fa.training.models.Employee;
import fa.training.utils.DatabaseUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDAO {

    public Account getAccountByUserName(String username) throws SQLException{
        Account account = null;
        try (Connection connection = DatabaseUtils.getConnection()){
            String sql = "select * from account where account = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                EmployeeDAO emDAO = new EmployeeDAO();
                Employee employee = emDAO.getEmpByID(rs.getInt("employee_id"));
                account = new Account(rs.getInt("accID"), rs.getString("account"),
                        rs.getString("email"), rs.getString("password"), rs.getInt("status"), employee);
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return account;
    }

    public boolean addAccount(Account account) throws SQLException{
        String sql = "insert into account ([account]\n"
                + "           ,[email]\n"
                + "           ,[password]\n"
                + "           ,[status]\n"
                + "           ,[employee_id]) values (?,?,?,?,?)";

        try (Connection connection = DatabaseUtils.getConnection()){
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, account.getAccount());
            ps.setString(2, account.getEmail());
            ps.setString(3, account.getPassword());
            ps.setInt(4, account.getStatus());
            ps.setInt(5, account.getEmployee().getEmployeeId());
            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException e) {
            return false;
        }
    }

    public boolean deteteAccount(int emID) throws SQLException {
        String sql = "delete from account where employee_id = ?";
        try (Connection connection = DatabaseUtils.getConnection()){
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, emID);
            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException e) {
            return false;
        }
    }

}
