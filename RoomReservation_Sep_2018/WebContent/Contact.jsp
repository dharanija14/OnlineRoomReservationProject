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
h1 {
	margin-top: 40px;
	font-size: 100;
	margin-left: 40%;
}

.contact table {
	width: 500px;
	height: 350px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.29);
	border-style: inset;
	margin-left: 400px;
	padding: 20px 30px;
	background-color: #f2f2f2;
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
<body bgcolor="#ADD8E6">
	<jsp:include page="Header.jsp" />
	<div class="topnav" class="containerh">
		<a href="Home.jsp">Home</a> 
		 <a href="About.jsp">About</a>
		<a href="Contact.jsp">Contact</a>
	</div>

	<br>
	<form>
		<div class="contact">
			<table>
				<tr>
					<td>Name:</td>
					<td><footer>Telanagna Academy for Skill and Knowledge</footer></td>
				</tr>
				<tr>
					<td>Site:</td>
					<td>www.task.telangana.gov.in</td>
				</tr>
				<tr>
					<td>Owned By:</td>
					<td>TASK, Govt. of Telangana</td>
				</tr>
				<tr>
					<td>Contact:</td>
					<td>XXXXXXXXXXXXXXXXXXXXXX</td>
				</tr>
				<tr>
					<td>Address:</td>
					<td>Telangana, India</td>
				</tr>
				<tr>
					<td>Email:</td>
					<td>XXXXXXXXXXXXXXXXXXXXXXX</td>
				</tr>
			</table>
		</div>
	</form>
	<br><br>
	<jsp:include page="Footer.jsp" />
</body>
</html>