package model;

public interface AccountDao {
	public void insertAccount(Account account);
	public void deleteAccountById(int id);
	public void updateAccount(Account account);
	public Account findAccountByEmail(String email);
	public Account findAccountById(int id);
}
