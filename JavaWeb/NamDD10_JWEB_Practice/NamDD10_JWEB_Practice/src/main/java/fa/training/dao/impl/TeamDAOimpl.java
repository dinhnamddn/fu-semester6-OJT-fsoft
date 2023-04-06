package fa.training.dao.impl;

import fa.training.dao.TeamDAO;
import fa.training.entity.Team;
import fa.training.utils.ConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TeamDAOimpl implements TeamDAO {
    @Override
    public ArrayList<Team> getAll() {
        ArrayList<Team> list = new ArrayList<>();
        try (Connection conn = ConnectionUtil.getConnection()){
            String sql = "select * from Team";
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while(rs.next()) {
                int id = rs.getInt("id");
                String teamName = rs.getString("team_name");
                String coachName = rs.getString("coach_name");
                int rank = rs.getInt("rank");
                list.add(new Team(id, teamName, coachName, rank));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    @Override
    public Team getTeam(int id) {
        try (Connection conn = ConnectionUtil.getConnection()){
            String sql = "select * from Team where id = ?";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while(rs.next()) {
                String teamName = rs.getString("team_name");
                String coachName = rs.getString("coach_name");
                int rank = rs.getInt("rank");
                return new Team(id, teamName, coachName, rank);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public int countTeam() {
        String sql = "select count(*) from Team";
        try (Connection conn = ConnectionUtil.getConnection()){
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while(rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    @Override
    public boolean addNewTeam(Team team) {
        String sql = "INSERT INTO [dbo].[Team]\n" +
                "           ([team_name]\n" +
                "           ,[coach_name]\n" +
                "           ,[rank])\n" +
                "     VALUES\n" +
                "           (?,?,?)";
        try (Connection conn = ConnectionUtil.getConnection()){
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, team.getTeamName());
            pre.setString(2, team.getCoachName());
            pre.setInt(3, team.getRank());
            pre.executeUpdate();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean editTeam(Team team) {
        String sql = "UPDATE [dbo].[Team]\n" +
                "   SET [team_name] = ?\n" +
                "      ,[coach_name] = ?\n" +
                "      ,[rank] = ?\n" +
                " WHERE id = ?";
        try (Connection conn = ConnectionUtil.getConnection()){
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, team.getTeamName());
            pre.setString(2, team.getCoachName());
            pre.setInt(3, team.getRank());
            pre.setInt(4, team.getId());
            pre.executeUpdate();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteTeam(int id) {
        String sql = "DELETE FROM [dbo].[Team]\n" +
                "      WHERE id=  ?";
        try (Connection conn = ConnectionUtil.getConnection()){
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1,id);
            pre.executeUpdate();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
}
