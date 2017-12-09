package controller;

import model.Account;
import model.AccountDao;
import model.AccountDaoInDatabase;

public class TestController {
	
	public static void main(String[] args) {
		GradeDaoInDatabase dao = new GradeDaoInDatabase();
		
		System.out.println(dao.findGradeAverageByAccountId(1));
	}
}
