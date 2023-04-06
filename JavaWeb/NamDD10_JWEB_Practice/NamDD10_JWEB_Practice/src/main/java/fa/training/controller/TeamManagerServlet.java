package fa.training.controller;

import fa.training.dao.impl.TeamDAOimpl;
import fa.training.entity.Team;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "TeamManagerServlet", value = "/team-list")
public class TeamManagerServlet extends HttpServlet {
    private TeamDAOimpl dao = new TeamDAOimpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("teams", dao.getAll());
        int mess = 0;
        int numberTeam = dao.countTeam();
        if(numberTeam>=16) {
            mess = 1;
        }
        request.setAttribute("mess", mess);
        request.getRequestDispatcher("team-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String teamName = request.getParameter("team_name");
        String coachName = request.getParameter("coach_name");
        int rank = Integer.parseInt( request.getParameter("rank"));
        Team t = new Team(0, teamName, coachName, rank);
        dao.addNewTeam(t);
        response.sendRedirect("team-list");
    }
}
