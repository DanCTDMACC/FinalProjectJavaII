package model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

public class GradeTypeDaoInDatabase implements GradeTypeDao {
	EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("GradeCalculatorFinal");

	@Override
	public GradeType findGradeTypeById(int idToFind) {
		// Create EntityManager from the factory to work with database.
		EntityManager eManager = emFactory.createEntityManager();
		
		// Start connecting with the database.
		eManager.getTransaction().begin();
		
		// Find the grade type with id.
		GradeType gradeTypeFound = eManager.find(GradeType.class, idToFind);
		
		// Clean the memory.
		eManager.close();
		
		return gradeTypeFound;
	}

	@Override
	public List<GradeType> findAllGradeType() {
		// Create EntityManager from the factory to work with database.
		EntityManager eManager = emFactory.createEntityManager();
		List<GradeType> gradeTypes = null;
		
		// Start connecting with the database.
		eManager.getTransaction().begin();
		
		// Find all grade types.
		TypedQuery<GradeType> typedQuery = eManager.createQuery("SELECT gt FROM GradeType gt "
				+ "ORDER BY gt.id",
				GradeType.class);
		try {
			gradeTypes = typedQuery.getResultList();
		} catch (Exception e) {
			gradeTypes = null;
		} finally {
			// Clean the memory.
			eManager.close();
		}
		return gradeTypes;
	}

}
