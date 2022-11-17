package fa.training.dao;

import fa.training.entities.WorkingHistory;
import fa.training.utils.JdbcConnection;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;

public class WorkingHistoryDAOImpl implements WorkingHistoryDAO{
    @Override
    public boolean save(WorkingHistory workingHistory) {
        try (Connection connection = JdbcConnection.getConnection()){
            String sql = "INSERT INTO [Working_History]([dept_no],[emp_no],[from_date],[to_date]) VALUES(?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, workingHistory.getDeptNo());
            ps.setInt(2, workingHistory.getEmpNo());
            ps.setDate(3, Date.valueOf((LocalDate) workingHistory.getFromDate()));
            ps.setDate(4, Date.valueOf((LocalDate) workingHistory.getToDate()));
            return ps.executeUpdate() > 0;
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
