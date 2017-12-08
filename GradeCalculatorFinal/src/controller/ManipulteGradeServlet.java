package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GradeDao;
import model.GradeDaoInDatabase;
import model.GradeTypeDao;
import model.GradeTypeDaoInDatabase;
import model.SemesterDao;
import model.SemesterDaoInDatabase;

/**
 * Servlet implementation class ManipulteGradeServlet
 */
@WebServlet("/ManipulteGradeServlet")
public class ManipulteGradeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManipulteGradeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		GradeDao gradeDao = new GradeDaoInDatabase();
		GradeTypeDao gradeTypeDao = new GradeTypeDaoInDatabase();
		SemesterDao semesterDao = new SemesterDaoInDatabase();
		if (action == null) {
			getServletContext().getRequestDispatcher("/viewGrade").forward(request, response);
		} else if (action.equals("Edit")) {
			request.setAttribute("gradeTypes", gradeTypeDao.findAllGradeType());
			request.setAttribute("semesters", semesterDao.findAllSemester());
			
			int gradeId = Integer.parseInt(request.getParameter("id"));
			
			request.setAttribute("grade", gradeDao.findGradetById(gradeId));
			getServletContext().getRequestDispatcher("/editgrade.jsp").forward(request, response);
		} else if (action.equals("Delete")) {
			int gradeId = Integer.parseInt(request.getParameter("id"));
			gradeDao.deleteGradeById(gradeId);
			getServletContext().getRequestDispatcher("/viewGrade").forward(request, response);
		}
	}

}
