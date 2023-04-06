package fa.training.controllers;

import fa.training.dao.AccountDAO;
import fa.training.models.Account;
import lombok.SneakyThrows;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
    }

    @SneakyThrows
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        AccountDAO accDAO = new AccountDAO();
        Account account = accDAO.getAccountByUserName(username);
        if(!account.getPassword().equals(password)){
            request.setAttribute("mess", "Login failed!");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("account", account);
            response.sendRedirect("dashboard");
        }
    }
}
