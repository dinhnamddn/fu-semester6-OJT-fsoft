package fa.training.main;

import fa.training.dao.*;
import fa.training.entities.Department;
import fa.training.entities.Employee;
import fa.training.entities.WorkingHistory;
import fa.training.utils.ScannerUtils;

import java.time.LocalDate;
import java.util.List;
import java.util.Locale;

import static fa.training.utils.ScannerUtils.checkInt;

public class Main {
    public static void main(String[] args) {
        DepartmentDAO departmentDAO = new DepartmentDAOImpl();
        EmployeeDAO employeeDAO = new EmployeeDAOImpl();
        WorkingHistoryDAO workingHistoryDAO = new WorkingHistoryDAOImpl();

        while (true) {
            System.out.println("==========Employee Tracking==========");
            System.out.println("Employee management:");
            System.out.println("\t1. Add a new employee");
            System.out.println("\t2. List all employees");
            System.out.println("\t3. Update a specific employee");
            System.out.println("\t4. Find an employee by emp_no");
            System.out.println("\t5. Delete an employee by id");
            System.out.println("\t6. Add the working history");
            System.out.println("\t7. Find all the employees by working period of time");
            System.out.println("Department management:");
            System.out.println("\t8. Add a new department");
            System.out.println("9. Exit");

            int choice = checkInt("Enter your choice: ", 1, 9);
            switch (choice) {
                case 1:
                    System.out.println("\nAdd a new employee");
                    Employee employee = ScannerUtils.inputEmployee();
                    if (employeeDAO.save(employee)) {
                        System.out.println("Add new employee successful.");
                    } else {
                        System.out.println("Add new employee failed.");
                    }
                    break;
                case 2:
                    System.out.println("\nList all employees");
                    List<Employee> employeeList = employeeDAO.findAll();
                    for (Employee e : employeeList) {
                        System.out.println(e);
                    }
                    break;
                case 3:
                    System.out.println("\nUpdate a specific employee");
                    int empNo3;
                    while (true) {
                        empNo3 = ScannerUtils.checkInt("Enter emp_no:", 1, Integer.MAX_VALUE);
                        if (!employeeDAO.checkEmpNoExist(empNo3)) {
                            System.out.println("EmpNo is not exist.");
                            break;
                        } else {
                            Employee employee3 = ScannerUtils.inputEmployee();
                            employee3.setEmpNo(empNo3);
                            employeeDAO.update(employee3);
                            break;
                        }
                    }
                    break;
                case 4:
                    System.out.println("\nFind an employee by emp_no");
                    int empNo = ScannerUtils.checkInt("Enter emp_no: ", 1, Integer.MAX_VALUE);
                    Employee employee1 = employeeDAO.findById(empNo);
                    if (employee1 != null) {
                        System.out.println(employee1);
                    } else System.out.println("Employee not found");
                    break;
                case 5:
                    System.out.println("\nDelete an employee by id");
                    int empNo1 = ScannerUtils.checkInt("Enter emp_no: ", 1, Integer.MAX_VALUE);
                    if (employeeDAO.deleteById(empNo1)) {
                        System.out.println("Delete successful.");
                    } else {
                        System.out.println("Delete failed.");
                    }
                    break;
                case 6:
                    System.out.println("\nAdd the working history");
                    int depNo6 = -1;
                    int empNo6 = -1;
                    while (true) {
                        depNo6 = ScannerUtils.checkInt("Enter dep_no: ", 1, Integer.MAX_VALUE);
                        if (!departmentDAO.checkDeptNoExist(depNo6)) {
                            System.out.println("DeptNo is not exist.");
                        } else {
                            break;
                        }
                    }

                    while (true) {
                        empNo6 = ScannerUtils.checkInt("Enter emp_no: ", 1, Integer.MAX_VALUE);
                        if (!employeeDAO.checkEmpNoExist(empNo6)) {
                            System.out.println("DeptNo is not exist.");
                        } else {
                            break;
                        }
                    }
                    LocalDate fromDate = ScannerUtils.checkDate("Enter from date: ", "yyyy-MM-dd");
                    LocalDate toDate = ScannerUtils.checkDate("Enter to date: ", "yyyy-MM-dd");
                    WorkingHistory workingHistory = new WorkingHistory(depNo6, empNo6, fromDate, toDate);
                    if (workingHistoryDAO.save(workingHistory)) {
                        System.out.println("Save successful");
                    } else {
                        System.out.println("Save failed");
                    }
                    break;
                case 7:
                    System.out.println("\nFind all the employees by working period of time");
                    break;
                case 8:
                    System.out.println("\nAdd a new department");
                    Department department = ScannerUtils.inputDepartment();
                    if (departmentDAO.save(department)) {
                        System.out.println("Add new employee successful.");
                    } else {
                        System.out.println("Add new employee failed.");
                    }
                    break;
                case 9:
                    return;
            }
        }
    }
}
