package fa.training.controller;

import fa.training.dao.impl.TeamDAOimpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "GroupTeamServlet", value = "/group")
public class GroupTeamServlet extends HttpServlet {
    private TeamDAOimpl dao = new TeamDAOimpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String button = request.getParameter("button");

        if(button==null) {
            request.setAttribute("teams", dao.getAll());
            request.getRequestDispatcher("edit-team.jsp").forward(request, response);
        }else{
            request.setAttribute("teams", dao.getAll());

            int numberTeam = dao.countTeam();

        }
    }
}
