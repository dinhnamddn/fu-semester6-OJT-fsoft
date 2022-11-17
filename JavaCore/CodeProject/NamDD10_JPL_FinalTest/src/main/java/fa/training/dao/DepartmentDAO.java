package fa.training.dao;

import fa.training.entities.Department;

public interface DepartmentDAO {
    boolean save(Department department);

    boolean checkDeptNoExist(int deptNo);
}
