package ServletFiles;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

import Beans.*;
import DatabaseFiles.*;


/**
 * Servlet implementation class SRoomwiseReport
 */
@WebServlet("/SRoomwiseReport")
public class SRoomwiseReport extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SRoomwiseReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		   out.println("<html>");
		   out.println("<head><title>Roomwise Reports</title></head>");
	       out.print("<body bgcolor='#E0FFFF'>");
	      
	     response.setContentType("text/html");
		 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
		 response.setHeader("Pragma", "no-cache");	  //HTTP 1.0    
		 response.setHeader("Expires", "0");  	//	Proxies 	
		 
		 out.print("<marquee  behavior=alternate>");
   
					HttpSession session=request.getSession(true);
		            		           
					   if(session.getAttribute("username")==null){
							response.sendRedirect("AdminLogin.jsp");
							}
					       else if(session!=null)	{
							String username=(String) session.getAttribute("username");
							out.println("Hello ,  "+username);
							}
		
		  
		   out.print("</marquee>");			   
	       String username=(String) session.getAttribute("username");
	       String roomname=request.getParameter("roomname");
	      
	       out.print("<center><table><tr><td><h1>Roomwise Bookings</h1></td><td></td><td></td><td></td><td></td><td><form action='Reports.jsp'><input type='submit' value='Back to Reports'/></form></td></table>");
	       out.print("<table border='1px solid black' height='10%' width='70%'><tr>");
	       out.print("<th style='background-color:#2874A6', text-color:'red'>Room Name</th>	<th style='background-color:#2874A6'>Emp ID</th> <th style='background-color:#2874A6'>Emp Name</th>");
	       out.print("<th style='background-color:#2874A6'>Email</th> 	<th style='background-color:#2874A6'>Check In</th> <th style='background-color:#2874A6'>Check Out</th>");
	       out.print("<th style='background-color:#2874A6'>Purpose</th>		<th style='background-color:#2874A6'>Remarks</th></tr>");
	      
	
	       ArrayList<BookingRoomBean> list= BookingRoomDatabase.getRoombookingbyName(roomname);
	       for (BookingRoomBean apps : list) {
	    	   out.print("<tr style='background-color:white'><td>"+apps.getRname()+"</td><td>"+apps.getEid()+"</td>");
	    	   out.print("<td>"+apps.getName()+"</td><td>"+apps.getEmail()+"</td>");
		       out.print("<td>"+apps.getCheck_in()+"</td><td>"+apps.getCheck_out()+"</td>");
		       out.print("<td>"+apps.getPurpose()+"</td><td>"+apps.getRemarks() +"</td>");
		      
	       }
//	       else	{
//	    	   out.print("<h3> Please Enter your Correct Id </h3>");
//	       }
	    
		   out.print("</table>");
		   out.print("</div></center>");
		  
	       out.print("</body>");
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
