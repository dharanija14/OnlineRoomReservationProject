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
		height: 425px; 
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
	  var backspaceIsPressed = false
	    $(document).keydown(function(event){
	        if (event.which == 8) {
	            backspaceIsPressed = true
	        }
	    })
	    $(document).keyup(function(event){
	        if (event.which == 8) {
	            backspaceIsPressed = false
	        }
	    })
	    $(window).on('beforeunload', function(){
	        if (backspaceIsPressed) {
	            backspaceIsPressed = false
	            return "Are you sure you want to leave this page?"
	        }
	    })
}
</script>
</head>
<body bgcolor="white" onload="clickAlert()">
	<%@page import="DatabaseFiles.*,Beans.*,java.util.*" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<jsp:include page="Header.jsp" />
	<br>
	<div class="container">

	<ul>
			<a href="EmployeeHome.jsp"> <li class="roundbox">Book Room</li></a>
			<a href="ViewRoomBooking.jsp"><li class="roundbox">View Booking</li></a>
			<a href="EmployeeProfileUpdate.jsp"> <li class="roundbox">Update Profile</li></a>
			<a href="ViewRooms.jsp"><li class="roundbox">View Rooms</li></a>
			<a onclick="clickAlert()" href="Home.jsp"><li class="roundbox">Logout</li></a>
 			<li class="welcome"><marquee behavior=alternate> 
	<% 

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
        response.setHeader("Pragma", "no-cache");	  //HTTP 1.0    
        response.setHeader("Expires", "0");  	//	Proxies 	
				
			       if(session.getAttribute("username")==null){
					response.sendRedirect("EmployeeLogin.jsp");
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
 			ResultSet prs=stat.executeQuery("select * from employee where eid='"+e+"'");
 			while(prs.next()){
 		%> 
 	<form action="SEmployeeAdd" method="get">		
	<div class="reg">
	<table>
	<tr><td></td></tr>
	<tr><td>Employee ID:</td><td><input readonly="readonly" name="empid"  value="<%=prs.getString("eid")%>"></td></tr>
	<tr><td>First Name:</td><td><input type="text" name="efname"  value="<%=prs.getString("f_name")%>"></td></tr>
	<tr><td>Middle Name:</td><td><input type="text" name="emname"  value="<%=prs.getString("m_name")%>"></td></tr>
	<tr><td>Last Name:</td><td><input type="text" name="elname"  value="<%=prs.getString("l_name")%>"></td></tr> 
	<tr><td>Department:</td><td><input readonly="readonly" name="dept"  value="<%=prs.getString("department")%>"></td></tr>
	<tr><td>DOJ:</td><td><input readonly="readonly" name="doj"  value="<%=prs.getString("doj")%>"></td></tr>
	<tr><td>Email</td><td><input  type="email" name="email" value="<%=prs.getString("email")%>" required></td></tr>
	<tr><td>Password:</td><td><input type="password" value="<%=prs.getString("passwrd")%>" name="password" placeholder="****" required="required" id="mypassword"></td></tr>
	<tr><td>Contact Num:</td><td><input type="tel" value="<%=prs.getString("contact_number")%>" name="contact"  pattern="^\d{10}$" required="required"></td>
	
	
		<tr><td></td><td><input type="checkbox" onclick="myFunction()">Show Password</td></tr>
		
		<tr><td></td><td><input type="submit" name="submit" value="Update"></td></tr>
	
	
	
	
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