package DatabaseFiles;
import java.sql.Connection;

import java.sql.ResultSet;

import Beans.*;

import java.sql.PreparedStatement;

import ConnectionClass.ConnectionProvider;
public class AdminValidation {
	public static boolean Validate(String username,String password) {
		boolean status = false;
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from adminlog where username=? and passwrd=?");
			 ps.setString(1,username);  
			 ps.setString(2,password);
			 
			ResultSet rs = ps.executeQuery();
			status = rs.next(); // This returns true if the values are present in the database;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public static int Update(AdminBean eb) {
		int status = 0;
		
		try {
			
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement ps = conn.prepareStatement("update adminlog set passwrd=? where username=?");
			ps.setString(1 ,eb.getPassword());
			ps.setString(2 ,eb.getUsername());
			
		
			
			status = ps.executeUpdate();
			System.out.println(status);
			
			conn.close();
			
	         
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
}
