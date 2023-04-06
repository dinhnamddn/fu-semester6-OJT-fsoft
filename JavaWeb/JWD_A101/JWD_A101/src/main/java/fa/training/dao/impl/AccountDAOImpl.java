package fa.training.dao.impl;

import fa.training.dao.AccountDAO;
import fa.training.entity.Account;
import fa.training.utils.ConnectionUtil;
import fa.training.utils.SQLConstant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDAOImpl implements AccountDAO {

    @Override
    public boolean checkLogin(Account account) {
        try (Connection conn = ConnectionUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement(SQLConstant.CHECK_LOGIN)) {
            statement.setString(1, account.getAccount());
            statement.setString(2, account.getPassword());
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean checkActive(String account) {
        try (Connection conn = ConnectionUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement(SQLConstant.CHECK_ACTIVE)) {
            statement.setString(1, account);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean add(Account account) {
        try (Connection conn = ConnectionUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement(SQLConstant.ADD_ACCOUNT)) {
            statement.setString(1, account.getAccount());
            statement.setString(2, account.getEmail());
            statement.setString(3, account.getPassword());
            statement.setInt(4, account.getStatus());
            statement.setInt(5, account.getEmpId().getEmpId());
            int result = statement.executeUpdate();
            if (result > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean checkAccountUnique(String account) {
        try (Connection conn = ConnectionUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement(SQLConstant.CHECK_ACCOUNT_UNIQUE)) {
            statement.setString(1, account);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }

    @Override
    public boolean checkEmailUnique(String email) {
        try (Connection conn = ConnectionUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement(SQLConstant.CHECK_EMAIL_UNIQUE)) {
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }

    @Override
    public boolean deleteByIdEmp(int idEmp) {
        try (Connection conn = ConnectionUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement(SQLConstant.DELETE_ACCOUNT_BY_ID_EMP)) {
            statement.setInt(1, idEmp);
            int result = statement.executeUpdate();
            if (result > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateStatus(int idEmp, int status) {
        try (Connection conn = ConnectionUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement(SQLConstant.UPDATE_STATUS)) {
            statement.setInt(1, status);
            statement.setInt(2, idEmp);
            int result = statement.executeUpdate();
            if (result > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Account findByIdEmp(int idEmp) {
        try (Connection conn = ConnectionUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement(SQLConstant.ACCOUNT_BY_ID_EMP)) {
            statement.setInt(1, idEmp);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String acc = resultSet.getString("account");
                String email = resultSet.getString("email");
                int status = resultSet.getInt("status");
                Account account = new Account(acc, email, status);
                return account;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
