package fa.training.controller;

import fa.training.dao.impl.TeamDAOimpl;
import fa.training.entity.Team;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "EditTeamServlet", value = "/edit")
public class EditTeamServlet extends HttpServlet {
    private TeamDAOimpl dao = new TeamDAOimpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Team t = dao.getTeam(id);
        request.setAttribute("team", t);
        request.setAttribute("teams", dao.getAll());
        request.getRequestDispatcher("edit-team.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String teamName = request.getParameter("team_name");
        String coachName = request.getParameter("coach_name");
        int rank = Integer.parseInt( request.getParameter("seed"));
        Team t = new Team(id, teamName, coachName, rank);
        dao.editTeam(t);
        response.sendRedirect("team-list");
    }
}
