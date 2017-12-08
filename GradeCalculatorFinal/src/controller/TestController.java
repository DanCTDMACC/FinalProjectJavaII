package controller;

import model.Account;
import model.AccountDao;
import model.AccountDaoInDatabase;

public class TestController {
	
	public static void main(String[] args) {
		AccountDao dao = new AccountDaoInDatabase();
		Account accN = dao.findAccountById(3);
		
		System.out.println(accN);
	}
}
