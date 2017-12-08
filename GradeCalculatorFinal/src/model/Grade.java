package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name = "grade")
public class Grade {

	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private int gradeid;
	private int accountid;
	private int year;
	private int semesterid;
	private String coursename;
	private int gradetypeid;
	private int credits;
	
	public Grade() {
		
	}

	public Grade(int gradeid, int accountid, int year, int semesterid, String coursename, int gradetypeid, int credits) {
		this.gradeid = gradeid;
		this.accountid = accountid;
		this.year = year;
		this.semesterid = semesterid;
		this.coursename = coursename;
		this.gradetypeid = gradetypeid;
		this.credits = credits;
	}

	public Grade(int accountid, int year, int semesterid, String coursename, int gradetypeid, int credits) {
		this.accountid = accountid;
		this.year = year;
		this.semesterid = semesterid;
		this.coursename = coursename;
		this.gradetypeid = gradetypeid;
		this.credits = credits;
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

	public int getSemesterid() {
		return semesterid;
	}

	public void setSemesterid(int semesterid) {
		this.semesterid = semesterid;
	}

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public int getGradetypeid() {
		return gradetypeid;
	}

	public void setGradetypeid(int gradetypeid) {
		this.gradetypeid = gradetypeid;
	}

	public int getCredits() {
		return credits;
	}

	public void setCredits(int credits) {
		this.credits = credits;
	}
}
