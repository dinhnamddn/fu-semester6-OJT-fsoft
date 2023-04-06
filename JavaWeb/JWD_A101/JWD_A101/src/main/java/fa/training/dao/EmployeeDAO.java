package fa.training.dao;

import fa.training.entity.Employee;

import java.util.List;

public interface EmployeeDAO {
    public List<Employee> getAllEmployee(int pageIndex, int pageSize, String search, String searchBy);

    public int getTotalEmployee(String search, String searchBy);

    public int add(Employee employee);

    public boolean update(Employee employee);

    public boolean delete(int id);

    public Employee findById(int id);
}
