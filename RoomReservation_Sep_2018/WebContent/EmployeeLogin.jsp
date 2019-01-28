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

/* Full-width input fields */
.reg input[type=text], input[type=password] {
	width: 300px;
	height: 30px;
	padding: 10px;
	margin: 5px 0 22px 0;
	display: inline-block;
	border: none;
	background:#d0d3d4;
	border-radius:15px; 
}

.reg input[type=text]:focus, input[type=password]:focus {
	background-color: #ddd;
	outline: none;
}
/* Set a style for all buttons */
button {
	background-color: #4CAF50;
	color: black;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	border-radius:15px; 
	width: 100%;
	opacity: 0.9;
}

button:hover {
	opacity: 1;
}
/* Float cancel and signup buttons and add an equal width */
	.signupbtn {
	float: left;
	width: 50%;
}
/* Clear floats */
.clearfix::after {
	content: "";
	clear: both;
	display: table;
}

.reg table {
	width: 300px;
	height: 35px;
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
</style>
 
</head>
<body bgcolor="white">
	<jsp:include page="Header.jsp" />
	<div class="topnav">
		<a href="Home.jsp">Home</a>
		<a href="About.jsp">About</a>
		<a href="Contact.jsp">Contact</a> 
	</div>


	<center>
		<br>
		<h1>Employee Login</h1>
		<hr>
		<br>
		<form action="SEmployeeLog" method="post">
			<div class="reg">
				<table>
					<tr>
						<td><b>Emp_ID</b></td>
						<td><input type="text" placeholder="Enter Employee ID" name="username"
							required></td>
					</tr>
					<tr>
						<td><b>Password</b></td>
						<td><input type="password" placeholder="Enter Password"
							name="password" required></td>
					</tr>
					<tr>
						<td></td>
						<td><button class="clearfix" type="submit" class="signupbtn">Login</button></td>
					</tr>
		
				</table>
			</div>
		</form>
		<br><br><br>
	</center>
	<jsp:include page="Footer.jsp" />
</body>
</html>