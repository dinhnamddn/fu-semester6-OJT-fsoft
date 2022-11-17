package fa.training.exercise2;

public class EmployeeTest {
    public static void main(String[] args) {
        Employee emp1 = new Employee("abc", "def", 1234);
        Employee emp2 = new Employee("xyz", "tuv", 5678);

        System.out.println("Yearly salary before raise:");
        System.out.println("Employee 1: " + emp1.getYearlySalary());
        System.out.println("Employee 2: " + emp2.getYearlySalary());

        emp1.raiseSalary();
        emp2.raiseSalary();

        System.out.println("\nYearly salary after raise 10%:");
        System.out.println("Employee 1: " + emp1.getYearlySalary());
        System.out.println("Employee 2: " + emp2.getYearlySalary());
    }
}
