package model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;

public class GradeToView {
//	@Autowired
//	GradeTypeDao gradeTypeDao;
//	@Autowired
//	SemesterDao semesterDao;
	
	private int gradeid;
	private int accountid;
	private int year;
	private int semesterid;
	private String semestername;
	private String coursename;
	private int gradetypeid;
	private String gradetypeletter;
	private int credits;
	
	public GradeToView(Grade gr) {
		SemesterDao semesterDao = new SemesterDaoInDatabase();
		GradeTypeDao gradeTypeDao = new GradeTypeDaoInDatabase();
		this.gradeid = gr.getGradeid();
		this.accountid = gr.getAccountid();
		this.year = gr.getYear();
		this.semestername = semesterDao.findSemesterById(gr.getSemesterid()).getName();
		this.coursename = gr.getCoursename();
		this.gradetypeletter = gradeTypeDao.findGradeTypeById(gr.getGradetypeid()).getLetter();
		this.credits = gr.getCredits();
	}

	public int getGradetypeid() {
		return gradetypeid;
	}

	public void setGradetypeid(int gradetypeid) {
		this.gradetypeid = gradetypeid;
	}

	public int getSemesterid() {
		return semesterid;
	}

	public void setSemesterid(int semesterid) {
		this.semesterid = semesterid;
	}

	public int getGradeid() {
		return gradeid;
	}

	public void setGradeid(int gradeid) {
		this.gradeid = gradeid;
	}

	public int getAccountid() {
		return accountid;
	}

	public void setAccountid(int accountid) {
		this.accountid = accountid;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public String getSemestername() {
		return semestername;
	}

	public void setSemestername(String semestername) {
		this.semestername = semestername;
	}

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public String getGradetypeletter() {
		return gradetypeletter;
	}

	public void setGradetypeletter(String gradetypeletter) {
		this.gradetypeletter = gradetypeletter;
	}

	public int getCredits() {
		return credits;
	}

	public void setCredits(int credits) {
		this.credits = credits;
	}

	@Bean
	public GradeTypeDao gradeTypeDao() {
		GradeTypeDao bean = new GradeTypeDaoInDatabase();
		return bean;
	}
	@Bean
	public SemesterDao semesterDao() {
		SemesterDao bean = new SemesterDaoInDatabase();
		return bean;
	}
}
