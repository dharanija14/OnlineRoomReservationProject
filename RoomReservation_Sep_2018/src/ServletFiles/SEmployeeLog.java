package ServletFiles;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DatabaseFiles.AdminValidation;
import DatabaseFiles.EmployeeDatabase;

/**
 * Servlet implementation class SEmployeeLog
 */
@WebServlet("/SEmployeeLog")
public class SEmployeeLog extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SEmployeeLog() {
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
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>AdminHome</title>");
		out.println("</head>");
		out.println("<body>");
		
		String empid = request.getParameter("username");
		String password = request.getParameter("password");
		
		System.out.println("Entered Username is: " +empid + "Password is: " +password);
		
		if(EmployeeDatabase.Validate(empid, password)) {
			    out.println("Welcome: "+empid);
	            HttpSession session=request.getSession(true);
	            session.setAttribute("username",empid);
	            response.sendRedirect("EmployeeHome.jsp");
		}else {

      	  RequestDispatcher rd=request.getRequestDispatcher("Error.jsp");  
	            rd.forward(request,response);  
		}
		
		out.close();
		out.println("</body>");
		out.println("</html>");
	}

}
