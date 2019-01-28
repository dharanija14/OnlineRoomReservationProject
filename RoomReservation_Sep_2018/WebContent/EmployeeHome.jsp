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
    	height: 40px;
    	background-color:#616a6b;
    	width: 180px;
    	text-align: center;
    	line-height: 40px;
    	color:yellow;
    	border-radius:30px;
    	cursor: pointer;
    	text-decoration: none;
		color: #58d68d;
	}
			
	 .reg td	{
   		text-align: center;
   		font-size:20px ;
  		   }
  	
.text-block {
		position: absolute;
		bottom: 130px;
    	right:40px;
    	background-color: lightgreen;
    	color: white;
    	padding-left: 80px;
    	padding-right: 80px;
    	border-radius:30px;
    	font-size: 20px;
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
        width: 500px; height: 425px; border-style:50px;background-color:floralwhite;border-radius:20px;
        }    
    .reg input[type="email"],input[readonly="readonly"],input[type="number"],input[type="text"],input[type="password"],input[type="datetime-local"],select {	
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

</head>
<body bgcolor="white">
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
			<a onclick="clickAlert()" href="EmployeeHome.jsp"> <li class="roundbox">Logout</li></a>
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
 					
				
		
				%> </marquee></li> 
	</ul>
		<%  
			
			List <RoomBean> list = RoomDatabase.getAllRooms();
			request.setAttribute("list",list);  
		%>  
	
	
		
		<center>	
		<h1>Book Room</h1>
		<div class="reg">
		<form action="SBookingRoom" method="get">
		<table>
		<tr><td></td></tr>
		
		<tr><td>Emp ID:</td><td><input readonly="readonly" name="empid" value="<% out.print(username); } %>" ></td></tr>
				
		<tr><td>Name:</td><td><input type="text" name="name" placeholder="Name" required></td></tr>
		
		<tr><td>Email:</td><td><input type="email" name="email" placeholder="Enter Your Email"></td></tr>
		
		
		<tr><td>Room Name:</td><td><select name="roomname" required>
		<c:forEach items="${list}" var="d"> 
		<option >${d.getRoomname()}</option>
		</c:forEach></select></td></tr>
		
		<tr><td>Check-In Time</td><td><input type="datetime-local" name="checkin"  required></td></tr>x
		
		<tr><td>Check-Out Time</td><td><input type="datetime-local" name="checkout" min="checkin" required></td> </tr>
		
		<tr><td>Purpose of Booking</td><td><textarea id="purpose" name="purpose" placeholder="Purpose of Booking"
						style="height: 80px; width: 300px;" required></textarea></td></tr>
		
		<tr><td>Remarks</td><td><textarea name="remarks" placeholder="If any Remarks.." ></textarea></td></tr>
		
		<tr><td><td><input type="submit" onclick="clickAlert()" value="Submit"></td></tr>
	</table>
	</form>
	</div>
	</center>
	
	<hr	>
	<br>
	</div>
	
	
	
	<jsp:include page="Footer.jsp" />  
</body>
</html>