package model;

import java.util.List;

public interface GradeDao {

	public void insertGrade(Grade grade);
	public void deleteGradeById(int id);
	public void updateGrade(Grade grade);
	public List<Grade> findGradeByAccountId(int accountId);
	public List<Grade> findGradeByAccountIdInPeriod(int accountIdToFind, int fromYear,
			int toYear, int fromSemesterId, int toSemesterId);
	public Grade findGradetById(int id);
}
