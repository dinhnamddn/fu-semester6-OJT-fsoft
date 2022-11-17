//        Write a Java class “Employee” containing information name, id, address, salary etc. Write necessary constructor
//        and read/write methods. Create a class “Department” that has a name, location etc. The “Department ”
//        contains a number of “Employee”. Write methods “add” and “remove” to add and remove an employee
//        to/from this department. Write a main() function and create “Information Technology” department.
//        Add five employees and print yearly expenditure for this department.

package fa.training.ex1;

import java.util.ArrayList;
import java.util.List;

public class main {
    public static void main(String[] args) {
        List<Employee> em = new ArrayList<>();
        em.add(new Employee("A", 1, "HN", 1234));
        em.add(new Employee("B", 2, "HN", 1235));
        em.add(new Employee("C", 3, "HN", 1236));
        em.add(new Employee("D", 4, "HN", 1237));
        em.add(new Employee("E", 5, "HN", 1238));

        Department department = new Department("Information Technology", "FHO", em);

        department.addEmp(new Employee("AA", 6, "HCMC", 12));
        department.removeEmp(4);

//        System.out.println(department);
        System.out.println("\nYearly Expenditure for department " + department.name + " is : " + department.getYearlyExpenditure());
    }
}
