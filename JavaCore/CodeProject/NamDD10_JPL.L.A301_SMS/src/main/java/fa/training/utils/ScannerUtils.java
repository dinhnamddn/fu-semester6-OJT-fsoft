package fa.training.utils;

import com.sun.org.apache.xpath.internal.operations.Or;
import fa.training.dao.CustomerDAO;
import fa.training.dao.CustomerDAOImpl;
import fa.training.dao.OrderDAO;
import fa.training.dao.OrderDAOImpl;
import fa.training.entities.Customer;
import fa.training.entities.LineItem;
import fa.training.entities.Order;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Scanner;

public class ScannerUtils {
    static Scanner sc = new Scanner(System.in);

    public static int CheckInt(String Mess, int Min, int Max) {
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

    public static double CheckDouble(String Mess, double Min, double Max) {
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

    public static Customer inputCustomer() throws SQLException {
        int cusID = -1;

        do {
            cusID = CheckInt("Enter customer ID: ", 1, Integer.MAX_VALUE);
        } while (checkCustomerExist(cusID));

        String cusName = checkInputString("Enter customer name: ", "[a-zA-Z]*");
        Customer customer = new Customer(cusID, cusName);
        return customer;
    }

    public static Order inputOrder() throws SQLException {
        int orderID = -1;

        do {
            orderID = CheckInt("Enter order ID: ", 1, Integer.MAX_VALUE);
        }while (checkOrderExist(orderID));

        LocalDate orderDate = checkDate("Enter order date: ", "dd/MM/yyyy");
        int cusID = -1;

        do {
            cusID = CheckInt("Enter customer ID: ", 1, Integer.MAX_VALUE);
        } while (!checkCustomerExist(cusID));

        int empID = CheckInt("Enter employee ID: ", 1, Integer.MAX_VALUE);
        double total = CheckDouble("Enter total: ", 0, Double.MAX_VALUE);

        Order order = new Order(orderID, orderDate, cusID, empID, total);
        return order;
    }

    public static LineItem inputItem() throws SQLException {
        int orderID = -1;

        do {
            orderID = CheckInt("Enter order ID: ", 1, Integer.MAX_VALUE);
        }while (!checkOrderExist(orderID));

        int proID = CheckInt("Enter product ID: ", 1, Integer.MAX_VALUE);
        int quantity = CheckInt("Enter quantity: ", 1, Integer.MAX_VALUE);
        double price = CheckDouble("Enter price: ", 0, Double.MAX_VALUE);

        LineItem lineItem = new LineItem(orderID, proID, quantity, price);
        return lineItem;
    }


    public static boolean checkCustomerExist(int customerID) throws SQLException {
        CustomerDAO customerDAO = new CustomerDAOImpl();
        if (customerDAO.getCustomerByID(customerID) == null) {
            return false;
        }
        return true;
    }

    public static boolean checkOrderExist(int orderID) throws SQLException {
        OrderDAO orderDAO = new OrderDAOImpl();
        if (orderDAO.getOrderByID(orderID) == null) {
            return false;
        }
        return true;
    }
}
