package fa.training.dao;

import fa.training.entity.Team;

import java.util.ArrayList;

public interface TeamDAO {

    public ArrayList<Team> getAll();
    public Team getTeam(int id);
    public int countTeam();
    public boolean addNewTeam(Team team);
    public boolean editTeam(Team team);
    public boolean deleteTeam(int id);
}
