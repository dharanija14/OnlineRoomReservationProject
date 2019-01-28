package DatabaseFiles;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Beans.EmployeeBean;
import Beans.RoomBean;
import ConnectionClass.ConnectionProvider;
public class RoomDatabase {
	public static int Save(RoomBean rb) {
		int status = 0;
		
		try {
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement ps = conn.prepareStatement("insert into room (roomid,roomname,roomfloor,rstatus)values(?,?,?,?)");
		ps.setString(1, rb.getRoomid());
		ps.setString(2, rb.getRoomname());
		ps.setString(3, rb.getFloor());
		ps.setString(4, rb.getStatus());
	
	   status = ps.executeUpdate();
	   
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
			PreparedStatement ps = conn.prepareStatement("delete from room where roomid=?");
			ps.setString(1,id);
			
			status = ps.executeUpdate();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	
	public static List<RoomBean> getAllRooms(){
		 List<RoomBean> list = new ArrayList<RoomBean>();
		 
		 try {
			 Connection conn = ConnectionProvider.getConnection();
			  PreparedStatement ps = conn.prepareStatement("select * from room order by roomid");
			  ResultSet rs = ps.executeQuery();
			  while(rs.next()) {
				  RoomBean rb = new RoomBean();
				  rb.setRoomid(rs.getString(1));
				  rb.setRoomname(rs.getString(2));
				  rb.setStatus(rs.getString(3));
				  rb.setFloor(rs.getString(4));
				 
				  
				  list.add(rb);
			  }
			  conn.close();
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		 return list;
	 }
	
	public static RoomBean getRoom(String id) {
		 
		RoomBean rb = new RoomBean();
		 try {
			 Connection conn = ConnectionProvider.getConnection();
			 PreparedStatement ps = conn.prepareStatement("select * from room where roomid=?");
			 ps.setString(1, id);
			 
			 
			 ResultSet rs = ps.executeQuery();
			 while(rs.next()) {
				 rb.setRoomid(rs.getString(1));  
	             rb.setRoomname(rs.getString(2));  
	             rb.setFloor(rs.getString(3));  
	             rb.setStatus(rs.getString(4));
	          
			 }
			 conn.close();
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		 
		 return rb;
	 }
}
