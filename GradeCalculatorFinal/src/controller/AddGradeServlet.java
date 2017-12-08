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
 * Servlet implementation class AddGradeServlet
 */
@WebServlet("/AddGradeServlet")
public class AddGradeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddGradeServlet() {
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
		HttpSession session = request.getSession();
		Account acc = (Account) session.getAttribute("account");
		
		int year = Integer.parseInt(request.getParameter("addyear"));
		int semesterId = Integer.parseInt(request.getParameter("addsemester"));
		String course = request.getParameter("addcourse");
		int credit = Integer.parseInt(request.getParameter("addcredit"));
		int gradeTypeId = Integer.parseInt(request.getParameter("addgrade"));
		int accountId = acc.getId();
		
		Grade accToAdd = new Grade(accountId, year, semesterId, course, gradeTypeId, credit);
		GradeDao dao = new GradeDaoInDatabase();
		dao.insertGrade(accToAdd);
		getServletContext().getRequestDispatcher("/viewgrade").forward(request, response);
	}

}
