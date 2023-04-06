package fa.training.entity;

public class Team {
    private int id;
    private String teamName;
    private String coachName;
    private int rank;

    public Team() {
    }

    public Team(int id, String teamName, String coachName, int rank) {
        this.id = id;
        this.teamName = teamName;
        this.coachName = coachName;
        this.rank = rank;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public String getCoachName() {
        return coachName;
    }

    public void setCoachName(String coachName) {
        this.coachName = coachName;
    }

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    @Override
    public String toString() {
        return "Team{" +
                "id=" + id +
                ", teamName='" + teamName + '\'' +
                ", coachName='" + coachName + '\'' +
                ", rank=" + rank +
                '}';
    }
}


