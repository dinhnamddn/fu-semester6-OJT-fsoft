package fa.training.controller;

import fa.training.dao.impl.TeamDAOimpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DeleteTeamServlet", value = "/delete")
public class DeleteTeamServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        TeamDAOimpl dao = new TeamDAOimpl();
        dao.deleteTeam(id);
        response.sendRedirect("team-list");
    }
}
