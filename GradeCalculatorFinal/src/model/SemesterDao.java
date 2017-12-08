package model;

import java.util.List;

public interface SemesterDao {
	
	public Semester findSemesterById(int id);
	public List<Semester> findAllSemester();

}
