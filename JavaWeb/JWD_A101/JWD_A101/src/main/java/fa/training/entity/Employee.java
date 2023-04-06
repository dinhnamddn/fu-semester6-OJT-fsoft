package fa.training.entity;

import java.sql.Date;

public class Employee {
    private int empId;
    private String firstName;
    private String lastName;
    private int gender;
    private Date birthDate;
    private String phone;
    private String address;
    private String deptName;
    private String remark;

    public Employee() {
    }

    public Employee(String firstName, String lastName, int gender, Date birthDate, String phone, String address, String deptName, String remark) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.birthDate = birthDate;
        this.phone = phone;
        this.address = address;
        this.deptName = deptName;
        this.remark = remark;
    }

    public Employee(int empId, String firstName, String lastName, int gender, Date birthDate, String phone, String address, String deptName, String remark) {
        this.empId = empId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.birthDate = birthDate;
        this.phone = phone;
        this.address = address;
        this.deptName = deptName;
        this.remark = remark;
    }

    public int getEmpId() {
        return empId;
    }

    public void setEmpId(int empId) {
        this.empId = empId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "empId=" + empId +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", gender=" + gender +
                ", birthDate=" + birthDate +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", deptName='" + deptName + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
