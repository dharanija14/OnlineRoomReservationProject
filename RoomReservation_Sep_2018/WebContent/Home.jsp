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
.cent {
	position: relative;
	text-align: center;
}

.top-left {
	position: absolute;
	top: 30px;
	left: 120px;
	color: #3581E4;
	font-size: 30px;
}

.text-block {
	position: absolute;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.99);
	border-radius:30px;
	bottom: 130px;
	left: 80px;
	background-color: darkgray;
	color: white;
	padding-left: 80px;
	padding-right: 80px;
}
 .text-block a	{
 	color: blue;
	 	
 }		
.topnav {
	overflow: hidden;
	background-color: #21618C;
}

.topnav a {
	float: left;
	display: block;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

.topnav a:hover {
	background-color: gray;
	color: black;
}
 blink {
           color:red;
           -webkit-animation: blink 1s step-end infinite;
           animation: blink 1s step-end infinite
         }
 @keyframes blink {
         67% { opacity: 0 }
        }
	 
</style>
</head>
<body bgcolor="white">
	<jsp:include page="Header.jsp" />

	<div class="topnav" class="containerh">
		<a href="Home.jsp">Home</a>
		 <a href="About.jsp">About</a>
		<a href="Contact.jsp">Contact</a>
	</div>
	
<marquee behavior=alternate style="font-size: 30px;color: #3581E4;" onmouseover="this.stop();" onmouseout="this.start();"><blink> &#9733</blink> Welcome to Internal Room Reservation System
	</marquee>

	<div class="cent">
		<img src="Images/Homepic.jpg" alt=""
			style="width: 1200px; height: 320px;">
		<div class="top-left">Choose your login</div>
		<div class="text-block">
			<a href="AdminLogin.jsp">
				<h2>Admin Login</h2>
			</a> <a href="EmployeeLogin.jsp">
				<h2>Employee Login</h2>
			</a>
		</div>
	</div>
	<jsp:include page="Footer.jsp" />
</body>
</html>