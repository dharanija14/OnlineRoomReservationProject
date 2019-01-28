package ServletFiles;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import Beans.EmployeeBean;
import DatabaseFiles.EmployeeDatabase;
/**
 * Servlet implementation class SEmployeeAdd
 */
@WebServlet("/SEmployeeAdd")
public class SEmployeeAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SEmployeeAdd() {
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
	      
	  		String eid = request.getParameter("empid");
	        String fname =request.getParameter("efname");
			String mname=request.getParameter("emname");
			String lname =request.getParameter("elname");
			String email =request.getParameter("email");
			String password =request.getParameter("password");
			String contact = request.getParameter("contact");
		
			
			EmployeeBean pg = new EmployeeBean();
			pg.setEid(eid);
			pg.setEfname(fname);
			pg.setEmname(mname);
			pg.setElname(lname);
			pg.setEmail(email);
			pg.setPassword(password);
			pg.setContact(contact);
			
			
			
			int status = EmployeeDatabase.Update(pg);
			if(status > 0) {
				out.println("<h3><center>Record Updated Successfully</center></h3>");
				 request.getRequestDispatcher("EmployeeHome.jsp").include(request, response); 
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
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Employee Registration </title>");
		out.println("<body>");
		
		String empid = request.getParameter("empid");
		String efname = request.getParameter("efname");
		String emname = request.getParameter("emname");
		String elname = request.getParameter("elname");
		String department = request.getParameter("edept");
		String doj = request.getParameter("day");
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		String contact = request.getParameter("contact");
		String remar = request.getParameter("remarks");
		
		
		
		
		EmployeeBean employeeBean = new EmployeeBean();
		employeeBean.setEid(empid);
		employeeBean.setEfname(efname);
		employeeBean.setEmname(emname);
		employeeBean.setElname(elname);
		employeeBean.setDepartment(department);
		employeeBean.setDoj(doj);
		employeeBean.setContact(contact);
		employeeBean.setEmail(email);
		employeeBean.setPassword(pass);
		employeeBean.setRemarks(remar);
	
		
		
		int status = EmployeeDatabase.Save(employeeBean);
		
		if(status > 0) {
			 out.println("<center><h3>Record saved successfully!</h3></center> ");  
			 out.print("<br>");
	            request.getRequestDispatcher("AddEmployee.jsp").include(request, response);  
	          }else{  
	        	 out.println("<center><h3>Sorry! unable to save record </h3></center>");  
	          }  
	          
	        out.close();  
	    
		out.print("<br></body>");
		out.print("</head>");
		out.print("</html>");	
	}
}
