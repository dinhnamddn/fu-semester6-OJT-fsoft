package fa.training.dao;

import fa.training.models.Employee;
import fa.training.utils.DatabaseUtils;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {

    public Employee getEmpByID(int emID) throws SQLException {
        Employee employee = null;
        try (Connection connection = DatabaseUtils.getConnection()) {
            String sql = "select * from employee where employee_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, emID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                employee = new Employee(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getInt(4), rs.getDate(5).toLocalDate(),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        return employee;
    }

    public List<Employee> getListEm() throws SQLException{
        List<Employee> listEm = new ArrayList<>();
        String sql = "select * from employee";
        try (Connection connection = DatabaseUtils.getConnection()) {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listEm.add(new Employee(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getInt(4), rs.getDate(5).toLocalDate(),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9)));
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return listEm;
    }

    public List<Employee> getListEmByName(String key) throws SQLException {
        List<Employee> listEm = new ArrayList<>();
        try (Connection connection = DatabaseUtils.getConnection()) {
            String sql = "select * from employee where firs_tname like ? or last_name like ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + key + "%");
            ps.setString(2, "%" + key + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listEm.add(new Employee(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getInt(4), rs.getDate(5).toLocalDate(),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9)));
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return listEm;
    }

    public List<Employee> getListEmByEmID(String emID) throws SQLException{
        List<Employee> listEm = new ArrayList<>();
        try (Connection connection = DatabaseUtils.getConnection()){
            String sql = "select * from employee where employee_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, emID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listEm.add(new Employee(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getInt(4), rs.getDate(5).toLocalDate(),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9)));
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return listEm;
    }

    public List<Employee> getListEmByEmDepart(String key) throws SQLException {
        List<Employee> listEm = new ArrayList<>();
        try (Connection connection = DatabaseUtils.getConnection()){
            String sql = "select * from employee where department_name like ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + key + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listEm.add(new Employee(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getInt(4), rs.getDate(5).toLocalDate(),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9)));
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return listEm;
    }

    public boolean addEmployee(Employee employee) throws SQLException{
        try (Connection connection = DatabaseUtils.getConnection()){
            String sql = "insert into employee ([first_name]\n"
                    + "           ,[last_name]\n"
                    + "           ,[gender]\n"
                    + "           ,[date_of_birth]\n"
                    + "           ,[phone]\n"
                    + "           ,[address]\n"
                    + "           ,[department_name]\n"
                    + "           ,[remark]) values (?,?,?,?,?,?,?,?) ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, employee.getFirstName());
            ps.setString(2, employee.getLastName());
            ps.setInt(3, employee.getGender());
            ps.setDate(4, Date.valueOf((LocalDate) employee.getDateOfBirth()));
            ps.setString(5, employee.getPhone());
            ps.setString(6, employee.getAddress());
            ps.setString(7, employee.getDepartmentName());
            ps.setString(8, employee.getRemark());
            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException e) {
            return false;
        }

    }

    public boolean deteleEm(int emID) throws SQLException{
        try (Connection connection = DatabaseUtils.getConnection()){
            String sql = "delete from employee where employee_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, emID);
            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException e) {
            return false;
        }
    }
}
