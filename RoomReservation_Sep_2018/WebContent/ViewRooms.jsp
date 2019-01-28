<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<style>
table {
		border-collapse: collapse;
    	border-spacing: 0;
    	width: 90%;
    	border: 1px solid #ddd;
}
th	{
		width: 140px;
	    height: 25px;
	    font-size: 20px;
	    background-color: #2874A6;
	    color: white;
}
td{
		width: 140px;
	    height: 25px;
	    font-size: 20px;
		text-align: center;
}
tr:nth-child(even) {
		background-color: yellow;
}
mark {
		background: orange;
  		color: black;
}
.text-block {
		position: absolute;
    	bottom: 490px;
    	right:40px;
    	background-color: lightgreen;
    	color: white;
    	padding-left: 80px;
    	padding-right: 80px;
    	border-radius:30px;
    	font-size: 10px;
}
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/mark.js/7.0.0/jquery.mark.min.js"></script>
<jsp:include page="Header.jsp" />
	<br>
	<div class="container" id="context">

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
	

</head>
<body bgcolor="white">
	<%@page import="Beans.*,DatabaseFiles.*,java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<center><h1>Rooms List</h1></center>
<hr>
<h2><p>Choose Room ID for booking the Room</p></h2>

<script>
$(function() {
$("input").on("input.highlight", function() {
	    // Determine specified search term
	    var searchTerm = $(this).val();
	    // Highlight search term inside a specific context
$("#context").unmark().mark(searchTerm);
	  }).trigger("input.highlight").focus();
	});
</script>
<div class="text-block">
<table style="width: 10px; height: 20px; border: 0;">
<tr><td style="font-size: 30px;color: black;">Search </td><td><input type="text" placeholder="search for specialty"></td></tr></table>
</div>

		<%  
			List<RoomBean> list=RoomDatabase.getAllRooms();  
			request.setAttribute("list",list);  
		%>  

<center><table border="1px solid black">
			<tr>
				<th>Room Id</th>
				<th>Room Name</th>
				<th>Room Floor</th>
				<th>Status</th>
				<th>Book</th>
				
				
		
			</tr>
			<c:forEach items="${list}" var="d">  
			<tr>
			<td>${d.getRoomid()}</td>
			<td>${d.getRoomname() }</td>
			<td>${d.getFloor()}</td>
			<td>${d.getStatus()}</td>  
			<td><a href="EmployeeHome.jsp">Book</a></td> 
			 
			
 			</tr>  
			</c:forEach>  	
		</table></center>
		
</div>
 
 <jsp:include page="Footer.jsp" /> 
</body>
</html>