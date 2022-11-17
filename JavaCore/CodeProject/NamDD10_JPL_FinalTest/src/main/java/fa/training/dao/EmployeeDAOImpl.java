package fa.training.dao;

import fa.training.entities.Employee;
import fa.training.utils.JdbcConnection;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAOImpl implements EmployeeDAO{
    @Override
    public boolean save(Employee employee) {
        try (Connection connection = JdbcConnection.getConnection()){
            String sql = "INSERT INTO [Employee]([birth_date],[first_name],[last_name],[gender],[hire_date])VALUES(?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDate(1, Date.valueOf((LocalDate) employee.getBirthDate()));
            ps.setString(2, employee.getFirstName());
            ps.setString(3, employee.getLastName());
            ps.setString(4, employee.getGender());
            ps.setDate(5, Date.valueOf((LocalDate) employee.getHireDate()));
            return ps.executeUpdate() > 0;
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Employee> findAll() {
        List<Employee> listEmployees = new ArrayList<>();
        try (Connection connection = JdbcConnection.getConnection()){
            String sql = "SELECT * FROM Employee";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Employee employee = new Employee(rs.getInt(1), rs.getDate(2).toLocalDate(), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getDate(6).toLocalDate());
                listEmployees.add(employee);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return listEmployees;
    }

    @Override
    public boolean update(Employee employee) {
        try (Connection connection = JdbcConnection.getConnection()){
            String sql = "UPDATE [Employee]\n" +
                    "   SET [birth_date] = ?\n" +
                    "      ,[first_name] = ?\n" +
                    "      ,[last_name] = ?\n" +
                    "      ,[gender] = ?\n" +
                    "      ,[hire_date] = ?\n" +
                    " WHERE emp_no = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDate(1, Date.valueOf((LocalDate) employee.getBirthDate()));
            ps.setString(2, employee.getFirstName());
            ps.setString(3, employee.getLastName());
            ps.setString(4, employee.getGender());
            ps.setDate(5, Date.valueOf((LocalDate) employee.getHireDate()));
            ps.setInt(6, employee.getEmpNo());
            return ps.executeUpdate() > 0;
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Employee findById(int empNo) {
        try (Connection connection = JdbcConnection.getConnection()){
            String sql = "SELECT * FROM Employee where emp_no = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, empNo);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Employee employee = new Employee(rs.getInt(1), rs.getDate(2).toLocalDate(), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getDate(6).toLocalDate());
                return employee;
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean deleteById(int empNo) {
        try (Connection connection = JdbcConnection.getConnection()){
            String sql = "DELETE FROM [Employee] WHERE emp_no = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, empNo);
            return ps.executeUpdate() > 0;
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Employee> findEmployeeByPeriodOfTime(Date periodOfTime) {
        return null;
    }

    public boolean checkEmpNoExist(int empNo) {
        boolean check = false;
        try (Connection connection = JdbcConnection.getConnection()){
            String sql = "SELECT * FROM Employee where emp_no = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, empNo);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                check = true;
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return check;
    }
}
