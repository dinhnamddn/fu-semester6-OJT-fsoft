package fa.training.utils;

public class SQLConstant {
    public static final String CHECK_LOGIN = "SELECT * FROM Account WHERE account = ? AND password = ?";
    public static final String CHECK_ACTIVE = "SELECT * FROM Account WHERE account = ? AND status = 1";
    public static final String ADD_EMPLOYEE = "INSERT INTO Employee (first_name, last_name, gender, date_of_birth, phone, address, department_name, remark) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    public static final String ADD_ACCOUNT = "INSERT INTO Account (account, email, password, status, employee_id) VALUES (?, ?, ?, ?, ?)";
    public static final String GET_LAST_ID_EMPLOYEE = "SELECT SCOPE_IDENTITY() AS employee_id";
    public static final String GET_EMPLOYEE_BY_ID = "SELECT * FROM Employee WHERE employee_id = ?";
    public static final String CHECK_ACCOUNT_UNIQUE = "SELECT * FROM Account WHERE account = ?";
    public static final String CHECK_EMAIL_UNIQUE = "SELECT * FROM Account WHERE email = ?";
    public static final String ACCOUNT_BY_ID_EMP = "SELECT * FROM Account WHERE employee_id = ?";
    public static final String DELETE_ACCOUNT_BY_ID_EMP = "DELETE FROM Account WHERE employee_id = ?";
    public static final String DELETE_EMPLOYEE = "DELETE FROM Employee WHERE employee_id = ?";
    public static final String UPDATE_EMPLOYEE = "UPDATE Employee SET first_name = ?, last_name = ?, gender = ?, date_of_birth = ?, phone = ?, address = ?, department_name = ?, remark = ? WHERE employee_id = ?";
    public static final String UPDATE_STATUS = "UPDATE Account SET status = ? WHERE employee_id = ?";
}
