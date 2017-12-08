package model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

public class SemesterDaoInDatabase implements SemesterDao {
	EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("GradeCalculatorFinal");

	@Override
	public Semester findSemesterById(int idToFind) {
		// Create EntityManager from the factory to work with database.
		EntityManager eManager = emFactory.createEntityManager();
		
		// Start connecting with the database.
		eManager.getTransaction().begin();
		
		// Find the semester with id.
		Semester semesterFound = eManager.find(Semester.class, idToFind);
		
		// Clean the memory.
		eManager.close();
		
		return semesterFound;
	}

	@Override
	public List<Semester> findAllSemester() {
		// Create EntityManager from the factory to work with database.
		EntityManager eManager = emFactory.createEntityManager();
		List<Semester> semesters = null;
		
		// Start connecting with the database.
		eManager.getTransaction().begin();
		
		// Find all semesters.
		TypedQuery<Semester> typedQuery = eManager.createQuery("SELECT sem FROM Semester sem "
				+ "ORDER BY sem.id", Semester.class);
		try {
			semesters = typedQuery.getResultList();
		} catch (Exception e) {
			semesters = null;
		} finally {
			// Clean the memory.
			eManager.close();
		}
		return semesters;
	}

}
