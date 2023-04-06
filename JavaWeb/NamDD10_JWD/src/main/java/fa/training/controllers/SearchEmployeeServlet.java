package fa.training.controllers;

import fa.training.dao.EmployeeDAO;
import fa.training.models.Employee;
import lombok.SneakyThrows;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/search")
public class SearchEmployeeServlet extends HttpServlet {
    @SneakyThrows
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String key = request.getParameter("key");
        int option = Integer.parseInt(request.getParameter("option"));
        EmployeeDAO emDAO = new EmployeeDAO();

        switch (option) {
            case 1: {
                if (key == null || key.isEmpty()) {
                    List<Employee> listEm = emDAO.getListEm();
                    request.setAttribute("listEm", listEm);
                    request.setAttribute("key", key);
                    request.setAttribute("option", option);
                    request.getRequestDispatcher("WEB-INF/views/employeeList.jsp").forward(request, response);
                } else {
                    List<Employee> listEm = emDAO.getListEmByName(key);
                    request.setAttribute("listEm", listEm);
                    request.setAttribute("key", key);
                    request.setAttribute("option", option);
                    request.getRequestDispatcher("WEB-INF/views/employeeList.jsp").forward(request, response);
                }
                break;
            }

            case 2: {
                if (key == null || key.isEmpty()) {
                    List<Employee> listEm = emDAO.getListEm();
                    request.setAttribute("listEm", listEm);
                    request.setAttribute("key", key);
                    request.setAttribute("option", option);
                    request.getRequestDispatcher("/WEB-INF/views/employeeList.jsp").forward(request, response);
                } else {
                    List<Employee> listEm = emDAO.getListEmByEmID(key);
                    request.setAttribute("listEm", listEm);
                    request.setAttribute("key", key);
                    request.setAttribute("option", option);
                    request.getRequestDispatcher("/WEB-INF/views/employeeList.jsp").forward(request, response);
                }
                break;
            }

            case 3: {
                if (key == null || key.isEmpty()) {
                    List<Employee> listEm = emDAO.getListEm();
                    request.setAttribute("listEm", listEm);
                    request.setAttribute("key", key);
                    request.setAttribute("option", option);
                    request.getRequestDispatcher("/WEB-INF/views/employeeList.jsp").forward(request, response);
                } else {
                    List<Employee> listEm = emDAO.getListEmByEmDepart(key);
                    request.setAttribute("listEm", listEm);
                    request.setAttribute("key", key);
                    request.setAttribute("option", option);
                    request.getRequestDispatcher("/WEB-INF/views/employeeList.jsp").forward(request, response);
                }
                break;
            }
        }
    }
}
