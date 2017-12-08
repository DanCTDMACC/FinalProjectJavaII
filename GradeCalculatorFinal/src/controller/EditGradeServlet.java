package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;
import model.Grade;
import model.GradeDao;
import model.GradeDaoInDatabase;

/**
 * Servlet implementation class EditGradeServlet
 */
@WebServlet("/EditGradeServlet")
public class EditGradeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditGradeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GradeDao gradeDao = new GradeDaoInDatabase();
		HttpSession session = request.getSession();
		Account acc = (Account) session.getAttribute("account");
		
		int gradeId = Integer.parseInt(request.getParameter("id"));
		int year = Integer.parseInt(request.getParameter("edityear"));
		int semesterId = Integer.parseInt(request.getParameter("editsemester"));
		String course = request.getParameter("editcourse");
		int credit = Integer.parseInt(request.getParameter("editcredit"));
		int gradeTypeId = Integer.parseInt(request.getParameter("editgrade"));
		int accountId = acc.getId();
		
		Grade toUpdate = new Grade(gradeId, accountId, year, semesterId, course, credit, gradeTypeId);
		
		gradeDao.updateGrade(toUpdate);
		getServletContext().getRequestDispatcher("/viewGrade").forward(request, response);
	}

}
