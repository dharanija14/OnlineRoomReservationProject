<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<style type="text/css">
.container {
		border-radius: 20px;
		background-color: white;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.29);
		padding: 2px;
}
.roundbox 	{
		display: inline-block;
		color:#58d68d;
    	height: 40px;
    	background-color: #616a6b;
    	width: 180px;
    	text-align: center;
    	line-height: 40px;
    	border-radius:30px;
    	cursor: pointer;
    	text-decoration: none;
}
.reg td	{
		text-align: center;
   		font-size:20px ;
}
.welcome	{
		display: inline-block;
    	float: right;
       	width: 370px;
  		line-height: 40px;
       	border-radius:30px;
      	cursor: pointer;
}
.reg table{
		width: 500px; 
		height: 200px; 
		border-style:50px;
		background-color:floralwhite;
		border-radius:20px;
}    
.reg input[type="tel"],input[readonly="readonly"],input[type="number"],input[type="text"],input[type="password"],input[type="date"],input[type="email"],select {	
		width: 300px; height: 35px; 
}
.reg input[readonly="readonly"]	{
      	background-color: #E2EAEA;
      } 
.reg textarea   {
		width: 300px;
    	height: 50px;
    	resize:none;
}
.reg input[type="submit"]{
		width: 300px; height: 35px;  border-bottom: 2px solid black;
      	border-radius:30px;
}
option	{
		font-size:20px;
      	font-family: cursive;
}
</style>
<script>
		function myFunction() {
    	var x = document.getElementById("mypassword");
    	if (x.type === "password") {
        x.type = "text";
    	} else {
        x.type = "password";
    }
}
</script>
<script>
function clickAlert() {
    alert("Are you sure u want to Logout");
}
</script>
</head>
<body bgcolor="white">
	<%@page import="DatabaseFiles.*,Beans.*,java.util.*" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<jsp:include page="Header.jsp" />
	<br>
	<div class="container">
	<ul>
		<a href="AddEmployee.jsp"><li class="roundbox">Add Employee</li></a>
		<a href="AdminHome.jsp"><li class="roundbox">Employee Details</li></a>	
		<a href="Changepassword.jsp"><li class="roundbox">Change Password</li></a>
		<a href="AddRoom.jsp"><li class="roundbox">Add Room</li></a>
		<a href="RoomDetails.jsp"><li class="roundbox">Room Details</li></a>
		<a href="ViewAllBookings.jsp"><li class="roundbox">View Bookings</li></a>
		<a href="Reports.jsp"><li class="roundbox">Reports</li></a>
		<a onClick="clickAlert()"href="AdminLogin.jsp"><li class="roundbox">Logout</li></a>
		<li class="welcome"><marquee behavior=alternate>
		<% 

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
        response.setHeader("Pragma", "no-cache");	  //HTTP 1.0    
        response.setHeader("Expires", "0");  	//	Proxies 	
				
			       if(session.getAttribute("username")==null){
					response.sendRedirect("AdminLogin.jsp");
					}
			       else if(session!=null)	{
					String username=(String) session.getAttribute("username");
					out.println("Hello ,  "+username);
					}
				
		
				%> </marquee></li>
	</ul>
	<center>
		<h1>Update Profile</h1>
		<hr>
		
	<%@page import="java.sql.*,ConnectionClass.*" %>
 		<% 
			try{
			Connection conn=ConnectionProvider.getConnection();
			Statement stat=conn.createStatement();
 			String e=(String)session.getAttribute("username");
 			ResultSet prs=stat.executeQuery("select * from adminlog where username='"+e+"'");
 			while(prs.next()){
 		%> 
 	<form action="SAdminUpdate" method="get">		
	<div class="reg">
	<table>
	<tr><td></td></tr>
	<tr><td>Email</td><td><input readonly="readonly" name="username" value="<%=prs.getString("username")%>" required></td></tr>
	<tr><td>Password:</td><td><input type="password" value="<%=prs.getString("passwrd")%>" name="password" placeholder="****" required="required" id="mypassword"></td></tr>
	<tr><td></td><td><input type="checkbox" onclick="myFunction()">Show Password</td></tr>
	<tr><td></td><td><input type="submit" name="submit" value="Update"/></td></tr>
	</table>
	</div>
	</form>
	</center>
		<%
		}
 			conn.close();
			}
 				catch(Exception e){
 				e.printStackTrace();			
 			}
 		%> 
	<br>
	</div>
	
	<br>
	
 		<jsp:include page="Footer.jsp" /> 
</body>
</html>