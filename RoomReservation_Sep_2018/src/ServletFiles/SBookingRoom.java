package ServletFiles;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import Beans.*;
import DatabaseFiles.BookingRoomDatabase;

/**
 * Servlet implementation class SBookingRoom
 */
@WebServlet("/SBookingRoom")
public class SBookingRoom extends HttpServlet{

	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SBookingRoom() {
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
	       out.println("<title>Book Appointment</title>");
	       out.println("</head>");
	       out.print("<body>");  
	       
	        String empid = request.getParameter("empid");
	        String name =request.getParameter("name");
			String email=request.getParameter("email");
			String roomname =request.getParameter("roomname");
			String checkin=request.getParameter("checkin");
			String checkout=request.getParameter("checkout");
			String purpose =request.getParameter("purpose");
			String remarks=request.getParameter("remarks");
			
			
			BookingRoomBean ag = new BookingRoomBean();
			ag.setEid(empid);
			ag.setName(name);
			ag.setEmail(email);
			ag.setRname(roomname);
			ag.setCheck_in(checkin);
			ag.setCheck_out(checkout);
			ag.setPurpose(purpose);
			ag.setRemarks(remarks);
			
			int status = BookingRoomDatabase.Save(ag);
			int s = BookingRoomDatabase.Saves(ag);
			System.out.println(s);
			
			 if(status>0){  
				 out.println("<h3><center>Room Booked Successfully</center></h3>");
				 request.getRequestDispatcher("ViewRoomBooking.jsp").include(request, response);  
		        }else{  
		        	 out.println("<h3><center>Room is unavailable please choose from the list</center></h3>");
					 request.getRequestDispatcher("EmployeeHome.jsp").include(request, response);  
		        }  
		          
		        out.close();  
		    			
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
