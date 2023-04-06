package fa.training.entity;

public class Account {
    private int accId;
    private Employee empId;
    private String account;
    private String email;
    private String password;
    private int status;

    public Account() {
    }

    public Account(String account, String password) {
        this.account = account;
        this.password = password;
    }

    public Account(String account, String email, int status) {
        this.account = account;
        this.email = email;
        this.status = status;
    }

    public Account(Employee empId, String account, String email, String password, int status) {
        this.empId = empId;
        this.account = account;
        this.email = email;
        this.password = password;
        this.status = status;
    }

    public Account(int accId, Employee empId, String account, String email, String password, int status) {
        this.accId = accId;
        this.empId = empId;
        this.account = account;
        this.email = email;
        this.password = password;
        this.status = status;
    }

    public int getAccId() {
        return accId;
    }

    public void setAccId(int accId) {
        this.accId = accId;
    }

    public Employee getEmpId() {
        return empId;
    }

    public void setEmpId(Employee empId) {
        this.empId = empId;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Account{" +
                "accId=" + accId +
                ", empId=" + empId +
                ", account='" + account + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", status=" + status +
                '}';
    }
}
