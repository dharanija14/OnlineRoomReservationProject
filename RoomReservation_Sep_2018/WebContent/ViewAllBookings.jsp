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
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.29);
	background-color: white;
	padding: 2px;
}
	.roundbox 	{
    	display: inline-block;
    	color:#58d68d;
    	height: 40px;
    	background-color:#616a6b;
    	width: 180px;
    	text-align: center;
    	line-height: 40px;
    	border-radius:30px;
    	cursor: pointer;
    	text-decoration: none;
	}
	 .container th	{
	     	width: 140px;
	     	height: 30px;
	     	font-size: 20px;
	     	background-color: #2874A6;
	     	color: white;
  		   }
	
	.container td	{
	   		text-align: center;
	   		font-size:20px ;
	   }
	.container tr:nth-child(even)	{
		background-color: white;
		}	
	   
	   
	.welcome	{
  		display: inline-block;
    	float: right;
       	width: 370px;
  		line-height: 40px;
       	border-radius:30px;
      	cursor: pointer;
       }
   
</style>
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
		<h1>Booking Detail's</h1>
		
		<%  
			
			List <BookingRoomBean> list = BookingRoomDatabase.getAllRoomBookings();
			request.setAttribute("list",list);  
		%>  
		<center>
		<table border="1px solid black">
			<tr>
				<th>Booking ID</th>
				<th>EmpID</th>
				<th>Name</th>
	       		<th>Email</th>
	       		<th>Room Name</th>
	       		<th>Check In</th>
	       		<th>Check Out</th>
	       		<th>Purpose</th>
	       		<th>Remarks</th>
	       		<th>Cancel</th>
	       		
	       	</tr>
			<c:forEach items="${list}" var="d">  
			<tr>
			<td>${d.getBookid()}</td>
			<td>${d.getEid()}</td>
			<td>${d.getName()}</td>
			<td>${d.getEmail()}</td>  
			<td>${d.getRname()}</td>
			<td>${d.getCheck_in()}</td> 
			<td>${d.getCheck_out()}</td>
			<td>${d.getPurpose()}</td>
			<td>${d.getRemarks()}</td>
			<td><a href="SCancelBooking?rname=${d.getRname()}">Cancel</a></td> 		
 			</tr>  
			</c:forEach>
		</table>
		</center>
		<br>
	</div>
	<br>
	<jsp:include page="Footer.jsp" />
</body>
</html>