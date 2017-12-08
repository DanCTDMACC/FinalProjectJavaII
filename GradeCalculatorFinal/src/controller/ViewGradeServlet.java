package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;
import model.Grade;
import model.GradeDaoInDatabase;
import model.GradeToView;
import model.GradeTypeDaoInDatabase;
import model.SemesterDaoInDatabase;

/**
 * Servlet implementation class ViewGradeServlet
 */
@WebServlet("/ViewGradeServlet")
public class ViewGradeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewGradeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Account acc = (Account) session.getAttribute("account");
		request.setAttribute("acc", acc);
		
		// Data Access Objects.
		GradeDaoInDatabase gradeDao = new GradeDaoInDatabase();
		GradeTypeDaoInDatabase gradeTypeDao = new GradeTypeDaoInDatabase();
		SemesterDaoInDatabase semesterDao = new SemesterDaoInDatabase();
		
		request.setAttribute("gradeTypes", gradeTypeDao.findAllGradeType());
		request.setAttribute("semesters", semesterDao.findAllSemester());
		
		if (gradeDao.findGradeByAccountId(acc.getId()).isEmpty()) {
			request.setAttribute("grades", "");
		} else {
			List<Grade> grades = gradeDao.findGradeByAccountId(acc.getId());
			List<Integer> years = new ArrayList<>();
			years.add(grades.get(0).getYear());
			double totalPoints = 0;
			int totalCredits = 0;
			List<GradeToView> grViews = new ArrayList<>();
			for (Grade gr : grades) {
				if (gr.getYear() != years.get(years.size() - 1)) {
					years.add(gr.getYear());
				}
				totalCredits += gr.getCredits();
				totalPoints += (gradeTypeDao.findGradeTypeById(gr.getGradetypeid()).getPointIndex()
						* gr.getCredits());
				grViews.add(new GradeToView(gr));
			}
			double gpa = totalPoints / totalCredits;
			request.setAttribute("gpa", gpa);
			request.setAttribute("years", years);
			request.setAttribute("grades", grViews);
		}
		getServletContext().getRequestDispatcher("/gradepage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fromYearString = request.getParameter("fromyear");
		String toYearString = request.getParameter("toyear");
		String fromSemesterIdString = request.getParameter("fromsemester");
		String toSemesterIdString = request.getParameter("tosemester");
		
		if (fromYearString == null || toYearString == null || fromSemesterIdString == null ||
					toSemesterIdString == null) {
			doGet(request, response);
		}
		// Time period to get grades.
		int fromYear = Integer.parseInt(fromYearString);
		int toYear = Integer.parseInt(toYearString);
		int fromSemesterId = Integer.parseInt(fromSemesterIdString);
		int toSemesterId = Integer.parseInt(toSemesterIdString);
		
		HttpSession session = request.getSession();
		Account acc = (Account) session.getAttribute("account");
		request.setAttribute("acc", acc);
		
		// Data Access Objects.
		GradeDaoInDatabase gradeDao = new GradeDaoInDatabase();
		GradeTypeDaoInDatabase gradeTypeDao = new GradeTypeDaoInDatabase();
		SemesterDaoInDatabase semesterDao = new SemesterDaoInDatabase();
		
		request.setAttribute("gradeTypes", gradeTypeDao.findAllGradeType());
		request.setAttribute("semesters", semesterDao.findAllSemester());
		
		if (gradeDao.findGradeByAccountIdInPeriod(acc.getId(),
				fromYear, toYear, fromSemesterId, toSemesterId).isEmpty()) {
			request.setAttribute("grades", "");
		} else {
			List<Grade> grades = gradeDao.findGradeByAccountIdInPeriod(acc.getId(),
											fromYear, toYear, fromSemesterId, toSemesterId);
			List<Integer> years = new ArrayList<>();
			years.add(grades.get(0).getYear());
			double totalPoints = 0;
			int totalCredits = 0;
			List<GradeToView> grViews = new ArrayList<>();
			for (Grade gr : grades) {
				if (gr.getYear() != years.get(years.size() - 1)) {
					years.add(gr.getYear());
				}
				totalCredits += gr.getCredits();
				totalPoints += (gradeTypeDao.findGradeTypeById(gr.getGradetypeid()).getPointIndex()
						* gr.getCredits());
				grViews.add(new GradeToView(gr));
			}
			double gpa = totalPoints / totalCredits;
			request.setAttribute("gpa", gpa);
			request.setAttribute("years", years);
			request.setAttribute("grades", grViews);
		}
		getServletContext().getRequestDispatcher("/gradepage.jsp").forward(request, response);
	}

}
