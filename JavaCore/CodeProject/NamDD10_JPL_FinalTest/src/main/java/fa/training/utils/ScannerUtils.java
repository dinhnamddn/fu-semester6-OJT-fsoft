package fa.training.utils;

import fa.training.entities.Department;
import fa.training.entities.Employee;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Scanner;

public class ScannerUtils {
    static Scanner sc = new Scanner(System.in);

    public static int checkInt(String Mess, int Min, int Max) {
        int num;

        do {
            System.out.print(Mess);
            try {
                num = Integer.parseInt(sc.nextLine());

                if (num >= Min && num <= Max) {
                    break;
                } else {
                    System.out.println("Out of range, Please enter from " + Min + " to " + Max);
                }
            } catch (Exception e) {
                System.out.println("Invalid, accept integer number only!");
            }
        } while (true);

        return num;
    }

    public static double checkDouble(String Mess, double Min, double Max) {
        double num;

        do {
            System.out.print(Mess);
            try {
                num = Double.parseDouble(sc.nextLine());

                if (num >= Min && num <= Max) {
                    break;
                } else {
                    System.out.println("Out of range, Please enter from " + Min + " to " + Max);
                }
            } catch (Exception e) {
                System.out.println("Invalid, accept integer number only!");
            }
        } while (true);

        return num;
    }

    public static String checkInputString(String Mess, String Regex) {
        String s;

        do {
            System.out.print(Mess);
            s = sc.nextLine();

            if (s.matches(Regex)) {
                break;
            }

            System.out.println("Wrong input, try gain!");
        } while (true);
        return s;
    }

    public static LocalDate checkDate(String Mess, String pattern) {
        String line;
        LocalDate value;
        System.out.printf(Mess);

        while (true) {
            try {
                line = sc.nextLine();
                value = LocalDate.parse(line, DateTimeFormatter.ofPattern(pattern));
                break;
            } catch (DateTimeParseException e) {
                System.out.println("Wrong input, please enter date by following: '" + pattern + "'");
            }
        }
        return value;
    }

    public static Employee inputEmployee() {
        LocalDate birthDate = checkDate("Enter birthday: ", "yyyy-MM-dd");
        String firstName = checkInputString("Enter fisrt name: ", "[a-zA-Z ]*");
        String lastName = checkInputString("Enter last name: ", "[a-zA-Z ]*");
        String gender = checkInputString("Enter gender (Gender must be F or M): ", "[FM]");
        LocalDate hireDate = checkDate("Enter hire date: ", "yyyy-MM-dd");
        Employee employee = new Employee(0, birthDate, firstName, lastName, gender, hireDate);
        return employee;
    }

    public static Department inputDepartment() {
        String deptName = checkInputString("Enter department name: ", "[a-zA-Z0-9 ]*");
        String description = checkInputString("Enter description: ", "[a-zA-Z0-9 ]*");
        Department department = new Department(0, deptName, description);
        return department;
    }
}
