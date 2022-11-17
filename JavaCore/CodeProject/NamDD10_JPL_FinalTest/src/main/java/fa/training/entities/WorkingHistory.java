package fa.training.entities;

import java.sql.Date;
import java.time.LocalDate;

public class WorkingHistory {
    private int deptNo;
    private int empNo;
    private LocalDate fromDate;
    private LocalDate toDate;

    public WorkingHistory() {
    }

    public WorkingHistory(int deptNo, int empNo, LocalDate fromDate, LocalDate toDate) {
        this.deptNo = deptNo;
        this.empNo = empNo;
        this.fromDate = fromDate;
        this.toDate = toDate;
    }

    public int getDeptNo() {
        return deptNo;
    }

    public void setDeptNo(int deptNo) {
        this.deptNo = deptNo;
    }

    public int getEmpNo() {
        return empNo;
    }

    public void setEmpNo(int empNo) {
        this.empNo = empNo;
    }

    public LocalDate getFromDate() {
        return fromDate;
    }

    public void setFromDate(LocalDate fromDate) {
        this.fromDate = fromDate;
    }

    public LocalDate getToDate() {
        return toDate;
    }

    public void setToDate(LocalDate toDate) {
        this.toDate = toDate;
    }

    @Override
    public String toString() {
        return "WorkingHistory{" +
                "deptNo=" + deptNo +
                ", empNo=" + empNo +
                ", fromDate=" + fromDate +
                ", toDate=" + toDate +
                '}';
    }
}
