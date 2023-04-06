package fa.training.controllers;

import fa.training.dao.AccountDAO;
import fa.training.dao.EmployeeDAO;
import lombok.SneakyThrows;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/delete")
public class DeleteEmployeeServlet extends HttpServlet {
    @SneakyThrows
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EmployeeDAO emDAO = new EmployeeDAO();
        AccountDAO accDAO = new AccountDAO();

        int emID = Integer.parseInt(request.getParameter("emID"));
        emDAO.deteleEm(emID);
        accDAO.deteteAccount(emID);
        response.sendRedirect("/dashboard");
    }
}
