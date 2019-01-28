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
	 .container	{
       		border-radius:	20px;
       		background-color: white;
       		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.29);
       		padding: 2px;
       		      		
       		}
      	
	  .container th	{
	     	width: 140px;
	     	background-color:#2874A6;
	     	height: 25px;
	     	color: white;
	     	font-size: 20px;
  		   }	
  		.container td	{
  		   		text-align: center;
  		   		font-size:20px ;
  		   }
  		.container tr:nth-child(even)	{
  			background-color: white;
  			}
       .roundbox 	{
       	display: inline-block;
       	height: 40px;
       	background-color:#616a6b;
       	width: 160px;
       	text-align: center;
       	line-height: 40px;
       	border-radius:30px;
       	cursor: pointer;
       	text-decoration: none;
       color: #58d68d ;
       }
       .welcome	{
       		display: inline-block;
       		float: right;
       		width: 365px;
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
<%@page import="Beans.RoomBean,DatabaseFiles.RoomDatabase,java.util.*"%>
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
		
		 </marquee></li>
	</ul>
		<center>
		<h1>Room Detail's</h1>
		
		<%  
		List <RoomBean> list = RoomDatabase.getAllRooms();
		request.setAttribute("list",list);  
		%>  
		
		<table border="1px solid black">
			<tr>
				<th>Room Id</th>
				<th>Room Name</th>
				<th>Room Floor</th>
				<th>Status</th>
				<th>Delete</th>
				
				
		
			</tr>
			<c:forEach items="${list}" var="d">  
			<tr>
			<td>${d.getRoomid()}</td>
			<td>${d.getRoomname() }</td>
			<td>${d.getFloor()}</td>
			<td>${d.getStatus()}</td>  
			<td><a href="SRoomDelete?roomid=${d.getRoomid()}">Delete</a></td> 
			 
			
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