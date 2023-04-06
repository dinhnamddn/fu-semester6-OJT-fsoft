package fa.training.dao;

import fa.training.entity.Account;

public interface AccountDAO {
    public boolean checkLogin(Account account);

    public boolean checkActive(String account);

    public boolean add(Account account);

    public boolean checkAccountUnique(String account);

    public boolean checkEmailUnique(String email);

    public boolean deleteByIdEmp(int idEmp);

    public boolean updateStatus(int id, int status);

    public Account findByIdEmp(int idEmp);

}
