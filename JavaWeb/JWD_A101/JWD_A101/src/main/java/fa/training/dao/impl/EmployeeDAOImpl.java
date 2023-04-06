package fa.training.dao.impl;

import fa.training.dao.EmployeeDAO;
import fa.training.entity.Employee;
import fa.training.utils.ConnectionUtil;
import fa.training.utils.SQLConstant;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAOImpl implements EmployeeDAO {

    @Override
    public List<Employee> getAllEmployee(int pageIndex, int pageSize, String search, String searchBy) {
        List<Employee> employeeList = new ArrayList<>();
        try {
            Connection conn = ConnectionUtil.getConnection();
            String str = "";
            switch (searchBy) {
                case "employee_id":
                    str = "WHERE employee_id = " + search.trim();
                    break;
                case "full_name":
                    str = "WHERE CONCAT(first_name, ' ', last_name) LIKE '%" + search.trim().replaceAll("\\s+", " ") + "%'";
                    break;
                case "date_of_birth":
                    str = "WHERE date_of_birth LIKE '%" + search.trim() + "%'";
                    break;
                case "phone":
                    str = "WHERE phone LIKE '%" + search.trim().replaceAll("\\s+", " ") + "%'";
                    break;
                case "address":
                    str = "WHERE address LIKE '%" + search.trim().replaceAll("\\s+", " ") + "%'";
                    break;
                case "department_name":
                    str = "WHERE department_name LIKE '%" + search.trim().replaceAll("\\s+", " ") + "%'";
                    break;
                default:
                    str = "";
                    break;
            }
            String sql = "SELECT * FROM Employee " + str +
                    " ORDER BY employee_id " +
                    "OFFSET (?-1)*? ROWS FETCH NEXT ? ROWS ONLY";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, pageIndex);
            statement.setInt(2, pageSize);
            statement.setInt(3, pageSize);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Employee employee = new Employee(
                        resultSet.getInt("employee_id"),
                        resultSet.getString("first_name"),
                        resultSet.getString("last_name"),
                        resultSet.getInt("gender"),
                        resultSet.getDate("date_of_birth"),
                        resultSet.getString("phone"),
                        resultSet.getString("address"),
                        resultSet.getString("department_name"),
                        resultSet.getString("remark"));
                employeeList.add(employee);
            }
            return employeeList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int getTotalEmployee(String search, String searchBy) {
        int totalEmployee = 0;
        try {
            Connection conn = ConnectionUtil.getConnection();
            String str = "";
            switch (searchBy) {
                case "employee_id":
                    str = "WHERE employee_id = " + search.trim();
                    break;
                case "full_name":
                    str = "WHERE CONCAT(first_name, ' ', last_name) LIKE '%" + search.trim().replaceAll("\\s+", " ") + "%'";
                    break;
                case "date_of_birth":
                    str = "WHERE date_of_birth LIKE '%" + search.trim().replaceAll("\\s+", " ") + "%'";
                    break;
                case "phone":
                    str = "WHERE phone LIKE '%" + search.trim().replaceAll("\\s+", " ") + "%'";
                    break;
                case "address":
                    str = "WHERE address LIKE '%" + search.trim().replaceAll("\\s+", " ") + "%'";
                    break;
                case "department_name":
                    str = "WHERE department_name LIKE '%" + search.trim().replaceAll("\\s+", " ") + "%'";
                    break;
                default:
                    str = "";
                    break;
            }
            String sql = "SELECT COUNT(*) AS total FROM Employee " + str;
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                totalEmployee = resultSet.getInt("total");
                return totalEmployee;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int add(Employee employee) {
        try (Connection conn = ConnectionUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement(SQLConstant.ADD_EMPLOYEE, Statement.RETURN_GENERATED_KEYS);) {
            statement.setString(1, employee.getFirstName());
            statement.setString(2, employee.getLastName());
            statement.setInt(3, employee.getGender());
            statement.setDate(4, employee.getBirthDate());
            statement.setString(5, employee.getPhone());
            statement.setString(6, employee.getAddress());
            statement.setString(7, employee.getDeptName());
            statement.setString(8, employee.getRemark());
            int result = statement.executeUpdate();
            if (result > 0) {
                ResultSet resultSet = statement.getGeneratedKeys();
                if (resultSet.next()) {
                    return resultSet.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public boolean update(Employee employee) {
        try (Connection conn = ConnectionUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement(SQLConstant.UPDATE_EMPLOYEE);) {
            statement.setString(1, employee.getFirstName());
            statement.setString(2, employee.getLastName());
            statement.setInt(3, employee.getGender());
            statement.setDate(4, employee.getBirthDate());
            statement.setString(5, employee.getPhone());
            statement.setString(6, employee.getAddress());
            statement.setString(7, employee.getDeptName());
            statement.setString(8, employee.getRemark());
            statement.setInt(9, employee.getEmpId());
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
    public boolean delete(int id) {
        try(Connection conn = ConnectionUtil.getConnection();
            PreparedStatement statement = conn.prepareStatement(SQLConstant.DELETE_EMPLOYEE)) {
            statement.setInt(1, id);
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
    public Employee findById(int id) {
        try(Connection conn = ConnectionUtil.getConnection();
            PreparedStatement statement = conn.prepareStatement(SQLConstant.GET_EMPLOYEE_BY_ID)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new Employee(
                        resultSet.getInt("employee_id"),
                        resultSet.getString("first_name"),
                        resultSet.getString("last_name"),
                        resultSet.getInt("gender"),
                        resultSet.getDate("date_of_birth"),
                        resultSet.getString("phone"),
                        resultSet.getString("address"),
                        resultSet.getString("department_name"),
                        resultSet.getString("remark"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
