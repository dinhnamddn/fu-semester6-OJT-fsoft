package fa.training.controllers;

import fa.training.dao.EmployeeDAO;
import fa.training.models.Account;
import fa.training.models.Employee;
import lombok.SneakyThrows;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard")
public class EmployeeDashboardServlet extends HttpServlet {
    @SneakyThrows
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EmployeeDAO emDAO = new EmployeeDAO();
        List<Employee> listEm = emDAO.getListEm();
        request.setAttribute("listEm", listEm);
        HttpSession session = request.getSession();
        Account account =  (Account) session.getAttribute("account");
        Employee employee = emDAO.getEmpByID(account.getEmployee().getEmployeeId());
        request.setAttribute("employee", employee);
        request.getRequestDispatcher("/WEB-INF/views/employeeList.jsp").forward(request, response);
    }
}
