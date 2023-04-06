package fa.training.controller;

import fa.training.dao.impl.AccountDAOImpl;
import fa.training.dao.impl.EmployeeDAOImpl;
import fa.training.entity.Account;
import fa.training.entity.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(urlPatterns = {"/home", "/employee-list", "/employee-add", "/check-account", "/check-email", "/search", "/delete", "/update-employee"})
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EmployeeDAOImpl employeeDAOImpl = new EmployeeDAOImpl();
        AccountDAOImpl accountDAOImpl = new AccountDAOImpl();
        final int PAGE_SIZE = 5;
        switch (request.getServletPath()) {
            case "/home":
            case "/employee-list":
                int pageIndex = 1;
                if (request.getParameter("pageIndex") != null) {
                    pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
                }
                int totalEmployee = employeeDAOImpl.getTotalEmployee("ALL", "ALL");
                int totalPage = (int) Math.ceil(totalEmployee * 1.0 / PAGE_SIZE);
                List<Employee> listEmployee = employeeDAOImpl.getAllEmployee(pageIndex, PAGE_SIZE, "ALL", "ALL");
                request.setAttribute("listEmployee", listEmployee);
                request.setAttribute("totalPage", totalPage);
                request.setAttribute("pageIndex", pageIndex);
                request.setAttribute("totalEmployee", totalEmployee);
                request.setAttribute("type", "listAll");
                request.getRequestDispatcher("WEB-INF/view/employeeList.jsp").forward(request, response);
                break;
            case "/employee-add":
                request.getRequestDispatcher("WEB-INF/view/addEmployee.jsp").forward(request, response);
                break;
            case "/search":
                int pageIndexSearch = 1;
                if (request.getParameter("pageIndexSearch") != null) {
                    pageIndexSearch = Integer.parseInt(request.getParameter("pageIndexSearch"));
                }
                String search = request.getParameter("userSearch");
                String searchBy = request.getParameter("filterBy");
                int totalEmployeeSearch = employeeDAOImpl.getTotalEmployee(search, searchBy);
                int totalPageSearch = (int) Math.ceil(totalEmployeeSearch * 1.0 / PAGE_SIZE);
                List<Employee> listEmployeeSearch = employeeDAOImpl.getAllEmployee(pageIndexSearch, PAGE_SIZE, search, searchBy);
                request.setAttribute("listEmployee", listEmployeeSearch);
                request.setAttribute("totalPageSearch", totalPageSearch);
                request.setAttribute("pageIndexSearch", pageIndexSearch);
                request.setAttribute("totalEmployee", totalEmployeeSearch);
                request.setAttribute("type", "search");
                request.setAttribute("search", search);
                request.setAttribute("searchBy", searchBy);
                request.getRequestDispatcher("WEB-INF/view/employeeList.jsp").forward(request, response);
                break;
            case "/delete":
                int idEmp = Integer.parseInt(request.getParameter("employee_id"));
                if (accountDAOImpl.deleteByIdEmp(idEmp)) {
                    if (employeeDAOImpl.delete(idEmp)) {
                        String messageDelete = "success";
                        String content = "{\"messageDelete\":\"" + messageDelete + "\"}";
                        response.setContentType("application/json");
                        response.getWriter().write(content);
                    }
                } else {
                    String messageDelete = "fail";
                    String content = "{\"messageDelete\":\"" + messageDelete + "\"}";
                    response.setContentType("application/json");
                    response.getWriter().write(content);
                }
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EmployeeDAOImpl employeeDAOImpl = new EmployeeDAOImpl();
        AccountDAOImpl accountDAOImpl = new AccountDAOImpl();
        String message = "";
        String content = "";
        switch (request.getServletPath()) {
            case "/employee-add":
                request.setCharacterEncoding("UTF-8");
                response.setCharacterEncoding("UTF-8");
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String account = request.getParameter("account");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                Date birthDate = Date.valueOf(request.getParameter("birthDate"));
                int gender = Integer.parseInt(request.getParameter("gender"));
                String password = request.getParameter("password");
                String address = request.getParameter("address");
                String department = request.getParameter("department");
                int status = Integer.parseInt(request.getParameter("status"));
                String remark = request.getParameter("remark");

                Employee employee = new Employee(firstName, lastName, gender, birthDate, phone, address, department, remark);
                int employeeId = employeeDAOImpl.add(employee);
                if(employeeId> 0) {
                    Employee employeeNew = employeeDAOImpl.findById(employeeId);
                    Account accountNew = new Account(employeeNew, account, email, password, status);
                    if(accountDAOImpl.add(accountNew)) {
                        final int PAGE_SIZE = 5;
                        int totalEmployee = employeeDAOImpl.getTotalEmployee("ALL", "ALL");
                        int totalPage = (int) Math.ceil(totalEmployee * 1.0 / PAGE_SIZE);
                        response.sendRedirect(request.getContextPath() + "/employee-list?pageIndex=" + totalPage);
                    }
                }
                break;
            case "/check-account":
                String accountCheck = request.getParameter("account");
                if(accountDAOImpl.checkAccountUnique(accountCheck)) {
                    message = "true";
                } else {
                    message = "false";
                }
                content = "{\"message\":\"" + message + "\"}";
                response.setContentType("application/json");
                response.getWriter().write(content);
                break;
            case "/check-email":
                String emailCheck = request.getParameter("email");
                if(accountDAOImpl.checkEmailUnique(emailCheck)) {
                    message = "true";
                } else {
                    message = "false";
                }
                content = "{\"message\":\"" + message + "\"}";
                response.setContentType("application/json");
                response.getWriter().write(content);
                break;
            case "/update-employee":
                request.setCharacterEncoding("UTF-8");
                response.setCharacterEncoding("UTF-8");
                int idEmp = Integer.parseInt(request.getParameter("idEmp"));
                String firstNameUpdate = request.getParameter("firstNameModal");
                String lastNameUpdate = request.getParameter("lastNameModal");
                Date birthDateUpdate = Date.valueOf(request.getParameter("birthDateModal"));
                int genderUpdate = Integer.parseInt(request.getParameter("genderModal"));
                String phoneUpdate = request.getParameter("phoneModal");
                String addressUpdate = request.getParameter("addressModal");
                String departmentUpdate = request.getParameter("departmentModal");
                String remarkUpdate = request.getParameter("remarkModal");
                int statusUpdate = Integer.parseInt(request.getParameter("statusModal"));
                Employee employeeUpdate = new Employee(idEmp ,firstNameUpdate, lastNameUpdate, genderUpdate, birthDateUpdate, phoneUpdate, addressUpdate, departmentUpdate, remarkUpdate);
                String messageUpdate = "";
                if(employeeDAOImpl.update(employeeUpdate) && accountDAOImpl.updateStatus(idEmp, statusUpdate)) {
                    messageUpdate = "success";
                } else {
                    messageUpdate = "fail";
                }
                content = "{\"messageUpdate\":\"" + messageUpdate + "\"}";
                response.setContentType("application/json");
                response.getWriter().write(content);
                break;
        }
    }
}
