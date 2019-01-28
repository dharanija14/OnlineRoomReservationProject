package ServletFiles;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Beans.*;
import DatabaseFiles.*;

/**
 * Servlet implementation class SAdminUpdate
 */
@WebServlet("/SAdminUpdate")
public class SAdminUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SAdminUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 PrintWriter out = response.getWriter();
	      response.setContentType("text/html");
	      out.println("<html>");
	      out.println("<head>");
	      out.println("<title>Employee Update </title>");
	      out.println("</head>");
	      out.println("<body>");
	      
	  		String uname = request.getParameter("username");
	        String passwrd =request.getParameter("password");
			
		
			
			AdminBean ab = new AdminBean();
			ab.setUsername(uname);
			ab.setPassword(passwrd);
					
			
			int status = AdminValidation.Update(ab);
			if(status > 0) {
				out.println("<h3><center>Record Updated Successfully</center></h3>");
				 request.getRequestDispatcher("AdminHome.jsp").include(request, response); 
			}
			else {
				out.println("Sorry! unable to update record"); 
			}
			 out.close();  
			    
				
				out.print("<br></body>");
				out.print("</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
