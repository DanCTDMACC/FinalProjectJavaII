package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;
import model.AccountDao;
import model.AccountDaoInDatabase;

/**
 * Servlet implementation class InsertAccountServlet
 */
@WebServlet("/InsertAccountServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		String firstName = request.getParameter("firstname");
		String lastName = request.getParameter("lastname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Account acc = new Account(lastName, firstName, email, password);
		AccountDao dao = new AccountDaoInDatabase();
		
		try {
			dao.insertAccount(acc);
			acc = dao.findAccountByEmail(email);
			HttpSession session = request.getSession();
			session.setAttribute("account", acc);
			getServletContext().getRequestDispatcher("/viewaccount").forward(request, response);
		} catch (Exception e) {
			String errorMessage = e.getLocalizedMessage();
			request.setAttribute("errorMessage", errorMessage);
			getServletContext().getRequestDispatcher("/registerpage.jsp").forward(request, response);
		}
	}

}
