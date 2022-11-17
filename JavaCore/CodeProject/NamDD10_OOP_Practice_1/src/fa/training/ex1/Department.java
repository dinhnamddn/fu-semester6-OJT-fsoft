package fa.training.ex1;

import java.util.Arrays;
import java.util.List;

public class Department {
    String name, location;
    List<Employee> emp;

    public Department() {
    }

    public Department(String name, String location, List<Employee> emp) {
        this.name = name;
        this.location = location;
        this.emp = emp;
    }

    public void addEmp(Employee employee) {
        this.emp.add(employee);
    }

    public void removeEmp(int id) {
        for (Employee employee : emp) {
            if (employee.getId() == id) {
                this.emp.remove(employee);
                return;
            }
        }
    }

    public double getYearlyExpenditure() {
        double sum = 0;
        for (Employee e : emp) {
            sum += e.getSalary();
        }
        return sum * 12;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public List<Employee> getEmp() {
        return emp;
    }

    public void setEmp(List<Employee> emp) {
        this.emp = emp;
    }

    @Override
    public String toString() {
        return "Department{" +
                "name='" + name + '\'' +
                ", location='" + location + '\'' +
                ", emp=" + emp +
                '}';
    }
}
