package fa.training.controllers;

import fa.training.dao.AccountDAO;
import fa.training.dao.EmployeeDAO;
import fa.training.models.Account;
import fa.training.models.Employee;
import lombok.SneakyThrows;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet("/add")
public class AddEmployeeServlet extends HttpServlet {
    @SneakyThrows
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session =request.getSession();
        Account account  = (Account) session.getAttribute("account");
        EmployeeDAO emDAO = new EmployeeDAO();
        Employee employee = emDAO.getEmpByID(account.getEmployee().getEmployeeId());
        request.setAttribute("employee", employee);
        request.getRequestDispatcher("/WEB-INF/views/addEmployee.jsp").forward(request, response);
    }

    @SneakyThrows
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountDAO accDAO = new AccountDAO();
        EmployeeDAO emDAO = new EmployeeDAO();

        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String phone = request.getParameter("phone");
        String dateofbirth = request.getParameter("dateofbirth");
        String gender = request.getParameter("gender");
        String account = request.getParameter("account");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        int status = Integer.parseInt(request.getParameter("status"));
        String department = request.getParameter("department");
        String remark = request.getParameter("remark");
        int sex = 1;

        if (gender.equalsIgnoreCase("Female")) {
            sex = 0;
        } else if (gender.equalsIgnoreCase("Male")) {
            sex = 1;
        }

        Account acc = accDAO.getAccountByUserName(account);
        if (acc != null) {
            request.setAttribute("mess", "Account is existed!");
            request.getRequestDispatcher("/WEB-INF/views/addEmployee.jsp").forward(request, response);
        }

        emDAO.addEmployee(new Employee(0, firstname, lastname, sex, LocalDate.parse(dateofbirth, DateTimeFormatter.ofPattern("dd/MM/yyyy")),
                phone, address, department, remark));

        List<Employee> listEm = emDAO.getListEm();
        Employee employee = listEm.get(listEm.size() - 1);

        accDAO.addAccount(new Account(0, account, email, password, status, employee));

        response.sendRedirect("/dashboard");
    }
}
