package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name = "gradetype")
public class GradeType {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column (name = "gradetypeid")
	private int id;
	private String letter;
	private double pointindex;
	
	public GradeType() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLetter() {
		return letter;
	}

	public void setLetter(String letter) {
		this.letter = letter;
	}

	public double getPointIndex() {
		return pointindex;
	}

	public void setPointIndex(double pointindex) {
		this.pointindex = pointindex;
	}
}
