package fa.training.controller;

import fa.training.dao.impl.AccountDAOImpl;
import fa.training.entity.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = {"/login", "/logout"})

public class UserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        switch (request.getServletPath()) {
            case "/login":
                request.getRequestDispatcher("WEB-INF/view/login.jsp").forward(request, response);
                break;
            case "/logout":
                request.getSession().invalidate();
                response.sendRedirect(request.getContextPath() + "/login");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        switch (request.getServletPath()) {
            case "/login":
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String message = "";
                AccountDAOImpl accountDAOImpl = new AccountDAOImpl();
                Account accountLogin = new Account(username, password);
                if (accountDAOImpl.checkLogin(accountLogin)) {
                    if (accountDAOImpl.checkActive(username)) {
                        HttpSession session = request.getSession();
                        session.setAttribute("username", username);
                        message = "success";
                    } else {
                        message = "not_active";
                    }
                } else {
                    message = "fail";
                }
                String content = "{\"message\":\"" + message + "\"}";
                response.setContentType("application/json");
                response.getWriter().write(content);
                break;
            case "/logout":
                request.getSession().invalidate();
                response.sendRedirect(request.getContextPath() + "/login");
                break;
        }

    }
}
