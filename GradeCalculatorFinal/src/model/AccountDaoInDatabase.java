package model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

public class AccountDaoInDatabase implements AccountDao {
	EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("GradeCalculatorFinal");
	
	@Override
	public void insertAccount(Account accToInsert) {
		// Create EntityManager from the factory to work with database.
		EntityManager eManager = emFactory.createEntityManager();
		
		// Start connecting with the database.
		eManager.getTransaction().begin();
		
		// Insert the account to the database.
		eManager.persist(accToInsert);
		eManager.getTransaction().commit();
		
		// Clean the memory.
		eManager.close();
	}

	@Override
	public void deleteAccountById(int id) {
		// Create EntityManager from the factory to work with database.
		EntityManager eManager = emFactory.createEntityManager();
		
		// Start connecting with the database.
		eManager.getTransaction().begin();
		
		// Find the account with id.
		Account accToRemove = eManager.find(Account.class, id);
		eManager.remove(accToRemove);
		eManager.getTransaction().commit();
		
		// Clean the memory.
		eManager.close();
	}

	@Override
	public void updateAccount(Account accToUpdate) {
		// Create EntityManager from the factory to work with database.
		EntityManager eManager = emFactory.createEntityManager();
		
		// Start connecting with the database.
		eManager.getTransaction().begin();
		
		// Find the account with id.
		Account accUpdating = eManager.find(Account.class, accToUpdate.getId());
		
		// Updating new information and commit.
		accUpdating.setLastname(accToUpdate.getLastname());
		accUpdating.setFirstname(accToUpdate.getFirstname());
		accUpdating.setPassword(accToUpdate.getPassword());
		eManager.getTransaction().commit();
		
		// Clean the memory.
		eManager.close();
	}

	@Override
	public Account findAccountByEmail(String emailToFind) {
		// Create EntityManager from the factory to work with database.
		EntityManager eManager = emFactory.createEntityManager();
		
		// Start connecting with the database.
		eManager.getTransaction().begin();
		
		// Find the account with email.
		TypedQuery<Account> typedQuery = eManager.createQuery("SELECT acc FROM Account acc "
				+ "WHERE acc.email = :email", Account.class);
		typedQuery.setParameter("email", emailToFind);
		Account accFound = null;
		try {
			accFound = typedQuery.getSingleResult();
		} catch (Exception e) {
			accFound = null;
		} finally {
			// Clean the memory.
			eManager.close();
		}
		return accFound;
	}

	@Override
	public Account findAccountById(int idToFind) {
		// Create EntityManager from the factory to work with database.
		EntityManager eManager = emFactory.createEntityManager();
		
		// Start connecting with the database.
		eManager.getTransaction().begin();
		
		// Find the account with id.
		Account accFound = eManager.find(Account.class, idToFind);
		
		// Clean the memory.
		eManager.close();
		
		return accFound;
	}

}
