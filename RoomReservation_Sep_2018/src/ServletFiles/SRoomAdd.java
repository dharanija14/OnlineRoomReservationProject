package ServletFiles;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Beans.RoomBean;
import DatabaseFiles.RoomDatabase;
import java.util.*;

/**
 * Servlet implementation class SRoomAdd
 */
@WebServlet("/SRoomAdd")
public class SRoomAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SRoomAdd() {
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
	      out.println("<title>Room Booking </title>");
	      out.println("</head>");
	      out.println("<body>");
		
		
		String roomid = request.getParameter("roomid");
		String roomname = request.getParameter("roomname");
		String roomfloor = request.getParameter("roomfloor");
		String roomstatus = request.getParameter("roomstatus");
		
		RoomBean roomBean = new RoomBean();
		roomBean.setRoomid(roomid);
		roomBean.setRoomname(roomname);
		roomBean.setFloor(roomfloor);
		roomBean.setStatus(roomstatus);
	
		
			
		int status = RoomDatabase.Save(roomBean);
		
		if(status > 0) {
			out.println("<h3><center>Details Added Successfully</center></h3>");
			 request.getRequestDispatcher("AddRoom.jsp").include(request, response); 
	          }else{  
	        	 out.println("<center><h3>Sorry! unable to save record </h3></center>");  
	          }  
	          
	        out.close();  
	    
		out.print("<br></body>");
		out.print("</head>");
		out.print("</html>");	
	}
	
}
