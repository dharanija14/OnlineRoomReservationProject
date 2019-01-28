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

.container th {
	width: 140px;
	height: 25px;
	font-size: 20px;
}

.container td {
	text-align: center;
	font-size: 20px;
}

	.roundbox 	{
    	display: inline-block;
    	height: 40px;
    	background-color:#616a6b;
    	width: 180px;
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
.reg table {
	width: 500px;
	height: 425px;
	margin-left: 415px;
	border-style: 50px;
	border-radius:15px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.29);
	background-color: floralwhite;
}

.reg input[type="tel"], input[type="email"], input[type="number"], input[type="text"],
	input[type="password"], input[type="date"],select {
	width: 300px;
	height: 35px;
}
 .reg option	{
      	font-size:20px;
      	font-family: cursive;
      }

.reg input[type="submit"] {
	width: 300px;
	border-radius:30px;
	height: 35px;
	border-bottom: 2px solid black;
}
</style>
<script>
  function clickAlert() {
    alert("Are you sure u want to Submit");
    HttpSession session=request.getSession();
    session.removeAttribute("username");
   	session.invalidate();
	response.sendRedirect("Home.jsp");
}
</script>
</head>
<body bgcolor="white">
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
		<a onclick="clickAlert()" href="AdminLogin.jsp"><li class="roundbox">Logout</li></a>
		<li class="welcome"><marquee  behavior=alternate>
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
			<h1>Add Room</h1>
		</center>
		<hr>
		<form action="SRoomAdd" method="post">
			<div class="reg">
				<table>
					<tr>
						<td></td>
					</tr>
					<tr>
						<td>Room ID:</td>
						<td><input type="text" name="roomid" placeholder="Room ID"
							required></td>
					</tr>
					<tr>
						<td>Room Name:</td>
						<td><input type="text" name="roomname" placeholder="Room Name"
							required></td>
					</tr>
					<tr>
						<td>Room Floor:</td>
						<td><input type="text" name="roomfloor" placeholder="Room Floor"></td>
					</tr>
					
					<tr>
						<td>Room Status:</td>
						<td><input type="text" name="roomstatus" placeholder="Status"></td>
					</tr>
					
					
					
						<td>
						<td><input type="submit" value="Submit"></td>
					</tr>
				</table>
			</div>
		</form>
		<hr>
		<br>
	</div>
	<br>
	<jsp:include page="Footer.jsp" />
</body>
</html>