package fa.training.dao;

import com.sun.org.apache.regexp.internal.RE;
import fa.training.entities.Department;
import fa.training.utils.JdbcConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DepartmentDAOImpl implements DepartmentDAO{
    @Override
    public boolean save(Department department) {
        try (Connection connection = JdbcConnection.getConnection()){
            String sql = "INSERT INTO [Department]([dept_name],[description]) VALUES(?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, department.getDeptName());
            ps.setString(2, department.getDescription());
            return ps.executeUpdate() > 0;
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean checkDeptNoExist(int deptNo) {
        boolean check = false;
        try (Connection connection = JdbcConnection.getConnection()){
            String sql = "SELECT * FROM Department WHERE dept_no = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, deptNo);
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
