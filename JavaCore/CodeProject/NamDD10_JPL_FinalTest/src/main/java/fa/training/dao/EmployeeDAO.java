package fa.training.dao;

import fa.training.entities.Employee;

import java.sql.Date;
import java.util.List;

public interface EmployeeDAO {
    boolean save(Employee employee);

    List<Employee> findAll();

    boolean update(Employee employee);

    Employee findById(int empNo);

    boolean deleteById(int empNo);

    List<Employee> findEmployeeByPeriodOfTime(Date periodOfTime);

    boolean checkEmpNoExist(int empNo);
}
