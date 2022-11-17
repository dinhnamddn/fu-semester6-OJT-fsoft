package fa.training.main;

import fa.training.dao.*;
import fa.training.entities.Customer;
import fa.training.entities.LineItem;
import fa.training.entities.Order;
import fa.training.entities.OrderHistory;
import fa.training.utils.ScannerUtils;

import java.sql.SQLException;
import java.util.List;

import static fa.training.utils.ScannerUtils.*;


public class SaleManagement {
    public static void main(String[] args) throws SQLException {
        CustomerDAO customerDAO = new CustomerDAOImpl();
        OrderDAO orderDAO = new OrderDAOImpl();
        ListItemDAO listItemDAO = new ListItemDAOImpl();
        OrderHistoryDAO orderHistoryDAO = new OrderHistoryDAOImpl();

        while (true) {
            System.out.println("==========SALE MANAGEMENT==========");
            System.out.println("1. Add a customer");
            System.out.println("2. Add an order");
            System.out.println("3. Add a lineitem");
            System.out.println("4. List all order for a customer");
            System.out.println("5. List all lineitem for an order");
            System.out.println("6. List all customer");
            System.out.println("7. List all order history for a customer");
            System.out.println("8. Compute order total for a order");
            System.out.println("9. Update customer");
            System.out.println("10. Delete customer");
            System.out.println("11. Exit");

            int choice = CheckInt("Enter your choice: ", 1, 11);
            switch (choice) {
                case 1:
                    System.out.println("\nAdd a customer");
                    Customer customer1 = ScannerUtils.inputCustomer();
                    customerDAO.addCustomer(customer1);
                    System.out.println("Add successful");
                    break;
                case 2:
                    System.out.println("\nAdd an order");
                    Order order = ScannerUtils.inputOrder();
                    orderDAO.addOrder(order);
                    System.out.println("Add successful");
                    break;
                case 3:
                    System.out.println("\nAdd a lineitem");
                    LineItem lineItem = ScannerUtils.inputItem();
                    listItemDAO.addLineItem(lineItem);
                    System.out.println("Add successful");
                    break;
                case 4:
                    System.out.println("\nList all order for a customer");
                    int cusID = -1;

                    do {
                        cusID = CheckInt("Enter customer ID: ", 1, Integer.MAX_VALUE);
                    } while (!checkCustomerExist(cusID));

                    List<Order> listOrder = orderDAO.getALlOrdersByCustomerID(cusID);
                    if (listOrder.isEmpty()) {
                        System.out.println("Customer is not order before.");
                        break;
                    }
                    for (Order o : listOrder) {
                        System.out.println(o);
                    }
                    break;
                case 5:
                    System.out.println("\nList all lineitem for an order");
                    int orderID = -1;

                    do {
                        orderID = CheckInt("Enter order ID: ", 1, Integer.MAX_VALUE);
                    } while (!checkOrderExist(orderID));

                    List<LineItem> listItems = listItemDAO.getAllItemsByOrderId(orderID);
                    for (LineItem l : listItems) {
                        System.out.println(l);
                    }
                    break;
                case 6:
                    System.out.println("\nList all customer.");
                    List<Customer> listCus = customerDAO.getAllCustomer();
                    for (Customer c : listCus) {
                        System.out.println(c);
                    }
                    break;
                case 7:
                    System.out.println("\nList all order history for a customer");
                    int cusID2 = -1;

                    do {
                        cusID2 = CheckInt("Enter customer ID: ", 1, Integer.MAX_VALUE);
                    } while (!checkCustomerExist(cusID2));

                    List<OrderHistory> orderHistoryList = orderHistoryDAO.getOrderHistory(cusID2);
                    if (orderHistoryList.isEmpty()) {
                        System.out.println("Customer is not order before.");
                        break;
                    }
                    for (OrderHistory oh : orderHistoryList) {
                        System.out.println(oh);
                    }
                    break;
                case 8:
                    System.out.println("\nCompute order total for a order");
                    int orderID2 = -1;

                    do {
                        orderID2 = CheckInt("Enter order ID: ", 1, Integer.MAX_VALUE);
                    } while (!checkOrderExist(orderID2));

                    Double totalPrice = listItemDAO.computeOrderTotal(orderID2);
                    System.out.println("Total price: " + totalPrice);
                    break;
                case 9:
                    System.out.println("\nUpdate customer");
                    int cusID3 = -1;

                    do {
                        cusID3 = CheckInt("Enter customer ID: ", 1, Integer.MAX_VALUE);
                    } while (!checkCustomerExist(cusID3));

                    String cusName = ScannerUtils.checkInputString("Enter new customer name: ", "[a-zA-Z]*");
                    Customer customer2 = new Customer(cusID3, cusName);
                    customerDAO.updateCustomer(customer2);
                    System.out.println("Update successful");
                    break;
                case 10:
                    System.out.println("\nDelete customer");
                    int cusID4 = CheckInt("Enter customer ID: ", 1, Integer.MAX_VALUE);
                    if (checkCustomerExist(cusID4)) {
                        customerDAO.deleteCustomer(cusID4);
                        System.out.println("Delete successful");
                    }
                    break;
                case 11:
                    return;
            }
        }
    }
}
