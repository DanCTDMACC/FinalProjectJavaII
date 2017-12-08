package model;

import java.util.List;

public interface GradeTypeDao {
	
	public GradeType findGradeTypeById(int id);
	public List<GradeType> findAllGradeType();
	
}
