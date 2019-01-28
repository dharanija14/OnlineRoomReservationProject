package DatabaseFiles;
import Beans.*;
import ConnectionClass.ConnectionProvider;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;
public class BookingRoomDatabase {
	public static int Save(BookingRoomBean ag) {
		int status =0;
		String feedback="Available";
		String avail="";
 		boolean res = false;;
		
		try {
			Connection conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			PreparedStatement psk=conn.prepareStatement("select rstatus from room where roomname=?");
	 		psk.setString(1,ag.getRname());
	 	    
	 		
	 		
	 		ResultSet rs = psk.executeQuery();
	 		while(rs.next()) {
	 			avail = rs.getString("rstatus");
	 			System.out.println(avail);
	 			System.out.println(feedback);
	 			if(feedback.equalsIgnoreCase(avail)) {

	 				PreparedStatement ps = conn.prepareStatement("insert into roombooking(book_id,eid,name,email,roomname,check_in,check_out,purpose,remarks)values(book.nextval,?,?,?,?,?,?,?,?)");
	 				
	 				ps.setString(1, ag.getEid());
	 				ps.setString(2, ag.getName());
	 				ps.setString(3, ag.getEmail());
	 				ps.setString(4, ag.getRname());
	 				ps.setString(5, ag.getCheck_in());
	 				ps.setString(6, ag.getCheck_out());
	 				ps.setString(7, ag.getPurpose());
	 				ps.setString(8, ag.getRemarks());
	 				
	 					    
	 			    status = ps.executeUpdate();
	 			    
	 			    
	 			  
	 				PreparedStatement pss = conn.prepareStatement("update room set rstatus='unavailable' where roomname=?");
	 				pss.setString(1, ag.getRname());
	 				
	 				status=pss.executeUpdate();
	 				
	 				conn.commit();
	 			    
	 			   
	 			}else {
		 			status = 0;
		 		}	
	 		}	
	 		 conn.close();
	 		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return status;
	}
	
	public static int Saves(BookingRoomBean ag) {
		int status =0;
				
		try {
			Connection conn = ConnectionProvider.getConnection();
		
	 				PreparedStatement ps = conn.prepareStatement("insert into reportsview(eid,name,email,roomname,check_in,check_out,purpose,remarks)values(?,?,?,?,?,?,?,?)");			
	 				ps.setString(1, ag.getEid());
	 				ps.setString(2, ag.getName());
	 				ps.setString(3, ag.getEmail());
	 				ps.setString(4, ag.getRname());
	 				ps.setString(5, ag.getCheck_in());
	 				ps.setString(6, ag.getCheck_out());
	 				ps.setString(7, ag.getPurpose());
	 				ps.setString(8, ag.getRemarks());
	 				
	 					    
	 			    status = ps.executeUpdate();   
	 			 	 				
	 				conn.commit();
	 			    
	 		
	 		 conn.close();
	 		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return status;
	}
	
	
	public static int Delete( String id) {
		int status =0;
		try {
			
			
			Connection conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement("delete from roombooking where roomname=?");
			ps.setString(1,id);
					
			status = ps.executeUpdate();
			
			PreparedStatement pss = conn.prepareStatement("update room set rstatus='available' where roomname=?");
			pss.setString(1, id);
			
			status=pss.executeUpdate();
			
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	
	
	 public static ArrayList<BookingRoomBean> getAppointById(String id)
	 {
	 	ArrayList<BookingRoomBean> list=new ArrayList<>();
	 	try {
	 		Connection con=ConnectionProvider.getConnection();
	 		PreparedStatement ps=con.prepareStatement("select * from roombooking where eid=?");
	 		ps.setString(1,id);
	 		ResultSet rs=ps.executeQuery();
	 		while (rs.next()) {
	 			BookingRoomBean app=new BookingRoomBean();
	 			app.setBookid(rs.getInt(1));
	 			app.setEid(rs.getString(8));
	 			app.setName(rs.getString(2));
	 			app.setEmail(rs.getString(3));
	 			app.setRname(rs.getString(9));
	 			app.setCheck_in(rs.getString(4));
	 			app.setCheck_out(rs.getString(5));
	 			app.setPurpose(rs.getString(6));
	 			app.setRemarks(rs.getString(7));
	 				

	 			list.add(app);
	 		}
	 	} catch (Exception e) {
	 		e.printStackTrace();
	 	}
	 	return list;
	 }
	 
	 public static List<BookingRoomBean>getAllRoomBookings(){
			List<BookingRoomBean> list = new ArrayList<BookingRoomBean>();
			
			try {
				Connection conn = ConnectionProvider.getConnection();
				PreparedStatement ps = conn.prepareStatement("select * from roombooking order by book_id");
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					BookingRoomBean bb = new BookingRoomBean();
					bb.setBookid(rs.getInt(1));	
		 			bb.setName(rs.getString(2));
		 			bb.setEmail(rs.getString(3));
		 			bb.setCheck_in(rs.getString(4));
		 			bb.setCheck_out(rs.getString(5));
		 			bb.setPurpose(rs.getString(6));
		 			bb.setRemarks(rs.getString(7));
		 			bb.setRname(rs.getString(9));				 		
		 			bb.setEid(rs.getString(8));
					
		 			list.add(bb);
									
				}
				conn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
	 
	 public static List<BookingRoomBean>getAllReports(){
			List<BookingRoomBean> list = new ArrayList<BookingRoomBean>();
			
			try {
				Connection conn = ConnectionProvider.getConnection();
				PreparedStatement ps = conn.prepareStatement("select * from reportsview order by eid");
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					BookingRoomBean bb = new BookingRoomBean();
					
		 			bb.setName(rs.getString(1));
		 			bb.setEmail(rs.getString(2));
		 			bb.setCheck_in(rs.getString(3));
		 			bb.setCheck_out(rs.getString(4));
		 			bb.setPurpose(rs.getString(5));
		 			bb.setRemarks(rs.getString(6));
		 			bb.setRname(rs.getString(8));				 		
		 			bb.setEid(rs.getString(7));
					
		 			list.add(bb);
									
				}
				conn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
	 
	 
	 public static ArrayList<BookingRoomBean> getRoombookingbyName(String name)
	 {
		 ArrayList<BookingRoomBean> list=new ArrayList<>();
		 try {
			 Connection conn = ConnectionProvider.getConnection();
			 PreparedStatement ps = conn.prepareStatement("select * from reportsview where roomname=?");
			 ps.setString(1, name);
			 
			 
			 ResultSet rs = ps.executeQuery();
			 while(rs.next()) {
				 BookingRoomBean dg=new BookingRoomBean();
				 dg.setName(rs.getString(1));
				 dg.setEmail(rs.getString(2));
				 dg.setCheck_in(rs.getString(3));
				 dg.setCheck_out(rs.getString(4));
				 dg.setPurpose(rs.getString(5));
				 dg.setRemarks(rs.getString(6));
				 dg.setEid(rs.getString(7));
				 dg.setRname(rs.getString(8));
				 
				 list.add(dg);
				 
			 }
			 conn.close();
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		 
		 return list;
	 }
	 
	 
}
