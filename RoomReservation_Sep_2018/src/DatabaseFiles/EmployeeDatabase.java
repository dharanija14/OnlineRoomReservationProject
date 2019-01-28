package DatabaseFiles;
import Beans.EmployeeBean;

import ConnectionClass.ConnectionProvider;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;
public class EmployeeDatabase {
	public static boolean Validate(String username,String password) {
		boolean status = false;
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from employee where eid=? and passwrd=?");
			 ps.setString(1,username);  
			 ps.setString(2,password);
			 
			ResultSet rs = ps.executeQuery();
			status = rs.next(); // This returns true if the values are present in the database;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	
	
	public static int Save(EmployeeBean dg) {
		int status = 0;
		
		try {
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement ps = conn.prepareStatement("insert into employee (eid,f_name,m_name,l_name,department,doj,contact_number,email,passwrd,remarks)values(?,?,?,?,?,?,?,?,?,?)");
		
		ps.setString(1, dg.getEid());
		ps.setString(2, dg.getEfname());
		ps.setString(3, dg.getEmname());
		ps.setString(4, dg.getElname());
		ps.setString(5, dg.getDepartment());
		ps.setString(6, dg.getDoj());
		ps.setString(7, dg.getContact());
		ps.setString(8, dg.getEmail());
		ps.setString(9, dg.getPassword());
		ps.setString(10,dg.getRemarks());
		
		

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
			PreparedStatement ps = conn.prepareStatement("delete from employee where eid=?");
			ps.setString(1,id);
			
			status = ps.executeUpdate();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	
	
	public static List<EmployeeBean> getAllEmployees(){
		 List<EmployeeBean> list = new ArrayList<EmployeeBean>();
		 
		 try {
			 Connection conn = ConnectionProvider.getConnection();
			  PreparedStatement ps = conn.prepareStatement("select * from employee");
			  ResultSet rs = ps.executeQuery();
			  while(rs.next()) {
				  EmployeeBean dg = new EmployeeBean();
				  dg.setEid(rs.getString(1));
				  dg.setEfname(rs.getString(2));
				  dg.setEmname(rs.getString(3));
				  dg.setElname(rs.getString(4));
				  dg.setDepartment(rs.getString(5));
				  dg.setDoj(rs.getString(6));
				  dg.setContact(rs.getString(7));
				  dg.setEmail(rs.getString(8));
				  dg.setPassword(rs.getString(9));
				  dg.setRemarks(rs.getString(10));
				  
				  list.add(dg);
			  }
			  conn.close();
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		 return list;
	 }
	
	
	public static int Update(EmployeeBean eb) {
		int status = 0;
		
		try {
			
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement ps = conn.prepareStatement("update employee set f_name=?,m_name=?,l_name=?,contact_number=?,email=?,passwrd=? where eid=?");
			
			ps.setString(1 ,eb.getEfname());
			ps.setString(2, eb.getEmname());
			ps.setString(3, eb.getElname());
			ps.setString(4, eb.getContact());
			ps.setString(5, eb.getEmail());
			ps.setString(6, eb.getPassword());		
			ps.setString(7, eb.getEid());
			
			status = ps.executeUpdate();
			System.out.println(status);
			
			conn.close();
			
	         
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	
		
		

}
