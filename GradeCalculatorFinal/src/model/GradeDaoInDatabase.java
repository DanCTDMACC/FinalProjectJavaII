package model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

public class GradeDaoInDatabase implements GradeDao {
	EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("GradeCalculatorFinal");

	@Override
	public void insertGrade(Grade gradeToInsert) {
		// Create EntityManager from the factory to work with database.
		EntityManager eManager = emFactory.createEntityManager();
		
		// Start connecting with the database.
		eManager.getTransaction().begin();
		
		// Insert the grade to the database.
		eManager.persist(gradeToInsert);
		eManager.getTransaction().commit();
		
		// Clean the memory.
		eManager.close();
	}

	@Override
	public void deleteGradeById(int idToDelete) {
		// Create EntityManager from the factory to work with database.
		EntityManager eManager = emFactory.createEntityManager();
		
		// Start connecting with the database.
		eManager.getTransaction().begin();
		
		// Find the grade with id.
		Grade gradeToRemove = eManager.find(Grade.class, idToDelete);
		eManager.remove(gradeToRemove);
		eManager.getTransaction().commit();
		
		// Clean the memory.
		eManager.close();
	}

	@Override
	public void updateGrade(Grade gradeToUpdate) {
		// Create EntityManager from the factory to work with database.
		EntityManager eManager = emFactory.createEntityManager();
		
		// Start connecting with the database.
		eManager.getTransaction().begin();
		
		// Find the account with id.
		Grade gradeUpdating = eManager.find(Grade.class, gradeToUpdate.getGradeid());
		
		// Updating new information and commit.
		gradeUpdating.setYear(gradeToUpdate.getYear());
		gradeUpdating.setSemesterid(gradeToUpdate.getSemesterid());
		gradeUpdating.setGradetypeid(gradeToUpdate.getGradetypeid());
		gradeUpdating.setCredits(gradeToUpdate.getCredits());
		eManager.getTransaction().commit();
		
		// Clean the memory.
		eManager.close();
	}

	@Override
	public List<Grade> findGradeByAccountId(int accountIdToFind) {
		// Create EntityManager from the factory to work with database.
		EntityManager eManager = emFactory.createEntityManager();
		List<Grade> grades = null;
		
		// Start connecting with the database.
		eManager.getTransaction().begin();
		
		// Find all grades by account id.
		TypedQuery<Grade> typedQuery = eManager.createQuery("SELECT gr FROM Grade gr "
				+ "WHERE gr.accountid = :accountid ORDER BY gr.year", Grade.class);
		typedQuery.setParameter("accountid", accountIdToFind);
		try {
			grades = typedQuery.getResultList();
		} catch (Exception e) {
			grades = null;
		} finally {
			// Clean the memory.
			eManager.close();
		}
		return grades;
	}

	@Override
	public List<Grade> findGradeByAccountIdInPeriod(int accountIdToFind, int fromYear,
						int toYear, int fromSemesterId, int toSemesterId) {
		// Create EntityManager from the factory to work with database.
		EntityManager eManager = emFactory.createEntityManager();
		List<Grade> grades = null;
		
		// Start connecting with the database.
		eManager.getTransaction().begin();
		
		// Find all grades by account id.
		TypedQuery<Grade> typedQuery = eManager.createQuery("SELECT gr FROM Grade gr "
				+ "WHERE (gr.accountid = :accountid) AND "
				+ "(gr.year * 10 + gr.semesterid >= :from) AND "
				+ "(gr.year * 10 + gr.semesterid <= :to) "
				+ "ORDER BY gr.year", Grade.class);
		typedQuery.setParameter("accountid", accountIdToFind);
		typedQuery.setParameter("from", fromYear * 10 + fromSemesterId);
		typedQuery.setParameter("to", toYear * 10 + toSemesterId);
		try {
			grades = typedQuery.getResultList();
		} catch (Exception e) {
			grades = null;
		} finally {
			// Clean the memory.
			eManager.close();
		}
		return grades;
	}

	@Override
	public Grade findGradetById(int idToFind) {
		// Create EntityManager from the factory to work with database.
		EntityManager eManager = emFactory.createEntityManager();
		
		// Start connecting with the database.
		eManager.getTransaction().begin();
		
		// Find the Grade with id.
		Grade gradeFound = eManager.find(Grade.class, idToFind);
		
		// Clean the memory.
		eManager.close();
		
		return gradeFound;
	}

}
